--
-- email corrections from Donald Smith 
--
select t='[vmr]'
	,*
from vmr

select t='[vmr]'
	, exemplar_genbank_accession =    count(case when exemplar_genbank_accession=''    then NULL else exemplar_genbank_accession    end)
	, exemplar_refseq_accession=      count(case when exemplar_refseq_accession=''     then NULL else exemplar_refseq_accession     end)
	, isolate_genbank_accession_csv = count(case when isolate_genbank_accession_csv='' then NULL else isolate_genbank_accession_csv end)
	, isolate_refseq_accession =      count(case when isolate_refseq_accession=''      then NULL else isolate_refseq_accession      end)
from vmr
union all
select t='[vmr_040224]'
	, exemplar_genbank_accession =    count(case when exemplar_genbank_accession=''    then NULL else exemplar_genbank_accession    end)
	, exemplar_refseq_accession=      count(case when exemplar_refseq_accession=''     then NULL else exemplar_refseq_accession     end)
	, isolate_genbank_accession_csv = count(case when isolate_genbank_accession_csv='' then NULL else isolate_genbank_accession_csv end)
	, isolate_refseq_accession = 0--count(isolate_refseq_accession)
from vmr_040224

select n.species, n.exemplar
	, NEW_exemplar_genbank_accession  = n.exemplar_genbank_accession
	, NEW_exemplar_refseq_accession   = n.exemplar_refseq_accession
	, OLD_exemplar_genbank_accession  = o.exemplar_genbank_accession
	, OLD_exemplar_refseq_accession   = o.exemplar_refseq_accession
from vmr n
join vmr_040224 o on o.exemplar_genbank_accession = n.exemplar_genbank_accession
where n.exemplar_genbank_accession is not null and n.exemplar_genbank_accession <> ''
and (
	 n.exemplar_refseq_accession <> o.exemplar_refseq_accession
	 or 
	 (n.exemplar_refseq_accession is null and  o.exemplar_refseq_accession is not null)
	 or 
	 (n.exemplar_refseq_accession is not null and  o.exemplar_refseq_accession is  null)
)

--
-- update REFSEQs missing from NEW that are in OLD
--
-- Felsduovirus Fels2  AE006468 (2844298.2877981) => NC_003197
--
select vmr.species, vmr.exemplar
	, NEW_exemplar_genbank_accession  = vmr.exemplar_genbank_accession
	, NEW_exemplar_refseq_accession   = vmr.exemplar_refseq_accession
	, OLD_exemplar_genbank_accession  = o.exemplar_genbank_accession
	, OLD_exemplar_refseq_accession   = o.exemplar_refseq_accession
-- update vmr set vmr.exemplar_refseq_accession =  o.exemplar_refseq_accession
from vmr
join vmr_040224 o on o.exemplar_genbank_accession = vmr.exemplar_genbank_accession
where vmr.exemplar_genbank_accession is not null and vmr.exemplar_genbank_accession <> '' and o.exemplar_refseq_accession <> ''
and (
	 vmr.exemplar_refseq_accession <> o.exemplar_refseq_accession
	 or 
	 (vmr.exemplar_refseq_accession is null and  o.exemplar_refseq_accession is not null)
	 or 
	 (vmr.exemplar_refseq_accession is not null and  o.exemplar_refseq_accession is  null)
)


-- Sort 1419 Accession ";OQ737697" spurious semicolon
update vmr set -- select sort_species, sort, exemplar_genbank_accession, 
	 exemplar_genbank_accession=replace(exemplar_genbank_accession,';','') 
from  vmr where exemplar_genbank_accession like ';OQ737697'

-- Sort 2182 Accession "OQ7219011" should be "OQ721911"

update vmr set -- select sort_species, sort, exemplar_genbank_accession, 
	 exemplar_genbank_accession='OQ721911'--replace(exemplar_genbank_accession,';','') 
from  vmr where exemplar_genbank_accession like 'OQ7219011'

