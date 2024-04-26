/*
 * step 2
 * 
 *   UPDATE MSL BEFORE RUNNING
 *
 * update VMR records that have been renamed 
 *
 */

 -- ******************************************************************* 
 --
 -- backup VMR
 --
 -- ******************************************************************* 

select * into vmr_20240426_premsl39 from vmr


-- select * from species_historic_name_lut where last_msl=38 order by action
select action, ct_action = count(action) from species_historic_name_lut  where last_msl = 38 group by action
select * from taxonomy_node where msl_releasE_num = 39 and in_change is not null and in_change <> 'new'
select * from species_historic_name_lut  where new_msl = 39 and 'Amdoparvovirus carnivoran1' in (old_name, new_name, new_name2)
select * from species_historic_name_lut where last_msl = 38 and action = 'abolished'

select top 10  * from species_historic_name_lut  where new_msl = 39 and action = 'renamed'

select top 10  * from vmr

-- ******************************************************************* 
--
-- add admin columns to track changes
--
-- we add columns for "old", so we can continue to refer to the data, but
-- the new, updated, data will be in the "live" columns used by the website
-- and we can see the changes immediately, online
--
-- ******************************************************************* 

IF COL_LENGTH('VMR', 'change') IS NULL
BEGIN
    ALTER TABLE [VMR]
    ADD [change] varchar(255)
END
IF COL_LENGTH('VMR', 'change_proposal') IS NULL
BEGIN
    ALTER TABLE [VMR]
    ADD [change_proposal] varchar(512)
END

IF COL_LENGTH('VMR', 'old_species') IS NULL
BEGIN
    ALTER TABLE [VMR]
    ADD [old_species] varchar(255)
END
IF COL_LENGTH('VMR', 'old_taxnode_id') IS NULL
BEGIN
    ALTER TABLE VMR
    ADD [old_taxnode_id] int
END

--
-- WARNING: index old_taxonde_id, old_species
--
-- OR YOU WILL WAIT A LONG TIME
--

--
-- move "current" data into old
-- reset "change" tracking column
--
update vmr set
	change = NULL
	, change_proposal = NULL
	, old_taxnode_id = taxnode_id
	, old_species = species
from vmr

-- ******************************************************************* 
--
-- NO CHANGE species 
--
-- ******************************************************************* 

update vmr set
-- select top 10  vmr.*,
	species           = dx.name 
	, change          = 'same'
	, change_proposal = NULL
	, taxnode_id      = dx.taxnode_id
from vmr
join taxonomy_node_dx dx on 
	dx.prev_id = vmr.old_taxnode_id
	and dx.prev_name = vmr.old_species
	and dx.prev_tags = ''
	--and dx.msl_release_num = (select max(msl_release_num) from taxonomy_toc)

-- summarize changes
select change, ct_change=count(*)
from vmr 
group by vmr.change

-- ******************************************************************* 
--
--  RENAMES 
--
-- ******************************************************************* 

update vmr set
-- select top 10  vmr.*,
	species = dx.name 
	,change		 = 'renamed'
	, change_proposal = dx.prev_proposal
	, taxnode_id= dx.taxnode_id
from vmr
join taxonomy_node_dx  dx on dx.prev_id=vmr.old_taxnode_id-- and  dx.prev_name= vmr.old_species
where 
	dx.prev_tags  like '%renamed%'
	and dx.msl_release_num = (select max(msl_release_num) from taxonomy_toc)
 
-- summary
select change, ct_change=count(*)
from vmr 
group by vmr.change

-- *******************************************************************
--
-- ABOLISH species 
--
-- use taxonomy_node_delta, as abolished records are not in taxonomy_node_dx
--
-- ******************************************************************* 

update vmr set
-- select top 10  vmr.*,
	species		 = 'abolished' -- ick: sentinal value, since [species] NOT NULL
	,change		 = 'abolished'
	, change_proposal = dx.proposal
	, taxnode_id= dx.new_taxid
