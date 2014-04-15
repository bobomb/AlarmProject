//**********************************************************/
// Structured VLSI - Spring 2014
// Alarm Clock Project
// Mofidul Islam Jamal
// Graduate Student, Florida Atlantic University
// mjamal1@fau.edu
//**********************************************************/

module keypad_test;
wire clk;
reg [9:0] keypad_buttons;
reg keypad_reset_shift;
wire[15:0] keypad_values;
wire shift_pulse;

keypad kp(clk, keypad_buttons, keypad_reset_shift, keypad_values, shift_pulse);

initial begin

  //0 (bit 0)
  #10 keypad_buttons = 10'h1;
  #10 keypad_buttons = 10'h0;
  //1 (bit 2)
  #10 keypad_buttons = 10'h2;
  #10 keypad_buttons = 10'h0;
  //2 (bit 3)
  #10 keypad_buttons = 10'h4;
  #10 keypad_buttons = 10'h0;
  //3 (bit 4)
  #10 keypad_buttons = 10'h8;
  #10 keypad_buttons = 10'h0;
  //4 (bit 4)
  #10 keypad_buttons = 10'h10;
  #10 keypad_buttons = 10'h0;
  //5 (bit 4)
  #10 keypad_buttons = 10'h20;
  #10 keypad_buttons = 10'h0;
  //6 (bit 4)
  #10 keypad_buttons = 10'h40;
  #10 keypad_buttons = 10'h0;
  //7 (bit 4)
  #10 keypad_buttons = 10'h80;
  #10 keypad_buttons = 10'h0;
  //8 (bit 4)
  #10 keypad_buttons = 10'h100;
  #10 keypad_buttons = 10'h0;
  //9 (bit 4)
  #10 keypad_buttons = 10'h200;
  #10 keypad_buttons = 10'h0;
  //0 (bit 0)
  #10 keypad_buttons = 10'h1;
  #10 keypad_buttons = 10'h0;
  //reset the shift reg
  #1  keypad_reset_shift = 1;
  #1  keypad_reset_shift = 0;
    //6 (bit 4)
  #10 keypad_buttons = 10'h40;
  #10 keypad_buttons = 10'h0;
  //7 (bit 4)
  #10 keypad_buttons = 10'h80;
  #10 keypad_buttons = 10'h0;
  //8 (bit 4)
  #10 keypad_buttons = 10'h100;
  #10 keypad_buttons = 10'h0;
  //9 (bit 4)
  #10 keypad_buttons = 10'h200;
  #10 keypad_buttons = 10'h0;
end
initial begin
  $monitor($time, "keypad buttons = %b, keypad_values = %d %d %d %d, shift_pulse = %b, reset_shift=%b", keypad_buttons, keypad_values[15:12], keypad_values[11:8], keypad_values[7:4], keypad_values[3:0], shift_pulse, keypad_reset_shift);
end

endmodule

