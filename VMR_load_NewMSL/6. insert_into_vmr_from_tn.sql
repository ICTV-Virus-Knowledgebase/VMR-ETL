

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
		   ,alternative_name_csv)
SELECT 
      species
	  ,'E'
	  ,[isolate_csv]
      ,[genbank_accession_csv]
	  ,[abbrev_csv]
	  ,[taxnode_id]
	  ,inher_molecule
	  ,host_source
	  ,genome_coverage
	  ,exemplar_name
  FROM [ICTVonline38].[dbo].[taxonomy_node_names]
  where msl_release_num = 38 AND rank = 'species' AND is_hidden = 0 
  AND [name] NOT IN ( select species from vmr )

GO

update vmr
set sort = 1 
where sort IS NULL
GO

update vmr
set exemplar_isolate = ''
where exemplar_isolate IS NULL
GO