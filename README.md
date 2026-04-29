# GenEquityFlow: Ancestry-Aware Biomarker Pipeline
![CI](https://github.com/g-Poulami/GenEquityFlow/actions/workflows/main.yml/badge.svg)
![Workflow: Snakemake](https://img.shields.io/badge/Workflow-Snakemake-green)
![Environment: Conda](https://img.shields.io/badge/Environment-Conda-blue)
![License: MIT](https://img.shields.io/badge/License-MIT-yellow)

GenEquityFlow is an automated bioinformatics pipeline designed to quantify the Generalizability Gap in cancer genomics. By comparing biomarker frequencies across diverse ancestral populations, this tool highlights healthcare disparities and the scientific necessity of inclusive cohort design.

## Project Overview
The pipeline processes high-throughput sequencing data from raw FASTQ files to a final population-level statistical report and visualization.

## Key Features
* Scalable Automation: Managed by Snakemake for reproducible execution.
* Rigorous Filtering: Implements a multiallelic model with strict quality thresholds (QUAL > 30).
* Functional Annotation: Identifies variants that plausibly alter protein function.
* CI/CD Integrated: Automated linting and syntax checking via GitHub Actions.

## Repository Structure
* Snakefile: Core logic defining the ten ordered steps of the pipeline.
* config.yaml: Parameters for samples and filtering.
* envs/: Conda YAML files for a fully traceable computational environment.
* .github/workflows/: CI/CD configuration for automated testing.

## Getting Started
1. Clone: git clone https://github.com/g-Poulami/GenEquityFlow.git
2. Run: snakemake --use-conda --cores 4
