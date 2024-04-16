# VMR-ETL
ETL VMR xlsx into and out of our database

## Update VMR for new MSL release

[./VMR_load_NewMSL](./VMR_load_NewMSL)

Protocol: 
  * start with a DB that has the new MSL in table [taxonomy_node]
  * load latest VMR .xlsx (saved as UTF-16.txt) into DB table [vmr_load]
     * [1. backup_truncate_vmr.sql](1. backup_truncate_vmr.sql)
     * load via GUI
  * transfer new VMR data from [vrm_load] to [vrm] with SQL scripts
     * [2.vmr_load.sql](2.vmr_load.sql)
  * run the update scripts serially on [vmr]
     * [3. update_renamed_vmr_names.sql](3. update_renamed_vmr_names.sql)
     * [4. remove_abolished_species_from_vmr.sql](4. remove_abolished_species_from_vmr.sql)
     * [5. update_taxnode_id_vmr.sql](5. update_taxnode_id_vmr.sql)
     * [6. insert_into_vmr_from_tn.sql](6. insert_into_vmr_from_tn.sql)
  * accession numbers mysteriously appear in [gb-rs] and are used to update [vmr]
     * [7a.update_refseq-E.sql](7a.update_refseq-E.sql)
     * [7b.update_refseq-A.sql](7b.update_refseq-A.sql)
  * export new VMR to xlsx
     * [8. vmr_out.sql](8. vmr_out.sql)
