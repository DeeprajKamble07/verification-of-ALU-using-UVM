module alu(input clk,rst,
           input [7:0]a,b,
           input [3:0] sel,
           output reg [7:0] result);
  always@(posedge clk or posedge rst)
    begin
      if(rst)
        begin
          result<=8'b0;
        end
      else
        begin
          case(sel)
            0: begin
              result=a+b;
            end
            1: begin
              result=a-b;
            end
            2: begin
              result=a*b;
            end
            3: begin
              result=a/b;
            end
            default: begin
              result=8'bx;
            end
          endcase
        end
    end
endmodule
