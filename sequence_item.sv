class seq_item extends uvm_sequence_item;
  `uvm_object_utils(seq_item);
  rand logic rst;
  rand logic [7:0] a,b;
  rand logic [3:0] sel;
  logic [7:0] result;
  constraint c1{a inside {[10:20]};}
  constraint c2{b inside {[1:10]};}
  constraint c3{sel inside {0,1,2,3};}
  function new(string name="seq_item");
    super.new(name);
    `uvm_info("Seq_item","inside constructor class",UVM_HIGH);
  endfunction
endclass
