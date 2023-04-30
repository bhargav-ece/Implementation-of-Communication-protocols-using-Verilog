module uart_Tb();
reg clk_tx,clk_rx,rst_tx,rst_rx,write_tx,ready_tx;
reg [7:0]data_tx;
wire [7:0]data_rx;
wire ready_rx;

Uart uut(
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

always #5 clk_tx=~clk_tx;
always #5 clk_rx=~clk_rx;

initial begin
    clk_tx<=1'b1;
    clk_rx=1'b0;
    rst_tx=1'b1;
    rst_rx=1'b1;
end

initial begin
    #18 rst_tx=1'b0;
    rst_rx=1'b0;
    #10 write_tx=1'b1;
    data_tx=8'b01001101;
    #5 write_tx=1'b0;
    data_tx=8'b0;
    #10 ready_tx=1'b1;
    #5 ready_tx=1'b0;
    
    #140 $finish;
end



initial begin
    $dumpfile("Uart.vcd");
    $dumpvars(0, uart_Tb); // dump all variables 
end

endmodule