from vmr
join taxonomy_node_delta  dx on dx.prev_taxid=vmr.old_taxnode_id-- and  dx.prev_name= vmr.old_species
where 
	dx.is_deleted = 1 
	and dx.msl = (select max(msl_release_num) from taxonomy_toc)

-- report on abolished species WITH accessions
select
	report='abolished exemplars, with genbnak entries'
	, *
	, proposal_url='https://ictv.global/ictv/proposals/'+change_proposal 
from vmr 
where change = 'abolished'
and (
	exemplar_seq_complete <> 'No entry in Genbank' 
	or exemplar_seq_complete is null
	or exemplar_genbank_accession <> ''
)
-- summary: done
select title='vmr DONE', change, ct_change=count(*)
from vmr 
group by vmr.change
-- summary: t odo 
select title='vmr TODO', delta.tag_csv2, ct=count(*), ct_old_taxnode_id=count(old_taxnode_id)
 from taxonomy_node_delta  delta
 join  vmr on  old_taxnode_id =  delta.prev_taxid
 where change is null
 group by delta.tag_csv2
 
-- *******************************************************************
-- 
-- INSERT new species
--
-- *******************************************************************
INSERT INTO [dbo].[vmr]
           ([species]
           ,[exemplar]
           ,[exemplar_isolate]
           ,[exemplar_genbank_accession]
           ,[abbrev_csv]
           ,[taxnode_id]
		   ,[molecule]
		   ,host
		   ,exemplar_seq_complete
		   ,alternative_name_csv
		   ,change
		   ,change_proposal
		  , old_taxnode_id
		   , old_species)

