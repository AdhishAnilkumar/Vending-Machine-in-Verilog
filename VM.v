`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
module VM(
    input clk,
    input reset,
    input [3:0] coins,
    input selA,
    input selB,
    output reg dispA,
    output reg dispB,
    output reg [3:0] balance,
    output reg insuff
);
    reg [3:0] state, next_state;

    parameter INIT = 4'b0000,BAL=4'b0001,INSUFF=4'b0010;//States 
    reg sel;
    parameter A = 4'b0101, B = 4'b1010; // Price of products

    // Sequential block: Handles clock and reset conditions 
    always @(posedge clk or posedge reset ) begin
        if (reset) begin
            state <= INIT;
            balance<=0;
        end else begin
            state <= next_state;
        end
    end

    // Combinational block: Handles state changes and calculation of balance 
    always @(*) begin
        // Default assignments
    next_state = state;
    balance=balance;
    dispA = 0;
    dispB = 0;
    insuff = 0;
  
   case(state)
    INIT: begin
        if(selA) begin
            if(coins >= A) begin
                  sel=0;
                next_state = BAL;
            end else begin
               sel=0;
               next_state =INSUFF;
            end
        end else if(selB) begin
            if(coins >= B) begin
            sel=1;
                next_state = BAL;
            end else begin
              sel=1;
                next_state = INSUFF;
            end
        end else begin
            next_state = INIT;
        end
    end
    
    BAL:begin
    if(sel==0)begin
    dispA=1;
    balance=coins-A;
    end
    else if(sel==1)begin
    dispB=1;
    balance=coins-B;
    end
    next_state=INIT;
    end 
  
  INSUFF:begin
if(sel==0)begin
dispA=1;
  insuff=1;
  balance=coins;
  next_state=INIT;
  end 
else if (sel==1)begin
dispB=1;
  insuff=1;
  balance=coins;
  next_state=INIT;
  end 
  else
    next_state=INIT;
  end
  
   default: begin
   next_state = INIT;
   end
        endcase
    end

endmodule



