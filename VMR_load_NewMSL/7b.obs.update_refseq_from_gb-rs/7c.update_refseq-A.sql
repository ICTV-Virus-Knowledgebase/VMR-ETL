DECLARE @refacc nvarchar(4000), @species nvarchar(100), @refseq varchar(25),  @vuid int

DECLARE vmr_cursor CURSOR FOR
Select vmr.vmr_uid, vmr.species
from vmr
where vmr.exemplar = 'A'
AND vmr.isolate_genbank_accession_csv <> ''
order by vmr.species

OPEN vmr_cursor
FETCH NEXT FROM vmr_cursor INTO @vuid, @species


WHILE @@FETCH_STATUS = 0  
BEGIN

DECLARE ref_cursor CURSOR FOR
Select  [gb-rs].refseq
from [gb-rs]
join vmr ON vmr.isolate_genbank_accession_csv LIKE CONCAT('%' ,  [gb-rs].[genbank] , '%')
where vmr.vmr_uid = @vuid

OPEN ref_cursor
FETCH NEXT FROM ref_cursor INTO  @refseq

WHILE @@FETCH_STATUS = 0  
BEGIN

	set @refacc = CONCAT(@refacc,'; ',  @refseq)
	
	FETCH NEXT FROM ref_cursor INTO  @refseq
	
END  

CLOSE ref_cursor;  
DEALLOCATE ref_cursor; 

SET @refacc = RIGHT(@refacc, LEN(@refacc) - 2)

update vmr
set exemplar_refseq_accession = @refacc 
where vmr_uid = @vuid

set @refacc = NULL
FETCH NEXT FROM vmr_cursor INTO @vuid, @species


END
CLOSE vmr_cursor
DEALLOCATE vmr_cursor




