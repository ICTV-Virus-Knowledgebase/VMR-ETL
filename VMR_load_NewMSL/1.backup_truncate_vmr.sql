--
-- backup VMR before loading new XLSX
--
select * into vmr_030323 from vmr
go
truncate table vmr
go
truncate table vmr_load
go