-- select host, ct=count(*) from vmr group by host order by host
--update vmr set host = 'Protists' -- 
select * 
from vmr where host='oomycetes'-- species in ('Fusagravirus sani','Ootivirus ichi','Ootivirus ni','Ootivirus roku','Ootivirus sani')

-- Sort 7263 Totivirus nijyushichi - remove isolate name (identical to abbreviation)
update vmr set  -- select *, 
	 exemplar_isolate = ''
from vmr where species = 'Totivirus nijyushichi' and  exemplar_isolate <> ''

-- No accession number given but Genome coverage is "Coding-complete genome"
-- Sort 11337, 11340, 11341, 11343-11350, 11354, 11444-11446, 11450
update vmr set  -- select *, 
	 exemplar_seq_complete = 'No entry in Genbank'
from vmr 
--where sort_species in ( 11337, 11340, 11341, 11343-11350, 11354, 11444, 11444,11446, 11450)
where exemplar_seq_complete not like '%Genbank%' and (exemplar_genbank_accession is NULL or exemplar_genbank_accession = '')
 select exemplar_seq_complete, ct=count(*) from vmr group by exemplar_seq_complete
 species	exemplar	exemplar_isolate	exemplar_genbank_accession	exemplar_refseq_accession	exemplar_seq_complete	isolate_csv	isolate_genbank_accession_csv	isolate_refseq_accession	isolate_seq_complete_csv	alternative_name_csv	abbrev_csv	isolate_abbrev	sort_species	sort	taxnode_id	host	molecule	vmr_uid	change	old_species	old_taxnode_id	change_proposal	refseq_organism	refseq_taxids	isolate_name	exemplar_seq_complete
