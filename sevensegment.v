//**********************************************************/
// Structured VLSI - Spring 2014
// Alarm Clock Project
// Mofidul Islam Jamal
// Graduate Student, Florida Atlantic University
// mjamal1@fau.edu
//**********************************************************/

module sevensegment(
  input[3:0] number //4bit number representing the digit
  output reg [6:0] display //output is a 7 segment bit array
  );

parameter one_seg =   7'b0110000;
parameter two_seg =   7'b1011011;
parameter three_seg = 7'b1001111;
parameter four_seg =  7'b1100110;
parameter five_seg =  7'b1101101;
parameter six_seg =   7'b1111101;
parameter seven_seg = 7'b0000111;  
parameter eight_seg = 7'b1111111;
parameter nine_seg =  7'b1101111;
parameter zero_seg =  7'b0111111;
parameter error_seg=  7'b1011100;
parameter blank_seg=  7'b0001000;

always@(number) begin
  case (number)
    4'h0 : display <= zero_seg;
    4'h1 : display <= one_seg;
    4'h2 : display <= two_seg;
    4'h3 : display <= three_seg;
    4'h4 : display <= four_seg;
    4'h5 : display <= five_seg;
    4'h6 : display <= six_seg;
    4'h7 : display <= seven_seg;
    4'h8 : display <= eight_seg;
    4'h9 : display <= nine_seg;
    4'ha : display <= blank_seg;
    4'hb : display <= error_seg;
    default: display <= error_seg;
  endcase
end
          
endmodule