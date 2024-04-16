## Update VMR for new MSL release

Protocol: 
  * start with a DB that has the new MSL in table [taxonomy_node]
  * load latest VMR .xlsx (saved as UTF-16.txt) into DB table [vmr_load]
     * [1.backup_truncate_vmr.sql](1.backup_truncate_vmr.sql)
     * load via GUI
  * transfer new VMR data from [vrm_load] to [vrm] with SQL scripts
     * [2.vmr_load.sql](2.vmr_load.sql)
  * run the update scripts serially on [vmr]
     * [3.update_renamed_vmr_names.sql](3.update_renamed_vmr_names.sql)
     * [4.remove_abolished_species_from_vmr.sql](4.remove_abolished_species_from_vmr.sql)
     * [5.update_taxnode_id_vmr.sql](5.update_taxnode_id_vmr.sql)
     * [6.insert_into_vmr_from_tn.sql](6.insert_into_vmr_from_tn.sql)
  * acquire RefSeq accession numbers for new entries
     * [IVK-259](https://uab-lefkowitz.atlassian.net/browse/IVK-259) proposalProcessor does not transfer the refseq field from proposal.xlsx to taxonomy_node, so we only have genbank accessions
     * dump virus name and accession number from VMR records w/o refseq
     * [IVK-261](https://uab-lefkowitz.atlassian.net/browse/IVK-261) query NCBI for the correpsonding refseq entries
     * load those into [gb-rs]
     * update [vmr] from [gb-rs]
       * [7a.update_refseq-E.sql](7a.update_refseq-E.sql)
       * [7b.update_refseq-A.sql](7b.update_refseq-A.sql)
     * this process does not capture segment names. Hand-edit all new, multi-segmented viruses to add segment names to their refseq accessions
  * export new VMR to xlsx
     * [8.vmr_out.sql](8.vmr_out.sql)