Alphapithovirus massiliense	E	nk	NULL	NULL	Complete genome	NULL	NULL	NULL	NULL	Pithovirus massiliensis	PTVM	NULL	13838	1	202318024	protists	dsDNA	24670	created	created	NULL	2023.011F.Pimascovirales_3newfam.zip	NULL	NULL	Pithovirus massiliensis	No entry in Genbank
Amplylivirus pugnax	E	Antioquia	NULL	NULL	Coding-complete genome	NULL	NULL	NULL	NULL	Boana pugnax lyssa-like virus 1	BpugLLV1	NULL	11354	1	202318251	invertebrates (S)	ssRNA(-)	27612	created	created	NULL	2023.015M.Alpharhabdovirinae_17nsp.zip	NULL	NULL	Boana pugnax lyssa-like virus 1	No entry in Genbank
Alpharicinrhavirus bancrofti	E	K23	NULL	NULL	Coding-complete genome	NULL	NULL	NULL	NULL	Haemaphysalis bancrofti rhabdovirus	HbanRV	NULL	11337	1	202318256	invertebrates (S)	ssRNA(-)	27614	created	created	NULL	2023.015M.Alpharhabdovirinae_17nsp.zip	NULL	NULL	Haemaphysalis bancrofti rhabdovirus	No entry in Genbank
Alpharicinrhavirus huanggang	E	TIGMIC22	NULL	NULL	Coding-complete genome	NULL	NULL	NULL	NULL	Huanggang rhabd tick virus 1	HgRTV1	NULL	11340	1	202318260	invertebrates (S)	ssRNA(-)	27615	created	created	NULL	2023.015M.Alpharhabdovirinae_17nsp.zip	NULL	NULL	Huanggang rhabd tick virus 1	No entry in Genbank
Alpharicinrhavirus huangpi	E	H124-2	NULL	NULL	Coding-complete genome	NULL	NULL	NULL	NULL	Huangpi tick virus 3	HpTV3	NULL	11341	1	202318257	invertebrates (S)	ssRNA(-)	27616	created	created	NULL	2023.015M.Alpharhabdovirinae_17nsp.zip	NULL	NULL	Huangpi tick virus 3	No entry in Genbank
Alpharicinrhavirus jilin	E	TIGMIC4	NULL	NULL	Coding-complete genome	NULL	NULL	NULL	NULL	Yanbian rhabd tick virus 1	YbRTV1	NULL	11343	1	202318255	invertebrates (S)	ssRNA(-)	27617	created	created	NULL	2023.015M.Alpharhabdovirinae_17nsp.zip	NULL	NULL	Yanbian rhabd tick virus 1	No entry in Genbank
Alpharicinrhavirus nanning	E	TIGMIC1	NULL	NULL	Coding-complete genome	NULL	NULL	NULL	NULL	Nanning rhabd tick virus 1	NnRTV1	NULL	11344	1	202318259	invertebrates (S)	ssRNA(-)	27618	created	created	NULL	2023.015M.Alpharhabdovirinae_17nsp.zip	NULL	NULL	Nanning rhabd tick virus 1	No entry in Genbank
Alpharicinrhavirus ningxia	E	TIGMIC3	NULL	NULL	Coding-complete genome	NULL	NULL	NULL	NULL	Guyuan rhabd tick virus 1	GyRTV1	NULL	11345	1	202318263	invertebrates (S)	ssRNA(-)	27619	created	created	NULL	2023.015M.Alpharhabdovirinae_17nsp.zip	NULL	NULL	Guyuan rhabd tick virus 1	No entry in Genbank
Alpharicinrhavirus qinghai	E	TIGMIC1	NULL	NULL	Coding-complete genome	NULL	NULL	NULL	NULL	Yushu rhabd tick virus 2	YsRTV2	NULL	11346	1	202318262	invertebrates (S)	ssRNA(-)	27620	created	created	NULL	2023.015M.Alpharhabdovirinae_17nsp.zip	NULL	NULL	Yushu rhabd tick virus 2	No entry in Genbank
Alpharicinrhavirus reticulatus	E	CT3	NULL	NULL	Coding-complete genome	NULL	NULL	NULL	NULL	Dermacentor reticulatus rhabdovirus 1	DretRV1	NULL	11347	1	202318261	invertebrates (S)	ssRNA(-)	27621	created	created	NULL	2023.015M.Alpharhabdovirinae_17nsp.zip	NULL	NULL	Dermacentor reticulatus rhabdovirus 1	No entry in Genbank
Alpharicinrhavirus skanevik	E	NOR/H3/Skanevik/2014	NULL	NULL	Coding-complete genome	NULL	NULL	NULL	NULL	Norway mononegavirus 1	NWMV1	NULL	11348	1	202318254	invertebrates (S)	ssRNA(-)	27622	created	created	NULL	2023.015M.Alpharhabdovirinae_17nsp.zip	NULL	NULL	Norway mononegavirus 1	No entry in Genbank
Alpharicinrhavirus tahe	E	NE-TH2	NULL	NULL	Coding-complete genome	NULL	NULL	NULL	NULL	Tahe rhabdovirus 1	ThRV1	NULL	11349	1	202318258	invertebrates (S)	ssRNA(-)	27623	created	created	NULL	2023.015M.Alpharhabdovirinae_17nsp.zip	NULL	NULL	Tahe rhabdovirus 1	No entry in Genbank
Alpharicinrhavirus taishun	E	BL198	NULL	NULL	Coding-complete genome	NULL	NULL	NULL	NULL	Taishun tick virus	TsTV	NULL	11350	1	202318253	invertebrates (S)	ssRNA(-)	27624	created	created	NULL	2023.015M.Alpharhabdovirinae_17nsp.zip	NULL	NULL	Taishun tick virus	No entry in Genbank
Alpharicinrhavirus zhangjiakou	E	TIGMIC7	NULL	NULL	Coding-complete genome	NULL	NULL	NULL	NULL	Zhangjiakou rhabd tick virus 1	ZjRTV1	NULL	11352	1	202318252	invertebrates (S)	ssRNA(-)	27625	created	created	NULL	2023.015M.Alpharhabdovirinae_17nsp.zip	NULL	NULL	Zhangjiakou rhabd tick virus 1	No entry in Genbank
Ohlsrhavirus adumi	E	Ug2012-CVR1	NULL	NULL	Coding-complete genome	NULL	NULL	NULL	NULL	Adumi virus	ADUMV	NULL	11450	1	202318250	invertebrates (S)	ssRNA(-)	27694	created	created	NULL	2023.015M.Alpharhabdovirinae_17nsp.zip	NULL	NULL	Adumi virus	No entry in Genbank
Merhavirus formosus	E	U30	NULL	NULL	Coding-complete genome	NULL	NULL	NULL	NULL	Formosus virus	FORMV	NULL	11444	1	202318247	invertebrates (S)	ssRNA(-)	27763	created	created	NULL	2023.015M.Alpharhabdovirinae_17nsp.zip	NULL	NULL	Formosus virus	No entry in Genbank
Merhavirus hattula	E	FIN/PK-2018/62	NULL	NULL	Coding-complete genome	NULL	NULL	NULL	NULL	Hattula rhabdovirus	HTTRV	NULL	11445	1	202318248	invertebrates (S)	ssRNA(-)	27764	created	created	NULL	2023.015M.Alpharhabdovirinae_17nsp.zip	NULL	NULL	Hattula rhabdovirus	No entry in Genbank
Merhavirus inari	E	FIN/L-2018-84	NULL	NULL	Coding-complete genome	NULL	NULL	NULL	NULL	Inari rhabdovirus	INARV	NULL	11446	1	202318249	invertebrates (S)	ssRNA(-)	27765	created	created	NULL	2023.015M.Alpharhabdovirinae_17nsp.zip	NULL	NULL	Inari rhabdovirus	No entry in Genbank

