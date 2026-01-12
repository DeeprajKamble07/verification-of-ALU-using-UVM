class alu_sequence extends uvm_sequence;
  `uvm_object_utils(alu_sequence);
  seq_item rst_pkt;
  function new(string name="alu_sequence");
    super.new(name);
    `uvm_info("sequence class","inside constructor phase",UVM_HIGH);
  endfunction
  
  task body();
    rst_pkt=seq_item::type_id::create("rst_pkt");
    start_item(rst_pkt);
    rst_pkt.randomize() with {rst==1;};
    finish_item(rst_pkt);
  endtask
endclass

class alu_child_seq extends alu_sequence;
  `uvm_object_utils(alu_child_seq);
  seq_item item;
  function new(string name="alu_child_seq");
    super.new(name);
    `uvm_info("sequence class","inside constructor phase",UVM_HIGH);
  endfunction
  
  task body();
    item=seq_item::type_id::create("item");
    start_item(item);
    item.randomize() with {rst==0;};
    finish_item(item);
  endtask
endclass
