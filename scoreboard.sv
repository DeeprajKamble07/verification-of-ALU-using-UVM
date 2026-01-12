class scoreboard extends uvm_scoreboard;
  `uvm_component_utils(scoreboard);
  seq_item queue[$];
  uvm_analysis_imp #(seq_item,scoreboard) scoreboard_port;
  function new(string name="scoreboard", uvm_component parent=null);
    super.new(name,parent);
    `uvm_info("scoreboard class","inside constructor phase",UVM_HIGH);
    scoreboard_port=new("scoreboard_port",this);
  endfunction
  
  function void build_phase(uvm_phase phase);
    super.build_phase(phase);
    `uvm_info("scoreboard class","inside build phase",UVM_HIGH);
  endfunction
  
  function void connect_phase(uvm_phase phase);
    super.connect_phase(phase);
    `uvm_info("scoreboard class","inside connect phase",UVM_HIGH);
  endfunction
  
  function void write(seq_item item);
    queue.push_back(item);
  endfunction
  
  task run_phase(uvm_phase phase);
    super.run_phase(phase);
    `uvm_info("scoreboard class","inside run phase",UVM_HIGH);
    forever begin
    seq_item curr_item;
    wait(queue.size() != 0)
    curr_item=queue.pop_front();
    compare(curr_item);
    end
  endtask
  
  task compare(seq_item curr_item);
    logic [7:0] expected;
    logic [7:0] actual;
    case(curr_item.sel)
      0: begin
        expected=curr_item.a+curr_item.b;
      end
      1: begin
        expected=curr_item.a-curr_item.b;
      end
      2: begin
        expected=curr_item.a*curr_item.b;
      end
      3: begin
        expected=curr_item.a/curr_item.b;
      end
    endcase
    
    actual=curr_item.result;
    
    if(actual != expected)
      begin
        `uvm_error("compare",$sformatf("failed transaction! actual=%0d expected=%0d",actual,expected));
      end
    else
      begin
        `uvm_info("compare",$sformatf("passed transaction! actual=%0d expected=%0d",actual,expected),UVM_LOW);
      end
  endtask
endclass
