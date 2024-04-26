

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
		   ,alternative_name_csv
		   ,change
		  , new_taxnode_id
		   ,new_species)

--select alternative_name_csv= max(len(alternative_name_csv)) from (
SELECT 
      species='create'
	  ,[exemplar] = 'E'
	  ,[exemplar_isolate] = [isolate_csv]
      ,[exemplar_genbank_accession]=[genbank_accession_csv]
	  ,[abbrev_csv]
	  ,[taxnode_id]=null
	  ,[molecule]=inher_molecule
	  ,host=host_source
	  ,exemplar_seq_complete=gc.name
	  ,alternative_name_csv=exemplar_name
	  , change='create'
	  , new_taxnode_id = [taxnode_id]
	  , new_species = [species]
  FROM [taxonomy_node_names]
  JOIN [taxonomy_genome_coverage] gc on gc.genome_coverage=[taxonomy_node_names].genome_coverage
  where msl_release_num = 39 AND rank = 'species' AND is_hidden = 0 
  AND [taxonomy_node_names].[name] NOT IN ( select new_species from vmr where new_species is not null )

 
-- for length query
  )  src
GO

update vmr
set sort = 1 
where sort IS NULL
GO

update vmr
set exemplar_isolate = ''
where exemplar_isolate IS NULL
GO