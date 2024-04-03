USE [ICTVonline33]
GO

INSERT INTO [dbo].[virus_isolates_temp]
           ([order]
           ,[family]
           ,[subfamily]
           ,[genus]
           ,[species]
           ,[exemplar]
           ,[exemplar_isolate]
           ,[exemplar_genbank_accession]
           ,[exemplar_refseq_accession]
           ,[exemplar_seq_complete]
           ,[isolate_csv]
           ,[isolate_genbank_accession_csv]
           ,[isolate_seq_complete_csv]
           ,[alternative_name_csv]
           ,[abbrev_csv]
           ,[isolate_abbrev]
           ,[sort]
           ,[taxnode_id])
select * from virus_isolates  where exemplar = 'E' sort by 
            [order]
           ,[family]
           ,[subfamily]
           ,[genus]
           ,[species]
           ,[sort]
		  
		   
GO


