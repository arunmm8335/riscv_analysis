import re
import numpy as np
import matplotlib.pyplot as plt
from collections import Counter

# Define regex patterns for integer and floating-point memory operations
INTEGER_PATTERN = re.compile(r"\b(lw|sw|lh|sh|lb|sb|ld|sd)\b\s+\w+,\s*(-?\d+)\(\w+\)")
FLOATING_PATTERN = re.compile(r"\b(flw|fsw|fld|fsd)\b\s+\w+,\s*(-?\d+)\(\w+\)")

def extract_displacements(file_path, pattern):
    """Extract displacement values from Base Displacement Addressing Mode instructions."""
    displacements = []
    with open(file_path, "r") as file:
        for line in file:
            match = pattern.search(line)
            if match:
                displacement = abs(int(match.group(2)))  # Take absolute values
                if displacement > 0:  # Ignore zero displacements
                    displacements.append(displacement)
    return displacements

def compute_log_distribution(displacements):
    """Computes log₂(displacement) and normalizes occurrences to percentages."""
    log_displacements = [int(np.log2(d)) for d in displacements if d > 0]
    count_distribution = Counter(log_displacements)

    # Normalize to percentages
    total = sum(count_distribution.values())
    percentages = {k: (v / total) * 100 for k, v in count_distribution.items()} if total > 0 else {}

    return percentages

def plot_displacement_distribution(integer_data, floating_data):
    """Plots the displacement distribution graph exactly like the reference image."""
    plt.figure(figsize=(10, 6))

    # X and Y values for Integer Operations
    x_values_int = sorted(integer_data.keys())
    y_values_int = [integer_data[x] for x in x_values_int]

    # X and Y values for Floating-point Operations
    x_values_float = sorted(floating_data.keys())
    y_values_float = [floating_data[x] for x in x_values_float]

    # Plot integer displacement distribution
    plt.plot(x_values_int, y_values_int, marker="s", linestyle="-", color="black", label="Integer average")

    # Plot floating-point displacement distribution
    plt.plot(x_values_float, y_values_float, marker="D", linestyle="-", color="black", label="Floating-point average")

    # Annotate Integer and Floating-point averages
    if x_values_int:
        plt.text(x_values_int[0] + 0.3, y_values_int[0] + 3, "Integer average", fontsize=10)
    if x_values_float:
        plt.text(x_values_float[0] + 1, y_values_float[0] + 3, "Floating-point average", fontsize=10)

    # Graph Labels
    plt.xlabel("Number of bits of displacement (log₂ scale)", fontsize=12)
    plt.ylabel("Percentage of displacement", fontsize=12)
    plt.title("Displacement Distribution in Base Displacement Addressing Mode", fontsize=14)

    # Styling to match reference
    plt.xticks(range(0, 16))  # Ensure full range of x-axis
    plt.yticks(range(0, 41, 5))  # Match Y-axis intervals
    plt.grid(True, linestyle="--", alpha=0.6)

    # Save & Show Graph
    plt.legend()
    plt.savefig("displacement_distribution.png", bbox_inches="tight")
    plt.show()

if __name__ == "__main__":
    # Use your actual RISC-V assembly file
    file_path = "matrix_operations_riscv.s"

    # Extract displacement values
    integer_displacements = extract_displacements(file_path, INTEGER_PATTERN)
    floating_displacements = extract_displacements(file_path, FLOATING_PATTERN)

    # Compute log₂ percentage distributions
    integer_data = compute_log_distribution(integer_displacements)
    floating_data = compute_log_distribution(floating_displacements)

    # Plot final graph matching reference image
    plot_displacement_distribution(integer_data, floating_data)
