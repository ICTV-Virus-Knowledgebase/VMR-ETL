/****** Script for SelectTopNRows command from SSMS  ******/

--
-- check genome_coverage CV usage in VMR
--
SELECT exemplar='E', vmr.exemplar_seq_complete, ct=count(*)

  FROM [ICTVonline39].[dbo].vmr
  group by exemplar_seq_complete

  union all

  select exemplar='A', vmr.isolate_seq_complete_csv, ct=count(*)
    FROM [ICTVonline39].[dbo].vmr
  group by isolate_seq_complete_csv
  order by exemplar_seq_complete

  select * from taxonomy_genome_coverage