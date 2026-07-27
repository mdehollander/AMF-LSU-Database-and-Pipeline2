# Quick Start 

```
export C_ENV="amf_pipeline"

pixi exec nextflow run nf-core/ampliseq -r 2.15.0 -params-file nf-params.json --skip_dada_taxonomy

bash AMFrenameASVs.sh

bash AMFtrimmedToASV.sh

bash AMFalignseqs.sh 

bash AMFlaunchTrees.sh

pixi exec epa-ng --tree clean-tree.newick --ref-msa ./V18_LSUDB_052025_cut_aligned.fasta --query ./BLAST_ASVrepseqs_clean_aligned.fasta --model GTR+G --threads 80 --outdir AMFtree.ENVbackbone --redo

pixi exec gappa examine graft --jplace-path AMFtree.ENVbackbone/epa_result.jplace --allow-file-overwriting

bash AMFcladesExtract.sh

bash AMFcladeTaxonomy.sh
```


