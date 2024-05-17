--
-- export the VMR to XLSX
--

-- this whole thing should probably become an SP!

--
-- update sort_species, sort (isolates) columns
--
 --exec [VMR_UPDATE_SORTS]

--
-- export the VMR
--

SELECT  
      [sort_species] as 'Species Sort'
	  ,[sort] as 'Isolate Sort'
	  ,[realm] as 'Realm'
      ,[subrealm] as 'Subrealm'
      ,[kingdom] as 'Kingdom'
      ,[subkingdom] as 'Subkingdom'
      ,[phylum] as 'Phylum'
      ,[subphylum] as 'Subphylum'
      ,[class] as 'Class'
      ,[subclass] as 'Subclass'
      ,[order] as 'Order'
      ,[suborder] as 'Suborder'
      ,[family] as 'Family'
      ,[subfamily] as 'Subfamily'
      ,[genus] as 'Genus'
      ,[subgenus] as 'Subgenus'
	  ,[species] as 'Species'
      ,[exemplar] as 'Exemplar or additional isolate'
      , CONCAT([alternative_name_csv], '') as 'Virus name(s)'
      , CONCAT([abbrev_csv] , '') as 'Virus name abbreviation(s)'
      , CONCAT([exemplar_isolate] , [isolate_csv] , [isolate_abbrev], '') as 'Virus isolate designation'
      , CONCAT([exemplar_genbank_accession] , [isolate_genbank_accession_csv], '') as 'Virus GENBANK accession'
      , CONCAT([exemplar_refseq_accession], [isolate_refseq_accession], '') as 'Virus REFSEQ accession'
      , CONCAT([exemplar_seq_complete] , [isolate_seq_complete_csv], '') as 'Genome coverage'
      ,[molecule] as 'Genome composition'
      ,isnull([host],'') as 'Host source'
	  -- QC
	  ,QC_status=							ISNULL(vi.qc_status,'') 
	  ,QC_taxon_inher_genome_composition =	ISNULL( vi.qc_taxon_inher_molecule,'')
	  ,QC_taxon_genome_coverage =			ISNULL( vi.qc_taxon_genome_coverage,'')
	  ,QC_taxon_change =					ISNULL(vi.qc_taxon_change,'')
	  ,QC_taxon_proposal =					ISNULL('=HYPERLINK("https://ictv.global/ictv/proposals/'+ vi.qc_taxon_proposal+'","'+ vi.qc_taxon_proposal+'")','')
  FROM [dbo].[virus_isolates] vi
 where species <> 'abolished' -- removes abolished species
-- and [exemplar_genbank_accession] like '%KP245734%'-- , [isolate_genbank_accession_csv], ''))
  order by sort_species, sort

  select max(sort_species) from vmr
/*

   select * ,
  -- UPDATE  [vmr]  SET
     
   exemplar_genbank_accession=  'dsRNA1:  KP245734;  dsRNA1:  KP245734;  dsRNA2:  KP245735;  dsRNA2:  KP245735;  dsRNA3:  KP245736;  dsRNA3:  KP245736;  dsRNA4:  KP245737;  dsRNA4:  KP245737;  dsRNA5:  KP245738;  dsRNA5:  KP245738'  , 
    exemplar_refseq_accession=  'dsRNA1:  NC_033476;  dsRNA1:  NC_033476;  dsRNA2:  NC_033477;  dsRNA2:  NC_033477;  dsRNA3:  NC_033494;  dsRNA3:  NC_033494;  dsRNA4:  NC_033495;  dsRNA4:  NC_033495;  dsRNA5:  NC_033496;  dsRNA5:  NC_033496' 
	
	FROM  [vmr]  WHERE  [exemplar_genbank_accession]  like  '%KP245734%'  AND  [exemplar]  =  'E'  AND  [species]  =  'Polymycovirus botryosphaeriae'
*/



  
