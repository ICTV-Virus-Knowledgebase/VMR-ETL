-- 
-- VMR: remove accession version numbers
--
-- the refseq lookup program removed version numbers from all
-- accesssions that had matching refseq entries. 
--
-- This script removes version numbers from the rest. 
--

begin transaction
--
-- check: before
--
select'before: isolate', isolate_genbank_accession_csv, charindex('.',isolate_genbank_accession_csv ) 
from virus_isolates vi
where vi.isolate_genbank_accession_csv  like '%._'

union all

select'before: exemplar', exemplar_genbank_accession, charindex('.',exemplar_genbank_accession ) 
from virus_isolates vi
where vi.exemplar_genbank_accession  like '%._'

--
-- fix
-- 

print 'exemplar_genbank_accession: fix'

update virus_isolates set
-- select 'fix', exemplar_genbank_accession, charindex('.',exemplar_genbank_accession ),
	exemplar_genbank_accession= left(exemplar_genbank_accession, charindex('.',exemplar_genbank_accession )-1)
from virus_isolates vi
where  vi.exemplar_genbank_accession like '%._'

print 'isolate_genbank_accession_csv: fix '
update virus_isolates set
-- select 'fix' isolate_genbank_accession_csv, charindex('.',isolate_genbank_accession_csv ),
	isolate_genbank_accession_csv= left(isolate_genbank_accession_csv, charindex('.',isolate_genbank_accession_csv )-1)
from virus_isolates vi
where  vi.isolate_genbank_accession_csv like '%._'

--
-- check: before
--
select'after: isolate', isolate_genbank_accession_csv, charindex('.',isolate_genbank_accession_csv ) 
from virus_isolates vi
where vi.isolate_genbank_accession_csv  like '%._'

union all
 
select 'after: exemplar', exemplar_genbank_accession, charindex('.',exemplar_genbank_accession ) 
from virus_isolates vi
where vi.exemplar_genbank_accession  like '%._'


rollback transaction; print '!!!!!!!!!!!!!!!!!!!!!!!!!!!!!';  print '!!! ROLL BACK TRANSACTION !!!'; print '!!!!!!!!!!!!!!!!!!!!!!!!!!!!!';
commit transaction

