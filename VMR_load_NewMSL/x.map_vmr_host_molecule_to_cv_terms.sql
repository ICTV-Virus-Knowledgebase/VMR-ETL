-- ###################################################################
--
-- VMR_MSL39v1: update MSL [taxonomy_node] host/molecule from VMR
--
-- MAP TERMS
--
-- ###################################################################

--
-- MAP VMR.molecule to TAXONOMY_MOLECULE
--

select *, q = '"'+abbrev+'"' from taxonomy_molecule where abbrev like 'ssRNA%'

select distinct
	t = 'VMR molecule mapping'
	, vmr_molecule =trim( vmr.molecule)
	, cv_molecule = tm.abbrev
	, ct=count(*)

from vmr
left outer join taxonomy_molecule tm on tm.abbrev =trim( vmr.molecule)
where  vmr.species <> 'abolished'
group by  trim(vmr.molecule), tm.abbrev

--
-- unmapped records
--
select t='MOL: "ssRNA(-); ssRNA(+/-)"', vi.* 
from virus_isolates vi
where trim(vi.molecule) = 'ssRNA(-); ssRNA(+/-)'
order by sort_species, sort

"ssRNA(+)", "ssRNA(-)", "ssRNA-RT", "ssRNA(+/-)", "ssRNA"

-- 
-- host/source
--


-- CV
select *, tax_node_ct= (select count(*) from taxonomy_node tn where tn.host_source = th.host_source) from taxonomy_host_source th

-- VMR mapping
select 
	vmr_host = trim( vmr.host)
	, cv_host = (case
		when th.host_source is not null then th.host_source
		when trim(vmr.host) = '"plants, invertebrates"' then 'MAPPED: [invertebrates, plants]'
		when trim(vmr.host) = '"invertebrates, plants"' then 'MAPPED: [invertebrates, plants]'
		when trim(vmr.host) = '"invertebrates, vertebrates"' then 'MAPPED: [invertebrates, vertebrates]'
		end)
	, ct = count(*)
from vmr
left outer join taxonomy_host_source th on th.host_source = trim(vmr.host)
where vmr.species <> 'abolished'
group by trim( vmr.host), th.host_source


-- 
-- unmapped records
--
select t='HOST UNMAPPED: '+vi.host, vi.* 
from virus_isolates vi
where trim(vi.host) in ('"bacteria, vertebrates (S)"','"bacteria, invertebrates (S)"')
order by sort_species, sort