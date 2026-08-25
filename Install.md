#### Installations

### Install miniconda
See Niko's protocol -> PC or MAC
https://github.com/oliviermaurin/MSc_ULB/blob/main/files/HybPiper%20Installation%20Guide%20for%20macOS.pdf

# Install HybPiper
See Niko's protocol -> PC or MAC
https://github.com/oliviermaurin/MSc_ULB/blob/main/files/HybPiper%20Installation%20Guide%20for%20macOS.pdf

# Install Trimmomatic - Trimming of raw fastq.tar.gz file
```bash
conda create -n trimmomatic -c bioconda -c conda-forge trimmomatic -y
```
```bash
conda deactivate
```

# Install mafft - Aligments of DNA matrices

```bash
conda create -n mafft -c bioconda -c conda-forge mafft -y
```
```bash
conda deactivate
```

# Install iqtree - Generating gene trees

```bash
conda create -n iqtree -c bioconda -c conda-forge iqtree -y
```
```bash
conda deactivate
```

# Install newick_utils - To generate a species tree

```bash
conda create -n newick_utils -c bioconda -c conda-forge newick_utils -y
```
```bash
conda deactivate
```

# Note that the abover version of newick_utils may fail on some platforms
```bash
conda create -n newick_utils
```
```bash
conda activate -n newick_utils
```
```bash
conda install -n base -c conda-forge mamba
```
```bash
conda config --env --set subdir osx-64
```
```bash
conda install -c bioconda -c conda-forge newick_utils
```

# Install biopython

```bash
conda install -c conda-forge biopython
```

# Install RAxML
```bash
conda create -n raxml -c bioconda -c conda-forge raxml -y
```
```bash
conda deactivate
````
# Install MrBayes
```bash
conda create -n mrbayes -c bioconda -c conda-forge mrbayes -y
```
```bash
conda deactivate
````
# Install modeltest-nj
```bash
CONDA_SUBDIR=osx-64 conda create -n modeltest-ng -c bioconda -c conda-forge modeltest-ng -y
conda activate modeltest-ng
conda config --env --set subdir osx-64
````
