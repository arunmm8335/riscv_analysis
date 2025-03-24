# RISC-V GNU Toolchain and SPEC CPU 2017 Analysis

## Project Overview
This project involves installing the RISC-V GNU Toolchain, compiling C programs into RISC-V binaries, and analyzing instruction distributions using SPEC CPU 2017 benchmarks. The objective is to explore RISC-V instruction sets, analyze addressing modes, and visualize instruction distributions.

## Group Members
- **Adithya B M** (221CS104)
- **Arun M Myageri** (221CS113)
- **Amit Kumar** (221CS207)
- **Rahul Mondal** (221CS142)
- **Sagnik Das** (221CS147)
- **Vivek Kumar** (221CS166)

## Installation of RISC-V GNU Toolchain
### Prerequisites
On Ubuntu, install the necessary dependencies:
```bash
sudo apt-get install autoconf automake autotools-dev curl python3 python3-pip python3-tomli \
    libmpc-dev libmpfr-dev libgmp-dev gawk build-essential bison flex texinfo gperf \
    libtool patchutils bc zlib1g-dev libexpat-dev ninja-build git cmake \
    libglib2.0-dev libslirp-dev
```

### Getting the Sources
```bash
git clone https://github.com/riscv/riscv-gnu-toolchain
cd riscv-gnu-toolchain
```

### Building the Toolchain
#### For Linux cross-compiler:
```bash
./configure --prefix=/opt/riscv
make linux
```

#### For Multilib Support (32-bit & 64-bit):
```bash
./configure --prefix=/opt/riscv --enable-multilib
make
```

## Compiling C Programs for RISC-V
### Example: Matrix Multiplication
```bash
riscv64-unknown-elf-gcc -o matrix_mult_riscv.elf matrix_mult.c
riscv64-unknown-elf-gcc -S -o matrix_mult_riscv.s matrix_mult.c
riscv64-unknown-elf-gcc -c -o matrix_mult_riscv.o matrix_mult.c
qemu-riscv64 matrix_mult_riscv.elf
```

## SPEC CPU 2017 Setup
### Prerequisites
```bash
sudo apt update && sudo apt install -y build-essential gfortran perl python2 unzip
```

### Installing SPEC CPU 2017
```bash
mkdir ~/spec_mount
sudo mount -o loop spec-cpu2017.iso ~/spec_mount
cd ~/spec_mount
./install.sh -d ~/spec2017
```

### Configuration
```bash
echo "export SPEC_DIR=~/spec2017" >> ~/.bashrc
echo "export PATH=$SPEC_DIR/bin:$PATH" >> ~/.bashrc
source ~/.bashrc
```

### Verify Installation
```bash
runcpu --version
```

## Instruction Analysis
### Counting RISC-V Instructions in Binaries
```bash
riscv64-unknown-elf-objdump -d binary.elf | awk '{print $3}' | sort | uniq -c | sort -nr > instruction_counts.txt
```

### Addressing Mode Analysis
Using `analyze_riscv.py`, we classify instructions into addressing modes and generate a summary graph:
```bash
python3 analyze_riscv.py binary.s
```

### Extracting Base Displacement Offsets
```bash
python3 extract_offsets.py binary.dump
```

### Visualizing Addressing Modes
```bash
python3 plot_displacement.py displacement_values.txt
```

## Outputs
- **Instruction distribution graphs** (`riscv_addressing_modes.png`)
- **Displacement distribution graphs**
- **Assembly files and dumps** (`*.s`, `*.dump`)

## Conclusion
This project provided insights into RISC-V compilation, instruction analysis, and benchmarking using SPEC CPU 2017. Future work includes optimizing instruction performance and exploring more benchmarking techniques.
