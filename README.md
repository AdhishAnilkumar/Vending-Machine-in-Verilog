# Vending-Machine-in-Verilog

Objective of this project:**To design a vending machine in Verilog.**

This project focuses on Simulation of Vending Machine in Verilog using testbench and generating RTL (Register Transfer Logic ) design in **Vivado**. This project has been implemeneted using Mealy FSM  consisting of 3 states.<br>

i)**INIT**             :Initial state of syustem.<br>
ii)**BAL**             :Calculates balance and returns balance value.<br>
iii)**INSUFF**         :If in case amount is less than the product price, it reaches insufficient state and return the same amount as balance and declare insufficient.<br>

The machine accepts **single product input at a time** .The inputs in Verilog code are as follows:<br>
i)**coins**            :4 bit register to input amount.<br>
ii)**selA and selB**   :Selecting products A and B Vending machine.<br>

The outputs in code are as follows:<br>
i)**dispA and dispB**  :1 bit register to display which product has been send out.<br>
ii)**balance**         :4 bit register to print out remaining amount .<br>
iii)**insuff**         :To display when amount is insufficient.<br>

This project demonstrates the behavioral modeling of a **Mealy FSM** in Verilog and highlights its capability to generate outputs based on both the current state and input signals.
