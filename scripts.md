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


### Analysis

#### Running Trimmomatic - Cleaning reads of adapteurs

##### Navigate to 1_Raw
```bash
cd 1_Raw
```

##### Activate trimmomatic
```bash
conda activate trimmomatic
````

##### create a samplessample.txt with all samples:
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

