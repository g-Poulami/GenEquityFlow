# GenEquityFlow: A Reproducible Pipeline for Ancestry-Aware Biomarker Analysis

**GenEquityFlow** is an automated Snakemake pipeline designed to identify the "Generalizability Gap" in cancer biomarkers across diverse ancestral populations.

### Key Features
* **Scalable Workflow**: Automates alignment (BWA), variant calling (BCFtools), and functional tagging.
* **Reproducibility**: Uses Conda environments to ensure consistent execution across different computational setups.
* **Clinical Insight**: Generates statistical reports and visualizations to highlight ancestry-linked differences in biomarker frequency.

### Pipeline Architecture
1. **Alignment & Processing**: Maps raw reads to hg38 and performs quality sorting.
2. **Variant Analysis**: Implements a multiallelic calling model with QUAL > 30 filtering.
3. **Functional Annotation**: Injects functional metadata (ANN fields) for impact assessment.
4. **Generalizability Analysis**: Compares allele frequencies between South Asian and European cohorts.

### Requirements
* Snakemake
* Conda / Mamba
