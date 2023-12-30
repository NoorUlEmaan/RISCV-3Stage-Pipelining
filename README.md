# RISCV-3Stage-Pipelining


This repository contains the Verilog implementation of a processor design. The processor is designed to execute a set of instructions, and the code includes various modules such as the instruction cache, register file, data memory, forwarding unit, hazard detection unit, and more.

## Table of Contents

- [Overview](#overview)
- [Modules](#modules)
- [Design Diagram](#design-diagram)
- [Getting Started](#getting-started)
- [Usage](#usage)


## Overview

This is a complete design that encompasses various modules to execute instructions efficiently. It includes components like the instruction cache, register file, data memory, forwarding unit, hazard detection unit, instruction decoder, load/store unit, and more.

## Modules

### instruction_cache

A module representing the instruction cache responsible for storing and retrieving instructions.

### register_file

A module implementing the register file, allowing read and write access to registers.

### data_memory

A module representing the data memory used for storing and retrieving data.

### forwarding_unit

Manages data forwarding to handle hazards during instruction execution.

### hazard_detection_unit

Detects hazards in the instruction flow and generates signals to stall the pipeline if necessary.

### instruction_decoder

Decodes instruction formats and extracts relevant fields like opcode, operands, and immediate values.

### load_store_unit

Manages load and store operations in the memory.

### program_counter

Implements a program counter with reset and clock inputs.


## Design Diagram

RISCV-3Stage-Pipelining.drawio

## Getting Started

To use this Verilog processor design in your project, follow these steps:

1. Clone the repository:

   ```bash
   git clone https://github.com/NoorUlEmaan/RISCV-3Stage-Pipelining.git
