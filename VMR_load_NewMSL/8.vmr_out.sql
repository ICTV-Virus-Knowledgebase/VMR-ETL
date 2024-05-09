/****** Script for SelectTopNRows command from SSMS  ******/
SELECT  
      [left_idx] as 'Species Sort'
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
      ,[host] as 'Host source'
	  -- QC
	  ,vi.qc_status
	  ,vi.qc_taxon_inher_molecule
	  ,vi.qc_taxon_genome_coverage
	  ,vi.qc_taxon_change
	  ,vi.qc_taxon_proposal
  FROM [dbo].[virus_isolates] vi
 where left_idx is not null -- removes abolished species
  order by left_idx, sort




  
