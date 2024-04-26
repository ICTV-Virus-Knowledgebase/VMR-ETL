

--
-- INSERT moved to step 3
--
 
-- for length query
  )  src
GO

update vmr
set sort = 1 
where sort IS NULL
GO

update vmr
set exemplar_isolate = ''
where exemplar_isolate IS NULL
GO