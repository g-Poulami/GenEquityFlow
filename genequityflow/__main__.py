import sys
import os
from snakemake import main as snakemake_main

def main():
    # Points to the Snakefile now inside the workflow/ directory
    snakefile_path = os.path.join(os.path.dirname(__file__), "..", "workflow", "Snakefile")
    args = sys.argv[1:] + ["--snakefile", snakefile_path, "--use-conda"]
    snakemake_main(args)

if __name__ == "__main__":
    main()
