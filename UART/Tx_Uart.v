module Tx_Uart(
    clk,
    rst,
    data,
    ready,
    write,
    Tx
);

output reg Tx;
input [7:0]data;
input clk,rst,write,ready;
reg [2:0]state;
reg [2:0]counter;
reg RTS,RTW;
parameter idle =2'b0, start=2'b01, data_transfer=2'b10, stop=2'b11 ;
reg[7:0]buffer;
always@(posedge clk or posedge rst or posedge ready or posedge write) begin

if(rst)begin
    Tx<=1'b1;
    counter<=3'b0;
    state<=idle;
    RTW<=1'b0;
    RTS<=1'b0;
end
else begin
    case (state)
    idle: begin
        if(RTW==1'b1 & clk==1'b1)begin
            buffer=data;
            RTW<=1'b0;
        end
        else if(write==1'b1)begin
            RTW<=1'b1;
        end
        else begin
            RTW<=1'b0;
        end
        if(RTS==1'b1 & clk==1'b1)begin
            state=start;
            RTS<=1'b0;
        end
        else if(ready==1'b1)begin
            RTS<=1'b1;
        end
        else begin
            RTS<=1'b0;
        end
    end

    start: begin
        Tx<=1'b0;
        state<=data_transfer;
    end

    data_transfer: begin
        Tx=buffer[0];//LSB
        buffer={1'b0,buffer[7:1]};
        counter=counter+1;
        if(counter==3'b0)begin
            state<=stop;
            counter<=3'b0;
        end
    end

    stop: begin
        Tx<=1'b1;
        state<=idle;
    end
    endcase
end
end

endmodule