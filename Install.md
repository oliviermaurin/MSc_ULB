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

# Install iqtree - Generating gene trees

#### Quick command
```bash
conda create -n iqtree -c bioconda -c conda-forge iqtree -y
```
```bash
conda deactivate
```

#### OR long setup in four steps to run one after another (if above failed)
```bash
conda create -n iqtree
```
```bash
conda activate iqtree
```
```bash
conda install -c bioconda iqtree
```
```bash
conda deactivate

#### Quick command
```bash
conda create -n iqtree -c bioconda -c conda-forge iqtree -y
```
```bash
conda deactivate
```

# Install newick_utils - In connection with Astral, it will generate a species tree

#### Quick command
```bash
conda create -n newick_utils -c bioconda -c conda-forge newick_utils -y
```
```bash
conda deactivate
```

#### OR long setup in four steps to run one after another (if above failed)
```bash
conda create -n newick_utils
```
```bash
conda activate newick_utils
```
```bash
conda install -c bioconda newick_utils
```
```bash
conda deactivate

# Note that the abover version of newick_utils may fail
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

#Install biopythonls

conda install -c conda-forge biopython

#Install RAxML


conda create -n raxml

conda activate raxml

conda install bioconda::raxml

conda create -n raxml -c bioconda -c conda-forge raxml -y
