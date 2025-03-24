import re
import sys

def extract_base_displacement_offsets(filename):
    offsets = []
    pattern = re.compile(r"\b\w+\s+\w+,\s*(-?\d+)\(\w+\)")

    try:
        with open(filename, "r") as file:
            for line in file:
                match = pattern.search(line)
                if match:
                    offset = int(match.group(1))
                    offsets.append(offset)

        print(f"\nExtracted Offsets from {filename}:")
        print(offsets)

    except FileNotFoundError:
        print(f"Error: File '{filename}' not found!")

if __name__ == "__main__":
    if len(sys.argv) != 2:
        print("Usage: python3 extract_offsets.py <filename>")
    else:
        extract_base_displacement_offsets(sys.argv[1])
