// -----------------------------------------------------------------------------
// File        : clock_if.sv
// Author      : Kavita G Panjagall(1BM23EC118)
// Created     : 2026-01-28
// Module      : clock_if
// Project     : SystemVerilog and Verification (23EC6PE2SV),
//               Faculty: Prof. Ajaykumar Devarapalli
// ----------------------------------------------------------------------------- `timescale 1ns/1ps

interface clock_if (input logic clk);

    logic reset;
    logic [5:0] seconds;
    logic [5:0] minutes;

    modport DUT (
        input  clk, reset,
        output seconds, minutes
    );

    modport TB (
        input  clk, seconds, minutes,
        output reset
    );

endinterface
