

truncate table [vmr]
GO

INSERT INTO [dbo].[vmr]
           (
           [species]
	  ,[exemplar]
      ,[exemplar_isolate]
      ,[exemplar_genbank_accession]
      ,[exemplar_refseq_accession]
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
	  ,[refseq]
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
      ,[exemplar_refseq_accession]
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
	  ,[refseq]
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




