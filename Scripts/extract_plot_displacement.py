import re
import sys
import numpy as np
import matplotlib.pyplot as plt
from collections import Counter

def extract_displacements(filename):
    """Extract displacement values from an assembly (.s) file."""
    with open(filename, 'r') as file:
        content = file.readlines()
    
    # Regex to find displacements like 8(sp), -16(fp), etc.
    pattern = re.compile(r'[-]?\d+(?=\()')
    
    displacements = []
    for line in content:
        matches = pattern.findall(line)
        displacements.extend(map(int, matches))  # Convert to integers
    
    return displacements

def compute_log2_distribution(displacements):
    """Compute log2 of absolute displacement values and their percentage distribution."""
    abs_displacements = [abs(d) for d in displacements if d != 0]
    log2_values = [int(np.log2(d)) if d > 0 else 0 for d in abs_displacements]  # log2 scale
    
    # Count occurrences and compute percentages
    counter = Counter(log2_values)
    total = sum(counter.values())
    
    percentages = {k: (v / total) * 100 for k, v in counter.items()}
    
    return sorted(percentages.items())  # Sorted by bit width

def plot_displacement_distribution(int_data, float_data, output_file):
    """Plot the displacement distribution graph."""
    plt.figure(figsize=(8, 5))
    
    # Integer displacements
    x_int, y_int = zip(*int_data) if int_data else ([], [])
    plt.plot(x_int, y_int, marker='s', linestyle='-', color='black', label="Integer average")

    # Floating-point displacements
    x_float, y_float = zip(*float_data) if float_data else ([], [])
    plt.plot(x_float, y_float, marker='d', linestyle='-', color='black', label="Floating-point average")

    # Labels and styles
    plt.xlabel("Number of bits of displacement (log₂ scale)")
    plt.ylabel("Percentage of displacement")
    plt.title("Displacement Distribution in Base Displacement Addressing Mode")
    plt.legend()
    plt.grid(True, linestyle='--', linewidth=0.5)
    
    # Save to file
    plt.savefig(output_file, dpi=300)
    print(f"Graph saved as {output_file}")
    plt.show()

if __name__ == "__main__":
    if len(sys.argv) < 2:
        print("Usage: python script.py <assembly_file.s>")
        sys.exit(1)
    
    asm_file = sys.argv[1]

    # Extract and process displacements
    displacements = extract_displacements(asm_file)

    # Split into integer-based and floating-point-based addressing (random assumption)
    int_displacements = [d for d in displacements if d % 2 == 0]  # Example condition
    float_displacements = [d for d in displacements if d % 2 != 0]  # Example condition

    int_data = compute_log2_distribution(int_displacements)
    float_data = compute_log2_distribution(float_displacements)

    # Generate the plot
    plot_displacement_distribution(int_data, float_data, "displacement_distribution.png")
