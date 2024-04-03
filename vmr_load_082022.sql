USE [ICTVonline37]
GO

UPDATE [vmr_load]
   SET  vmr_load.[taxnode_id] = taxonomy_node.taxnode_id
  FROM [vmr_load],  [taxonomy_node]
  where vmr_load.species = taxonomy_node.name AND taxonomy_node.msl_release_num = 37
GO

truncate table [vmr]
GO

INSERT INTO [dbo].[vmr]
           (
           [species]
	   ,[exemplar]
           ,[exemplar_isolate]
           ,[exemplar_genbank_accession]
           ,[exemplar_seq_complete]
           ,[abbrev_csv]
           ,[alternative_name_csv]
           ,[sort]
	   ,[taxnode_id]
	   ,[host]
	   ,[molecule])
SELECT  [species]
      ,[exemplar]
      ,[exemplar_isolate]
      ,[genbank]
      ,[seq_complete]
      ,[abbrev_csv]
      ,[alternative_name_csv]
      ,[sort]
      ,[taxnode_id]
      ,[host]
      ,[molecule]
  FROM [vmr_load] 
where vmr_load.exemplar = 'E'
GO

INSERT INTO [dbo].[vmr]
           (
           [species]
	   ,[exemplar]
           ,[isolate_csv]
           ,[isolate_genbank_accession_csv]
           ,[isolate_seq_complete_csv]
           ,[abbrev_csv]
           ,[alternative_name_csv]
           ,[sort]
	   ,[taxnode_id]
	   ,[host]
	   ,[molecule])
SELECT  [species]
      ,[exemplar]
      ,[exemplar_isolate]
      ,[genbank]
      ,[seq_complete]
      ,[abbrev_csv]
      ,[alternative_name_csv]
      ,[sort]
      ,[taxnode_id]
      ,[host]
      ,[molecule]
  FROM [vmr_load] 
where vmr_load.exemplar = 'A'
GO




