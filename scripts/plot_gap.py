import matplotlib
matplotlib.use('Agg')  # Use a non-interactive backend
import matplotlib.pyplot as plt
import pandas as pd

# Load the generalizability report
df = pd.read_csv(snakemake.input.csv)

# Create the visualization
plt.figure(figsize=(10, 6))
x_labels = df['Biomarker']
sa_vals = df['South_Asian_Freq']
eu_vals = df['European_Freq']

x = range(len(x_labels))
plt.bar([i - 0.2 for i in x], sa_vals, width=0.4, label='South Asian', color='skyblue')
plt.bar([i + 0.2 for i in x], eu_vals, width=0.4, label='European', color='salmon')

plt.title('GenEquityFlow: Ancestry-Specific Biomarker Frequencies')
plt.ylabel('Allele Frequency')
plt.xticks(x, x_labels)
plt.legend()
plt.grid(axis='y', linestyle='--', alpha=0.7)

# Save the plot to the results folder
plt.tight_layout()
plt.savefig(snakemake.output.plot)
print("Visualization successful.")
