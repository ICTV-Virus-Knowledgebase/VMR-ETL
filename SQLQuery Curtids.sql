


  select vi.species, tn.name, lnm.srcSpecies, lnm.species, lnm._action, lnm.hostSource, tnn.family, tnn.inher_molecule
  from virus_isolates vi
  left outer join taxonomy_node tn
  on vi.species = tn.name AND  msl_release_num = 37 AND level_id = 600
  left outer join load_next_msl lnm
  on vi.species = lnm.srcSpecies
  left outer join taxonomy_node_names tnn
  on lnm.species = tnn.species
  where tn.name is null
  order by lnm._action

