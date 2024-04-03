USE [ICTVonline32]
GO

UPDATE [vmr_load]
   SET  vmr_load.[taxnode_id] = taxonomy_node.taxnode_id
  FROM [vmr_load],  [taxonomy_node]
  where vmr_load.species = taxonomy_node.name AND taxonomy_node.msl_release_num = 32
GO

truncate table vmr
Go

INSERT INTO [dbo].[vmr]
           ([order]
           ,[family]
           ,[subfamily]
           ,[genus]
           ,[species]
           ,[alternative_name_csv]
           ,[exemplar_genbank_accession]
           ,[exemplar_refseq_accession]
           ,[exemplar_seq_complete]
           ,[abbrev_csv]
           ,[exemplar_isolate]
           ,[sort]
           ,[exemplar]
           ,[taxnode_id])
Select [order]
      ,[family]
      ,[subfamily]
      ,[genus]
      ,[species]
      ,[exemplar_isolate]
      ,[genbank]
      ,[refseq]
      ,[seq_complete]
      ,[abbrev_csv]
      ,[alternative_name_csv]
      ,[sort]
      ,[exemplar]
      ,[taxnode_id]
  FROM [ICTVonline32].[dbo].[vmr_load] 
  where exemplar = 'E'
  Go

  INSERT INTO [dbo].[vmr]
           ([order]
           ,[family]
           ,[subfamily]
           ,[genus]
           ,[species]
           ,[isolate_csv]
           ,[isolate_genbank_accession_csv]
           ,[isolate_seq_complete_csv]
           ,[abbrev_csv]
           ,[alternative_name_csv]
           ,[sort]
           ,[exemplar]
           ,[taxnode_id])
Select  [order]
      ,[family]
      ,[subfamily]
      ,[genus]
      ,[species]
      ,[alternative_name_csv]
      ,[genbank]
      ,[seq_complete]
      ,[abbrev_csv]
      ,[exemplar_isolate]
      ,[sort]
      ,[exemplar]
      ,[taxnode_id]
  FROM [ICTVonline32].[dbo].[vmr_load] 
  where exemplar = 'A'
  Go