--select alternative_name_csv= max(len(alternative_name_csv)) from (
SELECT 
      species=[species]
	  ,[exemplar] = 'E'
	  ,[exemplar_isolate] = [isolate_csv]
      ,[exemplar_genbank_accession]=[genbank_accession_csv]
	  ,[abbrev_csv]
	  ,[taxnode_id]=[taxnode_id]
	  ,[molecule]=inher_molecule
	  ,host=host_source
	  ,exemplar_seq_complete=gc.name
	  ,alternative_name_csv=exemplar_name
	  , change='created'
	  , change_proposal = in_filename
	  , old_taxnode_id = NULL
	  , old_species = 'created'
  FROM [taxonomy_node_names]
  JOIN [taxonomy_genome_coverage] gc on gc.genome_coverage=[taxonomy_node_names].genome_coverage
  where
	-- latest MSL
	msl_release_num = (select max(msl_release_num) from taxonomy_toc)
	AND rank = 'species' AND is_hidden = 0 
	-- not already there
	AND [taxonomy_node_names].[name] NOT IN ( select species from vmr where species is not null )

-- summary: done
select title='vmr DONE', change, ct_change=count(*)
from vmr 
group by vmr.change
-- summary: t odo 
select title='vmr TODO', delta.tag_csv2, ct=count(*), ct_old_taxnode_id=count(old_taxnode_id)
 from taxonomy_node_delta  delta
 join  vmr on  old_taxnode_id =  delta.prev_taxid
 where change is null
 group by delta.tag_csv2

 
-- *******************************************************************
-- 
-- what's left: SPLIT
--
-- 'Amdoparvovirus carnivoran1' ->  ( 'Amdoparvovirus carnivoran1','Amdoparvovirus carnivoran9','Amdoparvovirus carnivoran10')
-- 
-- The E record and 1 A record should stay with the original specices name
-- Two other A records have genbank_accessions that match the new species, and should become the E record of those species
--
 
-- *******************************************************************

-- investigate
select * from vmr where-- change is null and  -- and old_species = 'Amdoparvovirus carnivoran1'
	 old_taxnode_id in (select prev_taxid from taxonomy_node_delta where is_split=1)

select t='taxonomy_node_delta', src.name, tag_csv2, proposal,  dest.name, dest.genbank_accession_csv
from taxonomy_node_delta delta
join taxonomy_node src on src.taxnode_id = delta.prev_taxid
join taxonomy_node dest on dest.taxnode_id = delta.new_taxid
where delta.is_split = 1
and prev_taxid in (select old_taxnode_id from vmr where change is null)

select t='taxonomy_node_dx', prev_name, prev_tags, prev_proposal, name,genbank_accession_csv
from taxonomy_node_dx dx
where dx.prev_tags like '%split%'
and prev_id in (select old_taxnode_id from vmr where change is null)

select * from vmr where old_species = 'Amdoparvovirus carnivoran1'
--
-- Convert 2 A records into E records for new species
--


select vmr.*, sep='>>>>>>>>>>>>>>>>>>>>>>',
-- update  vmr set
	species =  dx.name 
	, exemplar = 'E'
	, exemplar_isolate            =  vmr.isolate_csv,               isolate_csv = NULL                   --,DX_isolate_csv =dx.isolate_csv  
	, exemplar_genbank_accession  =  isolate_genbank_accession_csv, isolate_genbank_accession_csv= NULL  --,DX_genbank= dx.genbank_accession_csv
	, exemplar_seq_complete       = isolate_seq_complete_csv,       isolate_seq_complete_csv   = NULL    --,DX_seq_complete= gc.name  
	, alternative_name_csv        = alternative_name_csv                                                 --,DX_exemplar_name = dx.exemplar_name
	, abbrev_csv                  = vmr.abbrev_csv                                                       --,DX_abbrev = dx.abbrev_csv -- isolate_abbrev is never used
	, taxnode_id = dx.taxnode_id
	, host = dx.host_source
	, molecule = mol.abbrev
	, change = 'split'
	, change_proposal = dx.prev_proposal
	-- select top 10 *
from vmr 
join taxonomy_node_dx dx on vmr.old_taxnode_id = dx.prev_id
left outer join taxonomy_genome_coverage gc  on gc.genome_coverage = dx.genome_coverage
left outer join taxonomy_molecule mol  on mol.id = dx.inher_molecule_id
where 
vmr.change is null
and 
dx.prev_tags like '%split%'
and 
vmr.exemplar = 'A'
and 
-- SAME accession
vmr.isolate_genbank_accession_csv = dx.genbank_accession_csv
and
-- DIFF name
dx.prev_name <> dx.name

-- patch MSL39 - forgot change_proposal
update vmr set --select 
	change_proposal = '2023.007D.Parvoviridae_12nsp.zip'
from vmr
where old_species='Amdoparvovirus carnivoran1' and change='split' and change_proposal is null

- 
-- SPLIT: update remaining record as a split, keeping E status
--

select vmr.*,
-- update vmr set
 -- species = dx.name  
  change = 'split'
  ,change_proposal = dx.prev_proposal
  ,taxnode_id=dx.taxnode_id
from vmr
join taxonomy_node_dx dx  on
	 vmr.old_taxnode_id =dx.prev_id
	 and  dx.prev_tags like '%split%'
	 and dx.prev_name = dx.name
where
	vmr.change is null or vmr.change_proposal is null or vmr.taxnode_id = vmr.old_taxnode_id
 

-- summary: done
select title='vmr DONE', change, ct_change=count(*)
from vmr 
group by vmr.change
-- summary: t odo 
select title='vmr TODO', delta.tag_csv2, ct=count(*), ct_old_taxnode_id=count(old_taxnode_id)
 from taxonomy_node_delta  delta
 join  vmr on  old_taxnode_id =  delta.prev_taxid
 where change is null
 group by delta.tag_csv2

 
-- *******************************************************************
-- 
-- MERGE  species
--
-- *******************************************************************
--
-- direct merges (N=2)
--

select  title='vmr TODO details'
	, vmr.vmr_uid, vmr.exemplar, vmr.exemplar_genbank_accession, vmr.isolate_genbank_accession_csv
	, delta.tag_csv2, vmr.old_species, delta.prev_taxid, delta.proposal, delta.new_taxid, tn.name
 from taxonomy_node_delta  delta
 join  vmr on  old_taxnode_id =  delta.prev_taxid
 join taxonomy_node tn on tn.taxnode_id = delta.new_taxid
 where vmr.change is null

 -- MSL39 - double check
select * from taxonomy_node_dx where msl_release_num = 39 and prev_name = 'chickpea stunt disease associated virus' or name ='Polerovirus CLDV'


--
-- MERGE : update the records that stay E records
--
-- MSL39 N=2 
-- There are two cases where two species were merged, both of which have VMR E records.
-- Z69620:  appears on phylogenetic tree in (Le Pendu 2017 JGV), while Z69620 doesn't 
-- GU167940: complete, while Y11530 is partial
select vmr.*,
--  update vmr set
  species = dx.name  
  , change = 'merge'
  , change_proposal = dx.prev_proposal
  , taxnode_id=dx.taxnode_id
from vmr
join taxonomy_node_dx dx on vmr.old_taxnode_id  = dx.prev_id
where  dx.prev_tags like '%merged%'
-- HAND_CODE_WHICH_ACCESSIONS_STAY_EXEMPLAR_E
and exemplar_genbank_accession in ('Z69620', 'GU167940')

 
 --
-- MERGE: Convert 2 E records into A records 
--


select vmr.*, sep='>>>>>>>>>>>>>>>>>>>>>>',
-- update  vmr set
	species =  dx.name 
	, exemplar = 'A'
	, isolate_csv                    = vmr.exemplar_isolate,               exemplar_isolate = NULL           -- ,DX_isolate_csv =dx.isolate_csv  
	, isolate_genbank_accession_csv  = exemplar_genbank_accession,         exemplar_genbank_accession= NULL  -- ,DX_genbank= dx.genbank_accession_csv
	, isolate_seq_complete_csv       = exemplar_seq_complete,              exemplar_seq_complete   = NULL    -- ,DX_seq_complete= gc.name  
	, alternative_name_csv           = alternative_name_csv                                                  -- ,DX_exemplar_name = dx.exemplar_name
	, abbrev_csv                     = vmr.abbrev_csv                                                        -- ,DX_abbrev = dx.abbrev_csv -- isolate_abbrev is never used
	, taxnode_id = dx.taxnode_id
	, host = dx.host_source
	, molecule = mol.abbrev
	, change = 'merged_demote'
	, change_proposal = dx.prev_proposal
	-- select top 10 *
from vmr 
join taxonomy_node_dx dx on vmr.old_taxnode_id = dx.prev_id
left outer join taxonomy_genome_coverage gc  on gc.genome_coverage = dx.genome_coverage
left outer join taxonomy_molecule mol  on mol.id = dx.inher_molecule_id
where 
vmr.change is null
and 
dx.prev_tags like '%merged%'
and 
vmr.exemplar = 'E'
and
-- DIFF name
vmr.exemplar_genbank_accession in (
	'M67473', --demote: Rabbit hemorrhagic disease virus; does not appear on phylogenetic tree in (Le Pendu 2017 JGV)
	'Y11530' -- demote: Chickpea stunt disease associated virus; partial genome:
)

-- summary: done
select title='vmr DONE', change, ct_change=count(*)
from vmr 
group by vmr.change
-- summary: t odo 
select title='vmr TODO', delta.tag_csv2, ct=count(*), ct_old_taxnode_id=count(old_taxnode_id)
 from taxonomy_node_delta  delta
 join  vmr on  old_taxnode_id =  delta.prev_taxid
 where change is null
 group by delta.tag_csv2
 


--
-- finally, 4 records got SQL-name fixed in MSL38,and the proposalProcessor.cur_taxonomy wasn't updated
-- so they regressed to their incorrect names.
-- 
-- https://uab-lefkowitz.atlassian.net/browse/IVK-228


select * from taxonomy_node_dx where prev_id = 202213428 or name = 'Alphabaculovirus altersperidaniae'
prev_name = 'Alphabaculovirus speridania-b' or name = 'Alphabaculovirus altersperidaniae' and msl_release_num=39

select * from vmr where change is null


select vmr.*, sep='>>>>#####>>>>>>',
--  update vmr set
  old_species = dx.prev_name
  , species = dx.name  
  , change = 'same'
  , change_proposal = NULL
  , taxnode_id=dx.taxnode_id
from vmr
join taxonomy_node_dx dx on vmr.old_taxnode_id  = dx.prev_id
where vmr.change is null
--and  dx.prev_tags like '%renamed%'
-- HAND_CODE_WHICH_ACCESSIONS_STAY_EXEMPLAR_E
--and exemplar_genbank_accession in ('Z69620', 'GU167940')

select prev_name, prev_tags, taxnode_id,  name, next_tags, next_name, * from taxonomy_node_dx where genbank_accession_csv in ('MT040195') and msl_releasE_num in (38,39)

select * from taxonomy_node where name like 'Alphabaculovirus crypeltas%'
 and msl_release_num in (38, 39)
 order by genbank_accession_csv, msl_release_num

update taxonomy_node set
-- select msl_release_num, taxnode_id, ictv_id, name, out_target,
	name    ='Alphabaculovirus oxochraceae'--, notes='20230901 IVK-228 name corrected from [Aphabaculovirus] to [Alphabaculovirus]'
from taxonomy_node
where name = 'Aphabaculovirus oxochraceae' and ictv_id=201856530

update taxonomy_node set
--select msl_release_num, taxnode_id, ictv_id, name, out_target,
	name='Alphabaculovirus crypeltasticae'--, notes='20230901 IVK-228 name corrected from [Alphabaculovirus crypeltasicae] to [Alphabaculovirus crypeltas[t]icae]'
from taxonomy_node
where name = 'Alphabaculovirus crypeltasicae' and ictv_id=201908662

update taxonomy_node set
--select msl_release_num, taxnode_id, ictv_id, name, out_target,
	name='Alphabaculovirus crypeltasticae'--, notes='20230901 IVK-228 name corrected from [Alphabaculovirus crypeltasicae] to [Alphabaculovirus crypeltas[t]icae]'
from taxonomy_node
where name = 'Alphabaculovirus crypeltasicae' and ictv_id=201908662

update taxonomy_node set
--select msl_release_num, taxnode_id, ictv_id, name, out_target,
	name='Alphabaculovirus speridaniae'--, notes='20230901 IVK-228 name corrected from [Alphabaculovirus speridanae] to [Alphabaculovirus speridan[i]ae]'
from taxonomy_node
where name = 'Alphabaculovirus speridanae' and ictv_id=201908666

--
-- 202113428	Alphabaculovirus altersperidanae		Alphabaculovirus altersperidan[i]ae
--
update taxonomy_node set
--select msl_release_num, taxnode_id, ictv_id, name, out_target,
	name='Alphabaculovirus altersperidaniae'--, notes='20230901 IVK-228 name corrected from [Alphabaculovirus altersperidanae] to [Alphabaculovirus altersperidan[i]ae]'
from taxonomy_node
where name = 'Alphabaculovirus altersperidanae' and ictv_id=202113428

--
-- update delta nodes from taxonomy_node
-- needed to update proposal filenames on web pages
--
exec rebuild_delta_nodes_2

exec rebuild_node_merge_split



-- summary: done
select title='vmr DONE', change, ct_change=count(*)
from vmr 
group by vmr.change
-- summary: t odo 
select title='vmr TODO', delta.tag_csv2, ct=count(*), ct_old_taxnode_id=count(old_taxnode_id)
 from taxonomy_node_delta  delta
 join  vmr on  old_taxnode_id =  delta.prev_taxid
 where change is null
 group by delta.tag_csv2
 