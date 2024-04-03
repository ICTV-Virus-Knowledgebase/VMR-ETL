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
      , CONCAT([exemplar_refseq_accession], '') as 'Virus REFSEQ accession'
      , CONCAT([exemplar_seq_complete] , [isolate_seq_complete_csv], '') as 'Genome coverage'
      ,[molecule] as 'Genome composition'
      ,[host] as 'Host source'
  FROM [ICTVonline37].[dbo].[virus_isolates]
  order by left_idx, sort


  
