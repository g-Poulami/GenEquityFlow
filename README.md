# GenEquityFlow: Ancestry-Aware Biomarker Pipeline
![CI](https://github.com/g-Poulami/GenEquityFlow/actions/workflows/main.yml/badge.svg)
![Workflow: Snakemake](https://img.shields.io/badge/Workflow-Snakemake-green)
![Environment: Conda](https://img.shields.io/badge/Environment-Conda-blue)
![License: MIT](https://img.shields.io/badge/License-MIT-yellow)

GenEquityFlow is an automated bioinformatics pipeline designed to quantify the Generalizability Gap in cancer genomics. By comparing biomarker frequencies across diverse ancestral populations, this tool highlights healthcare disparities and the scientific necessity of inclusive cohort design.

## Visual Workflow
The pipeline architecture follows a modular design to ensure each step is fully traceable and reproducible.



### Pipeline Stages
1. **Upstream Processing**: Raw FASTQ reads are aligned to the hg38 reference genome using BWA-MEM.
2. **Variant Discovery**: Sorted BAM files are processed through bcftools to generate high-quality VCFs (QUAL > 30).
3. **Functional Interpretation**: Variants are annotated with functional metadata to identify potential protein-altering mutations.
4. **Downstream Analytics**: Population cohorts (South Asian vs. European) are statistically compared to calculate biomarker frequency gaps.

## Key Features
* Scalable Automation: Managed by Snakemake for reproducible execution.
* Rigorous Filtering: Implements a multiallelic model with strict quality thresholds.
* CI/CD Integrated: Automated linting and syntax checking via GitHub Actions.

## Repository Structure
* Snakefile: Core logic defining the ordered steps of the pipeline.
* config.yaml: Parameters for samples and filtering.
* envs/: Conda YAML files for a fully traceable computational environment.
* scripts/: Python scripts for population analysis and visualization.

## Getting Started
1. Clone: git clone https://github.com/g-Poulami/GenEquityFlow.git
2. Run: snakemake --use-conda --cores 4
