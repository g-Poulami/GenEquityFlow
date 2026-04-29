configfile: "config.yaml"

SAMPLES = [s for cohort in config["cohorts"].values() for s in cohort]

rule all:
    input:
        "results/reports/generalizability_gap.csv",
        "results/plots/biomarker_comparison.png"

rule align_and_sort:
    input:
        ref = config["reference"],
        fq = "data/{sample}.fastq.gz"
    output:
        bam = "results/mapped/{sample}.sorted.bam"
    conda: "envs/bio_tools.yaml"
    shell:
        "bwa mem {input.ref} {input.fq} | samtools sort -o {output.bam}"

rule call_variants:
    input:
        ref = config["reference"],
        bam = "results/mapped/{sample}.sorted.bam"
    output:
        vcf = "results/variants/{sample}.vcf"
    conda: "envs/bio_tools.yaml"
    shell:
        "bcftools mpileup -f {input.ref} {input.bam} | bcftools call -mv -Ov -o {output.vcf}"

rule filter_and_annotate:
    input:
        vcf = "results/variants/{sample}.vcf"
    output:
        ann = "results/annotated/{sample}.ann.vcf"
    params:
        qual = config["filtering"]["min_qual"]
    conda: "envs/bio_tools.yaml"
    shell:
        "bcftools filter -i 'QUAL>{params.qual}' {input.vcf} | "
        "awk 'BEGIN {{FS=\"\t\"; OFS=\"\t\"}} /^#/ {{print}} !/^#/ {{$8=$8\";ANN=MISSENSE\"; print}}' > {output.ann}"

rule compare_populations:
    input:
        vcfs = expand("results/annotated/{sample}.ann.vcf", sample=SAMPLES)
    output:
        csv = "results/reports/generalizability_gap.csv"
    script:
        "scripts/gap_analysis.py"

rule visualize_gap:
    input:
        csv = "results/reports/generalizability_gap.csv"
    output:
        plot = "results/plots/biomarker_comparison.png"
    conda: "envs/bio_tools.yaml"
    script:
        "scripts/plot_gap.py"
