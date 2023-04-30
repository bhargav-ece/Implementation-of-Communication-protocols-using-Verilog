
module Uart(
    clk_tx,
    clk_rx,
    rst_tx,
    rst_rx,
    data_tx,
    ready_tx,
    write_tx,
    ready_rx,
    data_rx
);

output ready_rx;
output [7:0]data_rx;

input clk_tx,clk_rx,rst_rx,rst_tx,ready_tx,write_tx;
input [7:0]data_tx;
wire data_line;
Tx_Uart Tx(
    clk_tx,
    rst_tx,
    data_tx,
    ready_tx,
    write_tx,
    data_line
);

Rx_Uart Rx(
    clk_rx,
    rst_rx,
    data_line,
    ready_rx,
    data_rx
);



endmodule