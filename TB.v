`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Testbench for Vending Machine
//////////////////////////////////////////////////////////////////////////////////

module VM_tb();

    reg clk;
    reg reset;
    reg [3:0] coins;
    reg selA;
    reg selB;
    wire dispA;
    wire dispB;
    wire [3:0] balance;
    wire insuff;

    // Instantiate the VM module
    VM inst(
        .clk(clk),
        .reset(reset),
        .coins(coins),
        .selA(selA),
        .selB(selB),
        .dispA(dispA),
        .dispB(dispB),
        .balance(balance),
        .insuff(insuff)
    );


   
    
        // Initialize inputs
       initial clk=0;
       always #5 clk =~clk;  //Time period of 10ns
        
  

    initial begin
        $monitor("Time=%0t | Amount=%d | selA=%b | selB=%b | dispA=%b | dispB=%b | insuff=%b | Balance=%d",
                  $time, coins, selA, selB, dispA, dispB, insuff, balance);
                  
                  reset = 1; //default
                  coins = 0;
                  selA = 0;
                  selB = 0;
                  
               
          
             
          #10 reset=0;//deresetting 
          #10 coins=12;selA=0;selB=1;      
          #10 reset=1;coins=0;selA=0;selB=0;//setting inputs 0 after reset 
          $display("Product B dispensed ");
             
          #20 //delay for next input 
             
          #10 reset=0;
          #10 coins=3;selA=1;selB=0;      
          #10 reset=1;coins =0;selA=0;selB=0;//setting inputs 0 after reset 
          $display("Product A not dispensed ");
 
             
             
             #10 $finish;  //end test
                  
    end
    
    


endmodule

