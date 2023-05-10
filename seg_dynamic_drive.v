module seg_dynamic_drive(
input  clk,
input [15:0] data, 
input  [3:0] dp,  
  

output reg [3:0] SEG_S,  
output reg [7:0] SEG,
output reg [7:0] data_to_pc
);

//------------------------------------------

reg [16:0] cnt;
always @ (posedge clk) 
 cnt <= cnt + 1'b1; 

reg [3:0] ASCII;
reg [3:0] HEX;    
always  @ (posedge clk)
begin
 case(cnt[16:15])  
  2'b00 : HEX <= data[3:0];
  2'b01 : HEX <= data[7:4];
  2'b10 : HEX <= data[11:8]; 
  2'b11 : HEX <= data[15:12];
  default : ;
 endcase
end

always  @ (posedge clk)
begin
 case(cnt[16:15])  
  
  
  2'b11 : ASCII<= 4'b1111;
  2'b10 : ASCII <= data[7:4];
  2'b01 : ASCII <= data[11:8]; 
  2'b00 : ASCII <= data[15:12];
  default : ;
 endcase
end

//--------------drive SEG_S----------------------
//Get SEG_S through cnt[16:15]  ,every 2.6114 mS move one time
always  @ (posedge clk) 
begin
 case(cnt[16:15])
  2'b00 : SEG_S <= 4'b0001;
  2'b01 : SEG_S <= 4'b0010;
  2'b10 : SEG_S <= 4'b0100;
  2'b11 : SEG_S <= 4'b1000;
  default : ;
 endcase
end

//---------drive dp------------------
always  @ (posedge clk)
begin
 case(cnt[16:15])
  2'b00 : SEG[7] <= dp[0];
  2'b01 : SEG[7] <= dp[1];
  2'b10 : SEG[7] <= dp[2];
  2'b11 : SEG[7] <= dp[3];
  default : ;
 endcase
end

//---------------------------------------
always @ (ASCII)
begin
                        
 case(ASCII)
      4'h0: data_to_pc[7:0] <= 8'b00110000;//00110000    // 0-display  1- not display 
      4'h1: data_to_pc[7:0] <= 8'b00110001;//00110001
      4'h2: data_to_pc[7:0] <= 8'b00110010;//00110010 
      4'h3: data_to_pc[7:0] <= 8'b00110011;//00110011
      4'h4: data_to_pc[7:0] <= 8'b00110100;//00110100
      4'h5: data_to_pc[7:0] <= 8'b00110101;//00110101
      4'h6: data_to_pc[7:0] <= 8'b00110110;//00110110
      4'h7: data_to_pc[7:0] <= 8'b00110111;//00110111
      4'h8: data_to_pc[7:0] <= 8'b00111000;//00111000
      4'h9: data_to_pc[7:0] <= 8'b00111001;//00111001
      4'hA: data_to_pc[7:0] <= 8'b01000001;//01000001
      4'hB: data_to_pc[7:0] <= 8'b01000010;//01000010
      4'hC: data_to_pc[7:0] <= 8'b01000011;//01000011
      4'hD: data_to_pc[7:0] <= 8'b01000100;//01000100
      4'hE: data_to_pc[7:0] <= 8'b01000101;//01000101
      4'hF: data_to_pc[7:0] <= 8'b00001101;//01000110
      default: ;
    endcase
end

always @ (HEX)
begin
 case(HEX)

      4'h0: SEG[6:0] <= 7'b1000000;    // 0-display  1- not display 
      4'h1: SEG[6:0] <= 7'b1111001;
      4'h2: SEG[6:0] <= 7'b0100100;
      4'h3: SEG[6:0] <= 7'b0110000;
      4'h4: SEG[6:0] <= 7'b0011001;
      4'h5: SEG[6:0] <= 7'b0010010;
      4'h6: SEG[6:0] <= 7'b0000010;
      4'h7: SEG[6:0] <= 7'b1111000;
      4'h8: SEG[6:0] <= 7'b0000000;
      4'h9: SEG[6:0] <= 7'b0010000;
      4'hA: SEG[6:0] <= 7'b0001000;
      4'hB: SEG[6:0] <= 7'b0000011;
      4'hC: SEG[6:0] <= 7'b1000110;
      4'hD: SEG[6:0] <= 7'b0100001;
      4'hE: SEG[6:0] <= 7'b0000110;
      4'hF: SEG[6:0] <= 7'b0001110;
      default: ;
    endcase
end
  

endmodule