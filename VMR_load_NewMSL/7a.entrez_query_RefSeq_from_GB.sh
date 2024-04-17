elink -db nucleotide -id KP792687 -target nucleotide -name nuccore_nuccore_gbrs | efetch -format acc


elink -input "acc.txt" -db nucleotide -target nucleotide -name nuccore_nuccore_gbrs | efetch -format acc


elink -input "acc.txt" -db nucleotide -target nucleotide -name nuccore_nuccore_gbrs | efetch -format docsum | xtract -pattern DocumentSummary -sep "\t" -element Caption AssemblyAcc Organism TaxID > acc-out.txt


efetch -id KP792687 -db nucleotide -format gbc  | xtract -pattern INSDSeq -sep "\t" -element INSDSeq_primary-accession INSDSeq_organism -group INSDFeature -block INSDFeature_quals -element INSDQualifier_name INSDQualifier_value

efetch -db nuccore -format fasta -input "acc.list"


for file in xa*; efetch api_key=3aa3cede10b4d10a318cf2268e3af91ea209 -db nuccore -format fasta -input $file > $file.out

elink -input "VMR_MSL38_v2-accessions-All.txt" -db nucleotide -target nucleotide -name nuccore_nuccore_gbrs | efetch -format docsum | xtract -pattern DocumentSummary -sep "\t" -element Caption AssemblyAcc Organism TaxID > VMR_MSL38_v2-accessions-All-Efetch.out

for file in xa*; elink -input $file -db nucleotide -target nucleotide -name nuccore_nuccore_gbrs | efetch -format docsum | xtract -pattern DocumentSummary -sep "\t" -element Caption AssemblyAcc Organism TaxID > $file.out
