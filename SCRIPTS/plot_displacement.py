import numpy as np
import matplotlib.pyplot as plt
from collections import Counter
import argparse
import os

def read_offsets(filename):
    """Reads displacement values from the given file."""
    try:
        with open(filename, 'r') as f:
            offsets = [int(line.strip()) for line in f.readlines() if line.strip()]
        return offsets
    except FileNotFoundError:
        print(f"Error: File '{filename}' not found!")
        return []
    except ValueError:
        print(f"Error: Invalid data format in '{filename}'. Ensure it contains only integers.")
        return []

def compute_log2_distribution(offsets):
    """Computes log2 of absolute displacement values and their percentage distribution."""
    if not offsets:
        return []

    abs_offsets = [abs(o) for o in offsets if o > 0]  # Ignore zeros for log2
    log2_values = [int(np.log2(o)) if o > 0 else 0 for o in abs_offsets]

    counter = Counter(log2_values)
    total = sum(counter.values())

    percentages = {k: (v / total) * 100 for k, v in counter.items()}
    return sorted(percentages.items())  # Sorted for correct x-axis ordering

def plot_displacement_distribution(data, filename):
    """Plots the displacement distribution graph for a single dataset."""
    plt.figure(figsize=(8, 5))
    
    if data:
        x_vals, y_vals = zip(*data)
        plt.plot(x_vals, y_vals, marker='s', linestyle='-', color='black', label=os.path.basename(filename))
    
    plt.xlabel("Number of bits of displacement (log₂ scale)")
    plt.ylabel("Percentage of displacement")
    plt.title("Displacement Distribution")
    plt.legend()
    plt.grid(True, linestyle='--', linewidth=0.5)
    
    output_filename = f"{os.path.splitext(filename)[0]}_distribution.png"
    plt.savefig(output_filename, dpi=300)
    plt.show()
    print(f"Graph saved as {output_filename}")

if __name__ == "__main__":
    parser = argparse.ArgumentParser(description="Visualize displacement distributions from a file.")
    parser.add_argument("filename", type=str, nargs='?', help="Path to the displacement data file")
    args = parser.parse_args()
    
    if not args.filename:
        args.filename = input("Enter the filename containing displacement values: ").strip()
    
    offsets = read_offsets(args.filename)
    data = compute_log2_distribution(offsets)
    
    if data:
        plot_displacement_distribution(data, args.filename)
    else:
        print("No valid displacement data to plot.")
