module Rx_Uart(
    clk,
    rst,
    Rx,
    ready,
    data_out
);
output [7:0]data_out;
output reg ready;
input clk,rst,Rx;


reg [7:0]buffer;
parameter idle=1'b0,receive_data=1'b1;

reg [1:0]state;
reg [2:0]counter;

always@(posedge clk or posedge rst)begin
    if(rst)begin
        buffer<=8'b0;
        ready<=1'b0;
        state<=idle;
        counter<=3'b0;
    end
    else begin
        case (state)
        idle: begin
            ready<=1'b0;
            if(Rx==1'b0)begin
                state<=receive_data;
            end
        end


        receive_data: begin
            buffer[counter]=Rx;
            counter=counter+1;
            if(counter==3'b000)begin
                state=idle;
                ready=1'b1;
            end
        end



        endcase

    end
end
assign data_out=buffer;

endmodule