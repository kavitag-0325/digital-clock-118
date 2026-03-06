// -----------------------------------------------------------------------------
// File        : clock_tb.sv
// Author      : Kavita G Panjagall(1BM23EC118)
// Created     : 2026-01-28
// Module      : clock_tb
// Project     : SystemVerilog and Verification (23EC6PE2SV),
//               Faculty: Prof. Ajaykumar Devarapalli
// ----------------------------------------------------------------------------- `timescale 1ns/1ps
`timescale 1ns/1ps

module clock_tb;

    logic clk;

    // Interface instance
    clock_if vif(clk);

    // DUT
    digital_clock dut (
        .clk     (vif.clk),
        .reset   (vif.reset),
        .seconds (vif.seconds),
        .minutes (vif.minutes)
    );

    // Program block
    clock_test test (vif);

    // Clock generation
    initial begin
        clk = 0;
        forever #5 clk = ~clk;   // 100MHz sim clock
    end

    // Dump file
    initial begin
        $dumpfile("clock_wave.vcd");
        $dumpvars(0, clock_tb);
    end

endmodule
