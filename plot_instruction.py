import sys
import re
import matplotlib.pyplot as plt
from collections import defaultdict

# Define instruction categories
CATEGORY_MAP = {
    "add": "Add",
    "sub": "Sub",
    "mul": "Mult",
    "div": "Div",
    "lw": "Load",
    "sw": "Store",
    "lb": "Load",
    "sb": "Store",
    "jal": "Branch",
    "beq": "Branch",
    "bne": "Branch"
}

def parse_riscv_dump(filename):
    """Extract and categorize instruction counts from an objdump file"""
    instr_counts = defaultdict(int)

    try:
        with open(filename, "r") as f:
            for line in f:
                match = re.search(r'\s+[0-9a-f]+:\s+[0-9a-f]+\s+(\w+)', line)
                if match:
                    instr = match.group(1)
                    category = CATEGORY_MAP.get(instr, instr)  # Default to instr if not mapped
                    instr_counts[category] += 1
    except FileNotFoundError:
        print(f"Error: File {filename} not found!")
        sys.exit(1)

    return instr_counts

def format_output(counts, output_file):
    """Save the formatted instruction count output to a file."""
    with open(output_file, "w") as f:
        for instr, value in sorted(counts.items(), key=lambda x: x[1]):
            f.write(f"{instr} {value}\n")
    
    print(f"Formatted output saved to {output_file}")

def plot_instruction_counts(counts, output_file):
    """Generate a horizontal bar chart and save as PNG."""
    if not counts:
        print("No data to plot!")
        return

    sorted_counts = sorted(counts.items(), key=lambda x: x[1])
    instructions, values = zip(*sorted_counts)

    plt.figure(figsize=(6, 3))
    plt.barh(instructions, values, color="royalblue", edgecolor="black")

    plt.xlabel("Count")
    plt.title("RISC-V Instruction Frequency")
    plt.grid(axis="x", linestyle="--", alpha=0.7)

    plt.savefig(output_file, dpi=300, bbox_inches="tight")
    plt.close()
    print(f"Graph saved as {output_file}")

if __name__ == "__main__":
    if len(sys.argv) < 2:
        print("Usage: python3 analyze_riscv.py <dump_file>")
        sys.exit(1)

    input_file = sys.argv[1]
    txt_output = input_file.replace(".dump", ".txt")
    png_output = input_file.replace(".dump", ".png")

    instruction_counts = parse_riscv_dump(input_file)
    format_output(instruction_counts, txt_output)  # Save formatted text output
    plot_instruction_counts(instruction_counts, png_output)  # Save graph
