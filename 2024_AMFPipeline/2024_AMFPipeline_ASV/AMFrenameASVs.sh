# WIP, paths needs to be adjusted
# This is a workaround method. If downstream processing scripts don't need the explicit ASV naming, this step becomes obsolete

# Add numbered ASVs to the fasta header, keeping the original hash
awk '/^>/{printf ">ASV_" ++i "_" substr($0,2) "\n"; next} 1' ../out-maxee/dada2/ASV_seqs.fasta  > q2files/ASV_seqs.fasta

# Also adjust the ASV_ID column in the table. Not the best approach, a second cut command is needed. But it works:
awk 'NR==1 {print "ASV_ID\t" $0; next} {print "ASV_" NR-1 "_" $1 "\t" $0}' ../out-maxee/dada2/ASV_table.tsv | cut --complement -f2 > q2files/ASV_table.tsv
