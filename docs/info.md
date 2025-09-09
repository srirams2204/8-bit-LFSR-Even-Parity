<!---

This file is used to generate your project datasheet. Please fill in the information below and delete any unused
sections.

You can also include images in this folder and reference them in the markdown. Each image must be less than
512 kb in size, and the combined size of all images must be less than 1 MB.
-->

## How it works

This project implements a compact pseudo-random number generator using a 7-bit Linear Feedback Shift Register (LFSR). The LFSR cycles through a maximal-length sequence of 127 unique states, driven by taps at bit positions 6 and 5. To enhance the output, a parity bit is computed and appended as the MSB, ensuring even parity across the full 8-bit output. This makes the design suitable for simple error detection or structured test vector generation.
The module is clocked synchronously and resettable. On each rising edge of the clock, the LFSR shifts and updates its state, while the parity bit is recalculated combinatorially.

## How to test

To test the module:

- Apply a clock signal to ui[0] and an active-high reset to ui[1].

- Observe the 8-bit output on uo[7:0]. The lower 7 bits represent the LFSR state, and the MSB (uo[7]) is the even parity bit.

- After reset, the LFSR initializes to a non-zero seed and begins cycling through its pseudo-random sequence.

- You can verify correctness by checking:

The sequence does not repeat until 127 cycles.

The parity bit ensures the total number of 1s in the output is even.

For simulation, use the provided Icarus Verilog testbench (tb.v) to run 100+ cycles and observe the output waveform or console logs.

## External hardware

LED, Logic Analyzer, etc
