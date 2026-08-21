###### Installations

# Install miniconda
See Niko's protocol -> PC or MAC

# Install HybPiper
See Niko's protocol -> PC or MAC

# Install Trimmomatic - Trimming of raw fastq.tar.gz file

#### Quick command
```bash
conda create -n trimmomatic -c bioconda -c conda-forge trimmomatic -y
```
```bash
conda deactivate
```

#### OR long setup in four steps to run one after another (if above failed)
```bash
conda create -n trimmomatic
```
```bash
conda activate trimmomatic
```
```bash
conda install -c bioconda trimmomatic
```
```bash
conda deactivate
```

# Install mafft - Aligments of DNA matrices

#### Quick command
```bash
conda create -n mafft -c bioconda -c conda-forge mafft -y
```
```bash
conda deactivate
```

#### OR long setup in four steps to run one after another (if above failed)
```bash
conda create -n mafft
```
```bash
conda activate mafft
```
```bash
conda install -c bioconda mafft
```
```bash
conda deactivate
```

#Install iqtree

conda create -n iqtree

conda activate iqtree

conda install -c bioconda iqtree

#Install newick_utils

conda create -n newick_utils

conda activate newick_utils

conda install -c bioconda newick_utils


Try this on Mac:

conda create -n newick_utils
conda activate newick_utils
conda install -n base -c conda-forge mamba
conda config --env --set subdir osx-64
conda install -c bioconda -c conda-forge newick_utils

#Install biopythonls

conda install -c conda-forge biopython

#Install RAxML


conda create -n raxml

conda activate raxml

conda install bioconda::raxml

conda create -n raxml -c bioconda -c conda-forge raxml -y
