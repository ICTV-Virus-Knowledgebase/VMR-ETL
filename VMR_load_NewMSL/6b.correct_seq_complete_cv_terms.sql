--
-- fix CV terms in VMR
--
select distinct exemplar_seq_complete from vmr
 
select distinct isolate_seq_complete_csv from vmr

update vmr set exemplar_seq_complete='Coding-complete genome' from vmr where exemplar_seq_complete= 'Complete coding genome'
 
update vmr set isolate_seq_complete_csv='Coding-complete genome' from vmr where isolate_seq_complete_csv= 'Complete coding genome'
 

select distinct exemplar_seq_complete from vmr
 
select distinct isolate_seq_complete_csv from vmr

