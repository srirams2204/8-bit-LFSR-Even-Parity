/*
 * Copyright (c) 2024 Sriram
 * SPDX-License-Identifier: Apache-2.0
 */

`default_nettype none

module tt_um_lfsr_parity (
    input  wire [7:0] ui_in,    // Dedicated inputs (not used)
    output wire [7:0] uo_out,   // LFSR output with parity
    input  wire [7:0] uio_in,   // IOs: Input path (not used)
    output wire [7:0] uio_out,  // IOs: Output path (unused)
    output wire [7:0] uio_oe,   // IOs: Enable path (active high: 0=input, 1=output)
    input  wire       ena,      // always 1 when the design is powered
    input  wire       clk,      // clock
    input  wire       rst_n     // reset_n - low to reset
);

  // Internal LFSR logic
  reg [6:0] lfsr;
  wire feedback = lfsr[6] ^ lfsr[5];  // taps at bit 6 and 5

  always @(posedge clk or negedge rst_n) begin
    if (!rst_n)
        lfsr <= 7'b0000001;
    else
        lfsr <= {lfsr[5:0], feedback};
  end

  // Output: LFSR bits + parity bit
  assign uo_out[6:0] = lfsr;
  assign uo_out[7]   = ~(^lfsr);  // even parity

  // IOs unused
  assign uio_out = 8'b0;
  assign uio_oe  = 8'b0;

  // Prevent unused input warnings
  wire _unused = &{ena, ui_in, uio_in, 1'b0};

endmodule

