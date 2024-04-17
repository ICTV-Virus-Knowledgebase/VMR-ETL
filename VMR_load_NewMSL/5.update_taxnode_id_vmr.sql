
UPDATE [vmr]
   SET  vmr.[taxnode_id] = taxonomy_node.taxnode_id
  FROM [vmr],  [taxonomy_node]
  where vmr.species = taxonomy_node.name AND taxonomy_node.msl_release_num = 38
GO