`default_nettype none
`timescale 1ns / 1ps

/* This testbench instantiates the wrapped LFSR parity module
   and connects it to the standard Tiny Tapeout interface.
   You can drive signals via cocotb or simulate directly.
*/
module tb ();

  // Dump the signals to a VCD file. View with gtkwave or surfer.
  initial begin
    $dumpfile("tb.vcd");
    $dumpvars(0, tb);
    #1;
  end

  // Inputs and outputs
  reg clk = 0;
  reg rst_n = 0;
  reg ena = 1;
  reg [7:0] ui_in = 8'b0;
  reg [7:0] uio_in = 8'b0;
  wire [7:0] uo_out;
  wire [7:0] uio_out;
  wire [7:0] uio_oe;

`ifdef GL_TEST
  wire VPWR = 1'b1;
  wire VGND = 1'b0;
`endif

  // DUT instantiation
  tt_um_lfsr_parity user_project (
`ifdef GL_TEST
    .VPWR(VPWR),
    .VGND(VGND),
`endif
    .ui_in  (ui_in),
    .uo_out (uo_out),
    .uio_in (uio_in),
    .uio_out(uio_out),
    .uio_oe (uio_oe),
    .ena    (ena),
    .clk    (clk),
    .rst_n  (rst_n)
  );

  // Clock generation
  always #5 clk = ~clk;

  // Stimulus
  initial begin
    #10 rst_n = 1;  // release reset

    // Run for 100 cycles
    repeat (100) begin
      #10;
      $display("Cycle %0d: LFSR = %b (Parity = %b)", $time/10, uo_out[6:0], uo_out[7]);
    end

    $finish;
  end

endmodule
