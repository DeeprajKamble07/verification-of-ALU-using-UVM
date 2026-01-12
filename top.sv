`timescale 1ns/1ns
import uvm_pkg::*;
`include "uvm_macros.svh";
`include "interface.sv"
`include "sequence_item.sv"
`include "sequence.sv"
`include "sequencer.sv"
`include "driver.sv"
`include "monitor.sv"
`include "scoreboard.sv"
`include "agent.sv"
`include "enivornment.sv"
`include "test.sv"

module top;
  logic clk;
  intf intff(.clk(clk));
  alu dut(.clk(intff.clk),.rst(intff.rst),.a(intff.a),.b(intff.b),.sel(intff.sel),.result(intff.result));
  initial begin
    uvm_config_db #(virtual intf)::set(null,"*","vif",intff);
  end
  initial begin
    run_test("test");
  end
  initial begin
    clk=0;
    forever #5 clk=~clk;
  end
  initial begin
    #50000;
    $display("sorry! ran out of time");
    $finish;
  end
  initial begin
    $dumpfile("dump.vcd");
    $dumpvars();
  end
endmodule
