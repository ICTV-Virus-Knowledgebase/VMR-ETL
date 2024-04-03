/*
 * step 1
 * 
 * Find and remove species in VMR that were abolished in most recent MSL
 * update VMR records with out-dated names (not in current MSL) 
 */

select vmr.species , exemplar,  lut.*
from vmr 
 join species_historic_name_lut lut on vmr.species = lut.old_name
where   species not in 
(select name from taxonomy_node_names
where [rank] = 'species' AND msl_release_num = 38 AND name IS NOT NULL)
AND lut.action = 'abolished' AND lut.last_msl = 37
order by vmr.species

delete from vmr where species in 
(select  distinct vmr.species
from vmr 
join species_historic_name_lut lut on vmr.species = lut.old_name
where lut.action = 'abolished' AND lut.last_msl = 37
)



