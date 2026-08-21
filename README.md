# MSc_ULB

This is a README for the MSc course between **Meise Botanic Garden** and the **ULB** (Université Libre de Bruxelles).

It contains:

- ⚙️ **[`Install.md`](./Install.md)** — installation instructions for all required software
- 🧬 **[`data/`](./data)** — raw and processed data used throughout the course
- 💻 **[`scripts/`](./scripts)** — analysis scripts and pipelines (Trimmomatic, HybPiper, RAxML, etc.)
- 📄 **[`docs/`](./docs)** — protocols, slides, and additional course material

---

## Repository structure

```
MSc_ULB/
├── README.md
├── Install.md
├── data/
│   ├── raw/
│   └── processed/
├── scripts/
│   ├── trimming.sh
│   └── alignment.sh
└── docs/
```

---

## Getting started

1. Follow the setup instructions in [`Install.md`](./Install.md) to install Miniconda and all required tools (Trimmomatic, HybPiper, RAxML...).
2. Place or download your raw data into `data/raw/`.
3. Run the analysis scripts from `scripts/` in the order described below.

---

## Data

```
data/
├── raw/          # Raw, unmodified input data (e.g. fastq.tar.gz files)
└── processed/    # Data after trimming, assembly, or other processing steps
```

- Raw sequencing data (`.fastq`, `.fastq.gz`) are typically large files.
- ⚠️ GitHub has a **100 MB file size limit**. Large datasets should **not** be pushed directly to this repository.
- For large files, use one of the following instead:
  - [Git LFS](https://git-lfs.com/) (Large File Storage)
  - An external repository (e.g. [Zenodo](https://zenodo.org/))
  - A shared lab server or Google Drive, with a **link** placed here instead of the file itself
- If your files are small (<100 MB), upload them directly via GitHub's web interface ("Add file" → "Upload files") into the appropriate subfolder (`raw/` or `processed/`).

---
