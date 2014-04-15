//**********************************************************/
// Structured VLSI - Spring 2014
// Alarm Clock Project
// Mofidul Islam Jamal
// Graduate Student, Florida Atlantic University
// mjamal1@fau.edu
//**********************************************************/

module keypad_multiplexor_sevensegment_test();
reg [15:0] current_time;
reg [15:0] alarm_time;
wire [15:0] keypad_time;
reg [1:0] selector;
wire[3:0] segment_0, segment_1, segment_2, segment_3;
wire[6:0] s0_disp, s1_disp, s2_disp, s3_disp;

wire clk;
reg [9:0] keypad_buttons;
wire reset_shift;
wire shift_pulse;

keypad kp(clk, keypad_buttons, reset_shift, keypad_time, shift_pulse);
multiplexor mult(current_time, alarm_time, keypad_time, selector, segment_0, segment_1, segment_2, segment_3);
sevensegment s0(segment_0, s0_disp);
sevensegment s1(segment_1, s1_disp);
sevensegment s2(segment_2, s2_disp);
sevensegment s3(segment_3, s3_disp);

initial begin
  #5 selector = 0; //show current (00:00)
  #5 current_time = {4'h0, 4'h0, 4'h0, 4'h0};
  #5 selector = 1; //show alarm (11:11)
  #5 alarm_time = {4'h1, 4'h1, 4'h1, 4'h1};
  //select the keypad time as output
  #5 selector = 2; //after keypad is hit all digits, should show 78:90
  //first punch in keypad time 1 2 3 4 5 6 7 8 9 0
  
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
  
end

initial begin
  $monitor($time," \n %c\t %c\t %c\t %c\n%c%c%c\t%c%c%c\t%c%c%c\t%c%c%c\n%c%c%c\t%c%c%c\t%c%c%c\t%c%c%c\n" ,
  s3_disp[0] ? "_" : " ", s2_disp[0] ? "_" : " ", s1_disp[0] ? "_" : " ", s0_disp[0] ? "_" : " ",
  
  s3_disp[5] ? "|" : " ", s3_disp[6] ? "_" : " ", s3_disp[1] ? "|" : " ", 
  s2_disp[5] ? "|" : " ", s2_disp[6] ? "_" : " ", s2_disp[1] ? "|" : " ", 
  s1_disp[5] ? "|" : " ", s1_disp[6] ? "_" : " ", s1_disp[1] ? "|" : " ", 
  s0_disp[5] ? "|" : " ", s0_disp[6] ? "_" : " ", s0_disp[1] ? "|" : " ",
   
  s3_disp[4] ? "|" : " ", s3_disp[3] ? "_" : " ", s3_disp[2] ? "|" : " ",
  s2_disp[4] ? "|" : " ", s2_disp[3] ? "_" : " ", s2_disp[2] ? "|" : " ",
  s1_disp[4] ? "|" : " ", s1_disp[3] ? "_" : " ", s1_disp[2] ? "|" : " ",
  s0_disp[4] ? "|" : " ", s0_disp[3] ? "_" : " ", s0_disp[2] ? "|" : " "
  
  );
end
endmodule
