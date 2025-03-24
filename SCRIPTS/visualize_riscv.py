import sys
import matplotlib.pyplot as plt

def load_counts(filename):
    """ Load counts from a file and return a dictionary. """
    counts = {}
    total = 0
    try:
        with open(filename, "r") as f:
            for line in f:
                parts = line.strip().split()
                if len(parts) == 2 and parts[0].isdigit():
                    count, instr = parts
                    counts[instr] = int(count)
                    total += int(count)
    except FileNotFoundError:
        print(f"File {filename} not found!")
        sys.exit(1)
    return counts, total

def save_bar_chart(data, title, xlabel, ylabel, filename):
    """ Save a bar chart as PNG. """
    if not data:
        print(f"No valid data to plot for {title}")
        return
    plt.figure(figsize=(10, 5))
    plt.bar(data.keys(), data.values(), color='skyblue')
    plt.xlabel(xlabel)
    plt.ylabel(ylabel)
    plt.xticks(rotation=45)
    plt.title(title)
    plt.savefig(filename, dpi=300, bbox_inches='tight')
    plt.close()
    print(f"Saved {title} as {filename}")

def save_pie_chart(data, title, filename):
    """ Save a pie chart as PNG. """
    if not data:
        print(f"No valid data to plot for {title}")
        return
    plt.figure(figsize=(8, 8))
    plt.pie(data.values(), labels=data.keys(), autopct='%1.1f%%', colors=['lightblue', 'orange', 'green', 'red', 'purple'])
    plt.title(title)
    plt.savefig(filename, dpi=300, bbox_inches='tight')
    plt.close()
    print(f"Saved {title} as {filename}")

if __name__ == "__main__":
    if len(sys.argv) < 3:
        print("Usage: python3 visualize_riscv.py <instruction_counts.txt> <addressing_modes.txt>")
        sys.exit(1)

    instr_file = sys.argv[1]
    addr_file = sys.argv[2]

    # Process instruction counts
    instr_counts, _ = load_counts(instr_file)
    save_bar_chart(instr_counts, "Instruction Distribution", "Instruction", "Count", instr_file.replace(".txt", "_instr.png"))

    # Process addressing modes
    addr_counts, total_addr = load_counts(addr_file)
    addr_percentages = {k: (v / total_addr) * 100 for k, v in addr_counts.items()} if total_addr > 0 else {}
    save_pie_chart(addr_percentages, "Addressing Modes Distribution", addr_file.replace(".txt", "_addr.png"))
