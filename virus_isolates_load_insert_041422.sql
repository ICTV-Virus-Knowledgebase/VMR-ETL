USE [ICTVonline37]
GO


select * 
INTO [dbo].[virus_isolates_081922]
from virus_isolates
GO

UPDATE [vmr_load]
   SET  vmr_load.[taxnode_id] = taxonomy_node.taxnode_id
  FROM [vmr_load],  [taxonomy_node]
  where vmr_load.species = taxonomy_node.name AND taxonomy_node.msl_release_num = 37
GO

truncate table [virus_isolates_load]
GO

INSERT INTO [dbo].[virus_isolates_load]
           ([order]
           ,[family]
           ,[subfamily]
           ,[genus]
           ,[species]
		   ,[exemplar]
           ,[exemplar_isolate]
           ,[exemplar_genbank_accession]
           ,[exemplar_refseq_accession]
           ,[exemplar_seq_complete]
           ,[abbrev_csv]
           ,[alternative_name_csv]
           ,[sort]
		   ,[taxnode_id])
SELECT  [order]
      ,[family]
      ,[subfamily]
      ,[genus]
      ,[species]
	  ,[exemplar]
      ,[exemplar_isolate]
      ,[genbank]
      ,[refseq]
      ,[seq_complete]
      ,[abbrev_csv]
	  ,[alternative_name_csv]
      ,[sort]
	  ,[taxnode_id]
  FROM [vmr_load] 
where vmr_load.exemplar = 'E'
GO

INSERT INTO [dbo].[virus_isolates_load]
           ([order]
           ,[family]
           ,[subfamily]
           ,[genus]
           ,[species]
		   ,[exemplar]
           ,[isolate_csv]
           ,[isolate_genbank_accession_csv]
           ,[isolate_seq_complete_csv]
           ,[abbrev_csv]
           ,[alternative_name_csv]
           ,[sort]
		   ,[taxnode_id])
SELECT  [order]
      ,[family]
      ,[subfamily]
      ,[genus]
      ,[species]
	  ,[exemplar]
      ,[exemplar_isolate]
      ,[genbank]
      ,[seq_complete]
      ,[abbrev_csv]
      ,[alternative_name_csv]
      ,[sort]
	  ,[taxnode_id]
  FROM [vmr_load] 
where vmr_load.exemplar = 'A'
GO

truncate table [dbo].[virus_isolates]

INSERT INTO virus_isolates
	([order]
      ,[family]
      ,[subfamily]
      ,[genus]
      ,[species]
      ,[exemplar]
      ,[exemplar_isolate]
      ,[exemplar_genbank_accession]
      ,[exemplar_refseq_accession]
      ,[exemplar_seq_complete]
      ,[isolate_csv]
      ,[isolate_genbank_accession_csv]
      ,[isolate_seq_complete_csv]
      ,[alternative_name_csv]
      ,[abbrev_csv]
      ,[isolate_abbrev]
      ,[sort]
      ,[taxnode_id])
SELECT [order]
      ,[family]
      ,[subfamily]
      ,[genus]
      ,[species]
      ,[exemplar]
      ,[exemplar_isolate]
      ,[exemplar_genbank_accession]
      ,[exemplar_refseq_accession]
      ,[exemplar_seq_complete]
      ,[isolate_csv]
      ,[isolate_genbank_accession_csv]
      ,[isolate_seq_complete_csv]
      ,[alternative_name_csv]
      ,[abbrev_csv]
      ,[isolate_abbrev]
      ,[sort]
      ,[taxnode_id]
FROM virus_isolates_load
GO