-- Sort 11791 Accession format RNA1: OM687517 - RNA2: OM687518 - RNA3: OM687519 - RNA4: OM687520 - should be "RNA1: OM687517; RNA2: OM687518; RNA3: OM687519; RNA4: OM687520"
-- Sort 11792 Accession format RNA1:OL471978 - RNA2: OL471979 - RNA3:OL471980 - RNA4: OL471981 - RNA5:OL471982 - RNA7: OP441764 should be "RNA1:OL471978; RNA2: OL471979; RNA3:OL471980; RNA4: OL471981; RNA5:OL471982; RNA7: OP441764"
-- Sort 11804 Accession format RNA1: ON181430 - RNA2:ON181431- RNA3: ON181432 - RNA4:ON181433 - RNA5:ON181434 should be "RNA1: ON181430; RNA2:ON181431; RNA3: ON181432; RNA4:ON181433; RNA5:ON181434"
 update vmr set  -- select *, 
	 exemplar_genbank_accession = replace( replace( exemplar_genbank_accession,' - ', '; '), '- ', '')
from vmr where exemplar_genbank_accession like '% - %' or sort_species in (11791 , 11792,11804 )

-- Sort 12670 A isolate has no host - should be "vertebrates"
 update vmr set  -- select *, 
	 host = 'vertebrates'
from vmr where isolate_genbank_accession_csv = 'M67473' --sort_species = 12670 and exemplar='A'

-- Sort 12764 no accession but genome content given as complete genome
update vmr set -- select *,
	 exemplar_seq_complete = 'No entry in Genbank'
from vmr where sort_species = 12764 and exemplar_seq_complete='Complete genome'
select * from taxonomy_node where name ='Senecavirus cetus'

-- Sort 13072 A isolate - no host - should be "plants"
update vmr set -- select *,
	 host = 'plants'
from vmr where sort_species = 13072 and exemplar='A' and host is null 
select host, ct=count(host) from vmr group by host order by host


-- Sort 13794 Mimivirus bradfordmassiliense taxonomy differs from MSL (which has the genus not in the subfamily Megamimivirinae
 select * from  virus_isolates where sort_species = 13794

-- Sort 13795 Mimivirus lagoaense taxonomy differs from MSL (which has the genus not in the subfamily Megamimivirinae
  select * from  virus_isolates where sort_species = 13795

-- Sort 13838 - no accession but genome coverage says complete
update vmr set -- select *,
	 exemplar_seq_complete = 'No entry in Genbank'
from vmr where sort_species = 13838 and exemplar_seq_complete='Complete genome'
select * from taxonomy_node where name ='Senecavirus cetus'
-- 