/****** Script for SelectTopNRows command from SSMS  ******/

select

[name]  
,[molecule_id]
,[abbrev_csv]
      ,[genbank_accession_csv]
      ,[genbank_refseq_accession_csv]
      ,[refseq_accession_csv]
      ,[isolate_csv]
      ,[notes]

FROM [ICTVonline37].[dbo].[taxonomy_node]
  where msl_release_num = 37 AND level_id = 600 AND name not in
  (SELECT species FROM [virus_isolates])