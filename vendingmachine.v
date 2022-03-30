module vendingmachine(input clk,input rst,input [2:0]in,output reg [0:0]out,output reg [2:0]change);
parameter s0=2'b00;
parameter s1=2'b01;
parameter s2=2'b10;
reg [1:0]c_state;
reg [1:0]n_state;
always@(posedge clk)
begin
if(rst==1)
begin
c_state=0;
n_state=0;
end
else
begin
c_state=n_state;
case(c_state)
s0:
if(in==0)
begin
n_state=s0;
out<=0;
change<=0;
end
else if(in==1)
begin
n_state=s1;
out<=0;
change<=0;
end
else if(in==5)
begin
n_state=s0;
out<=1;
change<=3'b010;
end
else if(in==2)
begin
n_state=s2;
out<=0;
change<=0;
end
s1: 
if(in==0)
begin
n_state=s0;
out<=0;
change<=3'b001;
end
else if(in==1)
begin
n_state=s2;
out<=0;
change<=0;
end
else if(in==2)
begin
n_state=s0;
out<=1;
change<=0;
end
else if(in==5)
begin
n_state=s0;
out<=1;
change<=3'b011;
end
else if(in==0)
begin
n_state=s0;
out<=0;
change<=3'b001;
end
s2: 
if(in==0)
begin
n_state=s0;
out<=0;
change<=3'b010;
end
else if(in==1)
begin
n_state=s0;
out<=1;
change<=0;
end
else if(in==2)
begin
n_state=s0;
out<=1;
change<=3'b001;
end
else if(in==5)
begin
n_state=s0;
out<=1;
change<=3'b100;
end
endcase
end
end
endmodule
