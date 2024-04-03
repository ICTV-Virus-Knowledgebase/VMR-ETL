-- PROD database name
USE [ICTVonline38]
GO

-- *******************************************
-- **
-- ** Stage data from XLSX ->< [vmr_load]
-- **
-- *******************************************

--
-- truncate [vmr_load]
--
--truncate table [vmr_load]
--drop table [vmr_load]

--
-- RE-header VMR.xlsx using ./VMRxlsx_2_VMRtable_headers.xlsx
-- Remove unused columns from VRM.xlsx
-- Save As [UTF-16 Unicode Txt]
-- DB > Tasks > Import Data... > flat file source
--   "suggest_data types"; give huge number of rows to scan whole file
--   dest: SQL server Native
--   dest: [vmr_load]; check column mappings
--   EXECUTE

--
-- Link to taxonomy_node via species name.
--
IF COL_LENGTH('vmr_load', 'taxnode_id') IS NULL
BEGIN
	ALTER TABLE [vmr_load] ADD [taxnode_id] INT
END
GO

UPDATE [vmr_load]
   SET  vmr_load.[taxnode_id] = taxonomy_node.taxnode_id
  FROM [vmr_load],  [taxonomy_node]
  where vmr_load.species = taxonomy_node.name AND taxonomy_node.msl_release_num = 38
GO

-- *******************************************
-- **
-- ** XFER data [vmr_load] -> [vmr]
-- **
-- *******************************************

--
-- backup current VMR
--
Select *  into vmr_040224 from vmr
GO

-- 
-- clear current table
--
truncate table [vmr]
GO


--
-- Copy E (Exemplar) records
--
INSERT INTO [dbo].[vmr]
           (
           [species]
	   ,[exemplar]
           ,[exemplar_isolate]
           ,[exemplar_genbank_accession]
           ,[exemplar_seq_complete]
           ,[abbrev_csv]
           ,[alternative_name_csv]
           ,[sort]
	   ,[taxnode_id]
	   ,[host]
	   ,[molecule])
SELECT  [species]
      ,[exemplar]
      ,[exemplar_isolate]
      ,[genbank]
      ,[seq_complete]
      ,[abbrev_csv]
      ,[alternative_name_csv]
      ,[sort]
      ,[taxnode_id]
      ,[host]
      ,[molecule]
  FROM [vmr_load] 
where vmr_load.exemplar = 'E'
GO

-- 
-- Copy A (Additional) records
--
INSERT INTO [dbo].[vmr]
           (
           [species]
	   ,[exemplar]
           ,[isolate_csv]
           ,[isolate_genbank_accession_csv]
           ,[isolate_seq_complete_csv]
           ,[abbrev_csv]
           ,[alternative_name_csv]
           ,[sort]
	   ,[taxnode_id]
	   ,[host]
	   ,[molecule])
SELECT  [species]
      ,[exemplar]
      ,[exemplar_isolate]
      ,[genbank]
      ,[seq_complete]
      ,[abbrev_csv]
      ,[alternative_name_csv]
      ,[sort]
      ,[taxnode_id]
      ,[host]
      ,[molecule]
  FROM [vmr_load] 
where vmr_load.exemplar = 'A'
GO


--
-- check stats
--
select t='vmr_load', ae='_ALL', ct = count(*), taxnode_id_ct=count(taxnode_id) from [vmr_load]
union all 
select t='vmr_load', ae=exemplar, ct = count(*), taxnode_id_ct=count(taxnode_id) from [vmr_load] group by exemplar
union all
select t='vmr', ae='_ALL', ct = count(*), taxnode_id_ct=count(taxnode_id) from [vmr]
union all 
select t='vmr', ae=exemplar, ct = count(*), taxnode_id_ct=count(taxnode_id) from [vmr] group by exemplar
order by ae, t

