![](../../workflows/gds/badge.svg) ![](../../workflows/docs/badge.svg) ![](../../workflows/test/badge.svg) ![](../../workflows/fpga/badge.svg)

# Tiny Tapeout Verilog Project: 8-bit LFSR with Even Parity

This project implements an 8-bit Linear Feedback Shift Register (LFSR) with taps at bits 6 and 5. The most significant bit (MSB) of the output represents the even parity of the lower 7 bits. The design is wrapped in the Tiny Tapeout interface and is ready for simulation, cocotb testing, and tapeout submission.

---

## 🔧 Features

- 7-bit LFSR with feedback taps at bit 6 and bit 5
- MSB (`uo[7]`) outputs even parity of `uo[6:0]`
- Clock-driven with active-low reset (`rst_n`)
- Fully wrapped in Tiny Tapeout interface (`tt_um_lfsr_parity`)

---

## 📁 File Structure

- `src/tt_um_lfsr_parity.v` – Top-level module wrapped for Tiny Tapeout
- `src/lfsr_parity.v` – Core LFSR logic
- `test/tb.v` – Testbench for simulation
- `info.yaml` – Project metadata and configuration
- `docs/info.md` – Project description and port mapping

---


