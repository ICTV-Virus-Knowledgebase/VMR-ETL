/*
 * step 2
 * 
 * update VMR records that have been renamed 
 *
 */



update vmr set 
--select
vmr.species = lut.new_name 
from vmr
join species_historic_name_lut lut on vmr.species = lut.old_name
where   lut.action = 'renamed' AND last_msl = 37
 

select   vmr.species, lut.*
from vmr 
join species_historic_name_lut lut on vmr.species = lut.old_name
where   lut.action = 'renamed' AND last_msl = 37
order by vmr.species


