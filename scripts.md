### Setting up the work environment
#### (1) Navigate to (2) Create folder and (3)Navigate to this folder
```bash
cd ~/Documents
```
```bash
mkdir Combretaceae_Analysis
```
```bash
cd Combretaceae_Analysis
```

### Copy scripts (1_scripts) and targets (2_targets) folders from Googledrive
#### Download and place both folders within Combretaceae_Analysis (do not download individuals files within each folders)

👉 Access the scripts folder [CLICK HERE](https://drive.google.com/drive/folders/1p7vpt3rqMgiPSDeD3HzoNsznFVYFeOqE?usp=drive_link)

👉 Access the targets folder [CLICK HERE](https://drive.google.com/drive/folders/1U8CsmAMU43nowDYPNBHyxp0V2a17O5J5?usp=drive_link)

### Download the Raw Data and place within Combretaceae_Analysis (do not download individuals files within each folders)

👉 Access the Raw data (.fastq.tar.gz)[CLICK HERE](https://drive.google.com/drive/folders/1-ReNA3Tf6iQaNfSFUbJ9tRuR9hftLIqE?usp=drive_link)

### Preparing and analysing the Raw Data

#### STEP_1 Running Trimmomatic - Cleaning reads of adapteurs

##### Navigate to 1_Raw
```bash
cd 1_Raw
```
##### Activate trimmomatic
```bash
conda activate trimmomatic
````
##### create a list of samples (sample.txt) with all samples:
```bash
for f in *R1.fastq.gz; do (echo ${f/_R1.fastq.gz}>> samples.txt); done
````
##### Run Trimmomatic in a loop.
```bash
while read -r name; do
    echo "Processing $name..."
    trimmomatic PE -phred33 \
        "${name}"_R1.fastq.gz "${name}"_R2.fastq.gz \
        "${name}"_R1_Tpaired.fastq "${name}"_R1_Tunpaired.fastq \
        "${name}"_R2_Tpaired.fastq "${name}"_R2_Tunpaired.fastq \
    ILLUMINACLIP:~/Documents/Combretaceae_Analysis/1_scripts/TruSeq3-PE-2.fa:1:30:7:2:true \
        SLIDINGWINDOW:4:30 LEADING:30 MINLEN:40
    cat "${name}"_R1_Tunpaired.fastq "${name}"_R2_Tunpaired.fastq > "${name}"_TunpairedAll.fastq
done < samples.txt
````
##### (1) Create folder and (2) Move trimmed output into it
```bash
mkdir ../2_Trimmed
````
```bash
mv *fastq ../2_Trimmed
````
👉 Access the Trimmed files (.fastq)[CLICK HERE](https://drive.google.com/drive/folders/1LBb-kk8ilU3VOzkFHQdkyEHC_y-snBGf?usp=drive_link)

 #### STEP_2 Running Hybpiper - Mapping Reads on target file
 ##### Navigate to the folder with Trimmed sequences files
````bash
cd 2_Trimmed
````
##### Activate Hybpiper
````bash
conda activate hybpiper
````
##### Create sample.txt
````bash
for f in *_R1_Tpaired.fastq; do (echo ${f/_R1_Tpaired.fastq} >> samples.txt); done
````
##### Run Hybpiper in a loop
````bash
while read -r name; do
    echo "Running HybPiper assemble for $name..."

    hybpiper assemble \
        --readfiles "${name}"_R*_Tpaired.fastq \
        --unpaired "${name}"_TunpairedAll.fastq \
        -t_aa /Documents/Combretaceae_Analysis/2_targets/translated_Baits_20.fasta  \
        --diamond \
        --prefix "${name}" \
        --cov_cutoff 4 \
        --cpu 8

done < samples.txt
````
##### (1) Create folder and (2) Move Hybpiper output into it
```bash
mkdir ../3_Hybpiper
````
```bash
mv *L001 ../3_Hybpiper
````
👉 Access the Hybpiper folders (*_L001)[CLICK HERE](https://drive.google.com/drive/folders/1OshLmjdvYS-8hOgjHJry0EzrK0iMcXfd?usp=drive_link)
#### STEP3 Generating Stats, Heatmap and DNA matrices
##### Navigate to the folder with Hybpiper output
````bash
cd 3_Hybpiper
````
##### Create sample.txt
````bash
ls *L001 > samples.txt
````
##### Step 3.1 - Generating the stats
```bash
hybpiper stats \
    -t_dna /Documents/Combretaceae_Analysis/2_Targets/translated_Baits_20.fasta \
    supercontig \
    ./samples.txt \
    --stats_filename 2_Supercontigs_stats \
    --seq_lengths_filename 2_Supercontigs_lenght
````
##### Step 3.2 - Generating a Heatmap
```bash
hybpiper recovery_heatmap \
    2_Supercontigs_lenght.tsv \
    --heatmap_filename 2_Supercontigs__Heatmap \
    --heatmap_filetype pdf
````
##### Step 3.3 - Retrieve sequences for all samples per loci
```bash
hybpiper retrieve_sequences \
    -t_dna /Documents/Combretaceae_Analysis/2_Targets/translated_Baits_20.fasta \
    supercontig \
    --sample_names ./samples.txt \
    --fasta_dir 2_Supercontigs
````

#### STEP 4 - Analysing the Sequence Data
```bash
mkdir ../4_Analysis
````
```bash
cp -r 2_Supercontigs ../4_Analysis/1_Supercontigs
````
##### Step 4.1 Mafft - Align matrices
###### Navigate to 3_Hybpiper
```bash
cd ../4_Analysis/1_Supercontigs
````
###### Activate Mafft
```bash
conda activate mafft
````
##### Create list of gene names
```bash
for f in *.fasta; do (echo ${f/.fasta} >> genenames.txt); done
````
##### Proceed to alignment for all loci in a loop
```bash
while IFS= read -r name || [ -n "$name" ]; do
    [ -z "$name" ] && continue
    mafft --thread 8 --localpair --maxiterate 1000 \
        "${name}.fasta" > "${name}_Supercontigs_Al.fas"
done < ./genenames.txt
````
##### Create diretory for aligned loci and move aligned loci into it
```bash
mkdir ../2_Aligned
````
```bash
mv *Al.fas ../2_Aligned
````
##### Step 4.2 Trimming using Phyutility - remove nucleotides if reperesented in less than 80% of samples 
###### Navigate to 2_Aligned
```bash
cd ../2_Aligned
````
###### Proceed to trimming
```bash
for f in *.fas; do (java -jar /Documents/Combretaceae_Analysis/1_scripts/phyutility.jar -clean 0.8 -in $f -out ${f/.fas}_Tr.fas); done
````
##### Step 4.3 Cleaning of trimmed aligments - Remove sequences in each loci which might ony be containing N or gaps (-)
```bash
for f in *fas; do (echo ${f/}>> samples.txt); done
````
```bash
python3  /Documents/Combretaceae_Analysis/1_scripts/CleaningNew.py
````
###### Step 4.4 iqtree - Generate gene trees (a tree per loci)
```bash
conda activate iqtree
````
```bash
for f in *fas; do (echo ${f/_Supercontigs_Al_Tr_Cl.fas}>> genenames.txt); done
````
```bash
while IFS= read -r name || [ -n "$name" ]; do
    [ -z "$name" ] && continue
    gene="${name}_Supercontigs_Al_Tr_Cl.fas"
    iqtree -s "$gene" -pre "${gene%.fas}" -bb 1000 -nt 2 -m MFP
done < ./genenames.txt
````
```bash
mkdir 
````
##### Step 4.5 Astral - Generate a species tree (or coalescent tree)
```bash
mkdir -p 7_Astral_V1
````
```bash
cat 6_IQTree_V1/*.treefile > 7_Astral_V1/iqtrees.trees
````
```bash
cd 7_Astral_V1
````
```bash
conda activate newick_utils
````
```bash
nw_ed iqtrees.trees 'i & b<=10' o > iqtree-BS10.trees
````
```bash
java -jar  /Documents/Combretaceae_Analysis/1_scripts/Astral/astral.5.7.8.jar -i iqtree-BS10.trees -o iqtree-BS10_sp_V1.tre --outgroup ERR4180096_1M_L001 -t 2 2> iqtree-astral_BS10.log
````

#Renaming tips
