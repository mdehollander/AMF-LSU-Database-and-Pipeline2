# Quick Start 

```
export C_ENV="amf_pipeline"

pixi exec nextflow run nf-core/ampliseq -r 2.15.0 -params-file nf-params.json --skip_dada_taxonomy

mkdir q2files

bash AMFrenameASVs.sh

bash AMFtrimmedToASVs.sh

export R1cutoff=170
export R2cutoff=140

bash AMFalignseqs.sh 

bash AMFlaunchTrees.sh

# Clean the tree with gappa

pixi exec gappa prepare clean-tree --tree-file Root_V18_LSUDB_052025.newick --remove-comments-and-nhx     

mkdir AMFtree.ENVbackbone
pixi exec epa-ng --tree clean-tree.newick --ref-msa ./V18_LSUDB_052025_cut_aligned.fasta --query ./BLAST_ASVrepseqs_clean_aligned.fasta --model GTR+G --threads 80 --outdir AMFtree.ENVbackbone --redo

pixi exec gappa examine graft --jplace-path AMFtree.ENVbackbone/epa_result.jplace --allow-file-overwriting

mkdir ./RAxMLfiles/
cd RAxMLfiles/
ln -s ../epa_result.newick RAxML_bestTree.newick
cd ..
mkdir cladeOutputs/
bash AMFcladesExtract.sh

bash AMFcladeTaxonomy.sh
```


