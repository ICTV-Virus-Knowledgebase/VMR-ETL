USE [ICTVonline39]
GO

/****** Object:  View [dbo].[virus_isolates]    Script Date: 5/9/2024 3:09:41 AM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO


ALTER VIEW [dbo].[virus_isolates]
AS
SELECT     
	 vmr.species,
	 -- exemplar (E record)
	 vmr.exemplar, vmr.exemplar_isolate, vmr.exemplar_genbank_accession, vmr.exemplar_refseq_accession, 
	 vmr.exemplar_seq_complete, 
	 -- isolate (A record)
	 vmr.isolate_csv, vmr.isolate_genbank_accession_csv, vmr.isolate_refseq_accession, vmr.isolate_seq_complete_csv, 
                   vmr.alternative_name_csv,
	 -- VMR metadata
	 vmr.abbrev_csv, vmr.isolate_abbrev,
	 vmr.sort, vmr.taxnode_id,
	 vmr.host, vmr.molecule, 
 	 -- taxonomy_node metadata
     tn.realm,
	 tn.subrealm, 
	 tn.kingdom, 
	 tn.subkingdom, tn.phylum, tn.subphylum, tn.class, tn.subclass, tn.[order], tn.suborder, 
     tn.family, tn.subfamily, tn.genus, tn.subgenus,
	 tn.left_idx,
     -- QC fields that compare to taxonomy_node for molecule and genome_coverage
	 qc_status =
		 (case when  vmr.molecule<> tn.inher_molecule then 'ERROR:molecule ' else '' end) +
		 (case when  tn.genome_coverage_name <> '' and tn.genome_coverage_name <>  isnull(vmr.exemplar_seq_complete, vmr.isolate_seq_complete_csv) then 'ERROR:genome_coverage ' else '' end),
	  qc_taxon_inher_molecule=tn.inher_molecule,
	  qc_taxon_genome_coverage = tn.genome_coverage_name
FROM         dbo.vmr vmr
LEFT OUTER JOIN dbo.taxonomy_node_names tn
     ON vmr.taxnode_id  =tn.taxnode_id
GO


