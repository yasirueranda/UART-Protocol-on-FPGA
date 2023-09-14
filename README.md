# UART-Protocol-on-FPGA
UART rx and tx implementation on Altera DE2-115 Board 

# Implementation Procedure
1. create a new project in intela quartus prime
2. add all files in to the project
   - uart.sv
   - receiver.sv
   - transmitter.sv
   - hexcoder.sv
   - uart.csv
3. set uart.sv as top module
4. import uart.csv (pin planning)
5. compile

KEY[0]   \- reset

KEY[1]   \- data_enable in transmitter

SW[7:0]  \- data input to transmitter
