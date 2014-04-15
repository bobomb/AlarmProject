//**********************************************************/
// Structured VLSI - Spring 2014
// Alarm Clock Project
// Mofidul Islam Jamal
// Graduate Student, Florida Atlantic University
// mjamal1@fau.edu
//**********************************************************/

module keypad_test;
wire clk;
reg [9:0] keypad_buttonss;
wire reset_shift;
wire[15:0] keypad_values;
wire shift_pulse;

keypad kp(clk, keypad_buttonss, reset_shift, keypad_values, shift_pulse);

initial begin
  #10 keypad_buttonss = 10'h1;
  #10 keypad_buttonss = 10'h0;
  #10 keypad_buttonss = 10'h2;
  #10 keypad_buttonss = 10'h0;
  #10 keypad_buttonss = 10'h4;
  #10 keypad_buttonss = 10'h0;
  #10 keypad_buttonss = 10'h8;
  #10 keypad_buttonss = 10'h0;
  #10 keypad_buttonss = 10'h10;
  #10 keypad_buttonss = 10'h0;
  #10 keypad_buttonss = 10'h20;
  #10 keypad_buttonss = 10'h0;
  #10 keypad_buttonss = 10'h40;
  #10 keypad_buttonss = 10'h0;
  #10 keypad_buttonss = 10'h80;
  #10 keypad_buttonss = 10'h00;
  #10 keypad_buttonss = 10'h100;
  #10 keypad_buttonss = 10'h0;
  #10 keypad_buttonss = 10'h200;
  #10 keypad_buttonss = 10'h0;
  #10 keypad_buttonss = 10'h400;
end
initial begin
  $monitor($time, "keypad buttons = %b, keypad_values = %d %d %d %d, shift_pulse = %b", keypad_buttonss, keypad_values[15:12], keypad_values[11:8], keypad_values[7:4], keypad_values[3:0], shift_pulse);
end

endmodule

