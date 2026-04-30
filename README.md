# GenEquityFlow: Ancestry-Aware Biomarker Analysis Pipeline
![CI Status](https://github.com/g-Poulami/GenEquityFlow/actions/workflows/main.yml/badge.svg)
![Workflow: Snakemake](https://img.shields.io/badge/Workflow-Snakemake-green)
![License: MIT](https://img.shields.io/badge/License-MIT-yellow)

GenEquityFlow is a reproducible bioinformatics framework designed to quantify the Generalizability Gap in cancer genomics. By comparing biomarker frequencies across diverse ancestral populations, this pipeline highlights the scientific necessity of inclusive cohort design.

## Computational Workflow
The pipeline orchestrates ten ordered steps to transform raw sequencing data into population-level insights:

```text
[ Raw FASTQ Reads ] 
       |
       v
(1) BWA-MEM Alignment  -----> [ Sorted BAM ]
       |
       v
(2) BCFtools Calling   -----> [ Raw VCF ]
       |
       v
(3) Quality Filtering  -----> [ Filtered VCF (QUAL > 30) ]
       |
       v
(4) Functional Tagging -----> [ Annotated VCF (ANN=MISSENSE) ]
       |
       v
(5) Gap Analysis       -----> [ CSV Report & PNG Visualization ]
```



## Pipeline Components
| Stage | Tool | Input | Output | Purpose |
| :--- | :--- | :--- | :--- | :--- |
| **Alignment** | BWA-MEM | FASTQ, hg38 | BAM | Precision mapping to human reference |
| **Processing** | Samtools | BAM | Sorted BAM | Coordinate sorting and indexing |
| **Variant Discovery** | BCFtools | BAM, hg38 | VCF | Multi-allelic variant calling |
| **Annotation** | Snakemake/Awk | VCF | Annotated VCF | Identifying protein-altering mutations |
| **Analytics** | Python/Pandas | Annotated VCFs | CSV/PNG | Quantifying ancestry frequency gaps |

## Key Features
* **Scalable Automation**: Managed by Snakemake for multi-core execution.
* **Rigorous Methodology**: Implements strict filtering and functional tagging to ensure clinical relevance.
* **Fully Traceable**: Every step generates execution logs in workflow/logs/ for auditing.
* **CI/CD Integrated**: Automated syntax and environment validation via GitHub Actions.

## Repository Structure
* **workflow/**: Core logic, including Snakefile, envs/, and scripts/.
* **genequityflow/**: Python entry point for package installation.
* **results/**: Output directory for BAMs, VCFs, and final reports.

## Getting Started
### Installation
```bash
git clone https://github.com/g-Poulami/GenEquityFlow.git
cd GenEquityFlow
pip install .
```

### Execution
```bash
snakemake --snakefile workflow/Snakefile --use-conda --cores 4
```

## Research Impact
This project demonstrates the ability to engineer workarounds for real-world constraints, such as server outages, while maintaining data integrity. It serves as a proof-of-concept for ancestry-aware precision medicine workflows.

## License
MIT License - See LICENSE for details.
