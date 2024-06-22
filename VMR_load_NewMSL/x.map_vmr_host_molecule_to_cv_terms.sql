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
		when trim(vmr.host) = 'plants, invertebrates' then 'MAPPED: [invertebrates, plants]'
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


-- ###################################################################
--
-- VMR_MSL39v1: update MSL [taxonomy_node] host/molecule from VMR
--
-- FIX TERMS
-- 
-- “ssRNA(-); ssRNA(+/-)” should be ", "ssRNA(+/-)"
-- "bacteria, vertebrates (S)", "bacteria, invertebrates (S)" 
-- Add these to taxonomy_node and update the records for the picobirnaviruses.
--  These may only infect bacteria, but they are found in a wide range of animal hosts
--  (possibly replicating in the host’s microbiome).
--  But full biology of host:virus remains to be seen.
--
-- ###################################################################

--
-- fix VMR: molecule
--

 -- remove padding
update vmr set
--select ERROR='column molecule has padding', *, 
	molecule = trim(molecule)
from vmr
where  trim(molecule) <> molecule

-- map this to an existing term
update vmr set 
--select *,
	molecule = (select abbrev from taxonomy_molecule where abbrev = 'ssRNA(+/-)')
from vmr
where trim(molecule) = 'ssRNA(-); ssRNA(+/-)'


--
-- fix VMR: host
--


-- remove padding
update vmr set
--select ERROR='column host has padding', *, 
	host = trim(host)
from vmr
where  trim(host) <> host

-- remove quotes
update vmr set
--select ERROR='column host has quotes', *, 
	host =substring(host,2,len(host)-2)
from vmr
where host like '"%' and host like '%"' 

-- swap order 'plants, invertebrates'
update vmr set
--select ERROR='column host inverted order', *, 
	host ='invertebrates, plants'
from vmr
where host like 'plants, invertebrates' 


-- add missing terms to taxonomy_host_source
insert into taxonomy_host_source ( host_source )
values ('bacteria, vertebrates (S)'), 
	('bacteria, invertebrates (S)')

-- 
-- look for species that have isolates with inconsistent host or molecule
--
select sort_species, species, ct_d_host=count(distinct(host)), ct_d_mol= count(distinct(molecule)), min(molecule), max(molecule)
from vmr
where species <> 'abolished'
group by sort_species, species
having count(distinct(host))>1 or count(distinct(molecule))>1
order by sort_species

--
-- update taxonomy_node.molecule_id from VMR
--
update taxonomy_node set
--select msl_lineage=tn.lineage,vmr_species= vmr.species, msl_molecule=tnm.abbrev,change='<<<<<',vmr_molecule= vmr.molecule,
	molecule_id = tm.id
from taxonomy_node tn
join vmr on tn.taxnode_id = vmr.taxnode_id
join taxonomy_molecule tnm on tnm.id = tn.inher_molecule_id
join taxonomy_molecule tm on tm.abbrev = vmr.molecule
where tn.inher_molecule_id <> tm.id
and sort_species not in (
	-- species with inconsistent isolates
	select sort_species
	from vmr
	where species <> 'abolished'
	group by sort_species, species
	having  count(distinct(molecule))>1
)

