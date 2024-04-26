/*
 * step 2
 * 
 *   UPDATE MSL BEFORE RUNNING
 *
 * update VMR records that have been renamed 
 *
 */

 --
 -- backup VMR
 --
 
select * into vmr_20240426_premsl39 from vmr


-- select * from species_historic_name_lut where last_msl=38 order by action
select action, ct_action = count(action) from species_historic_name_lut  where last_msl = 38 group by action
select * from taxonomy_node where msl_releasE_num = 39 and in_change is not null and in_change <> 'new'
select * from species_historic_name_lut  where new_msl = 39 and 'Amdoparvovirus carnivoran1' in (old_name, new_name, new_name2)
select * from species_historic_name_lut where last_msl = 38 and action = 'abolished'

select top 10  * from species_historic_name_lut  where new_msl = 39 and action = 'renamed'

select top 10  * from vmr

--
-- add admin columns to track changes
--
IF COL_LENGTH('VMR', 'change') IS NULL
BEGIN
    ALTER TABLE [VMR]
    ADD [change] varchar(255)
END

IF COL_LENGTH('VMR', 'new_species') IS NULL
BEGIN
    ALTER TABLE [VMR]
    ADD [new_species] varchar(255)
END
IF COL_LENGTH('VMR', 'new_taxnode_id') IS NULL
BEGIN
    ALTER TABLE VMR
    ADD [new_taxnode_id] int
END

--
-- no-change species 
--
update vmr set
-- select top 10  vmr.*,
new_species = lut.new_name 
,change = lut.action
, new_taxnode_id=lut.new_taxnode_id
from vmr
join species_historic_name_lut lut on vmr.species = lut.old_name and lut.old_name = lut.new_name
where  38 between first_msl and last_msl
and    39 = new_msl
and is_merge=0 and is_split=0
 

select change, ct_change=count(*)
from vmr 
group by vmr.change


--
-- direct renames 
--
update vmr set
-- select top 10  vmr.*,
new_species = lut.new_name 
,change = lut.action
, new_taxnode_id=lut.new_taxnode_id
from vmr
join species_historic_name_lut lut on vmr.species = lut.old_name
where  lut.action = 'renamed' AND last_msl = 38
 

select change, ct_change=count(*)
from vmr 
group by vmr.change


--
-- abolish species 
--
update vmr set
-- select top 10  vmr.*,
change = lut.action
from vmr
join species_historic_name_lut lut on vmr.species = lut.old_name
where  38= lut.last_msl
and lut.action = 'abolished'
 

select change, ct_change=count(*)
from vmr 
group by vmr.change


--
-- direct merges (N=2)
--


select * from species_historic_name_lut lut 
where lut.old_name = 'European brown hare syndrome virus'
or lut.new_name = 'Lagovirus europaeus'

select vmr.*,
--update vmr set
  new_species = lut.new_name  
 ,change = lut.action
  , new_taxnode_id=lut.new_taxnode_id
from vmr
join species_historic_name_lut lut on vmr.species = lut.old_name 
where  lut.action = 'renamed/merged'
 AND last_msl = 38
 and new_msl = 39
 
 -- report: all species involved in merges
 -- these need to be hand-resolved.
select  new_species, new_taxnode_id, change, species, exemplar, exemplar_isolate, exemplar_genbank_accession, exemplar_seq_complete, abbrev_csv, taxnode_id, host, molecule
from vmr 
where new_species in (
	select new_species
	from vmr 
	where change = 'renamed/merged'
)
order by new_species

-- summary of mappings so far
select change, ct_change=count(*)
from vmr 
group by vmr.change

--
-- what's left: SPLIT
--
-- 'Amdoparvovirus carnivoran1' ->  ( 'Amdoparvovirus carnivoran1','Amdoparvovirus carnivoran9','Amdoparvovirus carnivoran10')
-- 
-- All 3 split results have new accession numebrs
-- Keep the original entry and accession as E record, add 3 new ones as A records.
--

-- investigate
select * from vmr where change is null

select * from species_historic_name_lut lut 
where lut.old_name = 'Amdoparvovirus carnivoran1'
and new_msl = 39

select prev_lineage, prev_tags, prev_proposal,  name, next_tags, next_lineage, next_proposal
from taxonomy_node_dx 
where prev_lineage like  '%;Amdoparvovirus carnivoran1'
and msl_release_num = 39

--
-- insert 3 new ACCESSIONS  as "A" records.
--
insert into vmr (species,exemplar,isolate_csv,isolate_genbank_accession_csv,isolate_seq_complete_csv,alternative_name_csv,abbrev_csv,sort,taxnode_id,host,molecule,change,new_taxnode_id,new_species)
select
	species =  dx.prev_name 
	, exemplar = 'A'
	, isoalte_csv = dx.isolate_csv    --   exemplar_isolate
	, isolate_genbank_accession_csv = dx.genbank_accession_csv --exemplate_genbank_accession
	, isolate_seq_complete_csv = gc.name   --_  exemplar_seq_complete
	, alternative_name_csv = dx.exemplar_name
	, abbrev_csv = dx.abbrev_csv -- isolate_abbrev is never used
	, sort = vmr.sort
	, taxnode_id = dx.prev_id
	, host = dx.host_source
	, molecule = mol.abbrev
	, change = 'split'
	, new_taxnode_id = dx.taxnode_id
	, new_species = dx.name
	-- select top 10 *
from taxonomy_node_dx dx
join vmr on vmr.taxnode_id = dx.prev_id
left outer join taxonomy_genome_coverage gc  on gc.genome_coverage = dx.genome_coverage
left outer join taxonomy_molecule mol  on mol.id = dx.inher_molecule_id
where 
vmr.change is null
and 
dx.msl_release_num in (39)
and 
dx.prev_tags like '%split%'
and 
not exists (select * from vmr where exemplar_genbank_accession=dx.genbank_accession_csv or isolate_genbank_accession_csv=dx.genbank_accession_csv)
order by msl_release_num, dx.left_idx

-- summary of mappings so far
select step ='after insert splits', change, ct_change=count(*)
from vmr 
group by vmr.change


-- 
-- update remaining record as a split, keeping E status
--

select vmr.*,
-- update vmr set
  new_species = dx.name  
  ,change = 'split'
  ,new_taxnode_id=dx.taxnode_id
from vmr
left outer join taxonomy_node_dx dx  on
	 vmr.species =dx.name
	 and  dx.prev_tags like '%split%'
	 and dx.msl_release_num = 39
where
	vmr.change is null
 
 -- summary of mappings so far
select step='ater update of split', change, ct_change=count(*)
from vmr 
group by vmr.change

--
-- finally, add new records
--
