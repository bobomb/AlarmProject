//**********************************************************/
// Structured VLSI - Spring 2014
// Alarm Clock Project
// Mofidul Islam Jamal
// Graduate Student, Florida Atlantic University
// mjamal1@fau.edu
//**********************************************************/

module alarmclock_test();
  reg clk;
  reg reset;
  reg alarm_button;
  reg time_button;
  reg[9:0] keypad_buttons;
  alarmclock clock(
  clk, 
  reset,
  alarm_button, 
  time_button,
  keypad_buttons
);

initial begin
//first wait 6,666,240 (434 minutes or 7:14 time)
keypad_buttons = 9'h0;
alarm_button = 0;
time_button = 0;
#1 reset = 0;
#1 reset = 1;
//first wait 6,666,240 (434 minutes or 7:14 time) 
#6666245 
//show alarm time for 10 minutes
#1 alarm_button = 1;
#153601 alarm_button = 0;
//should show the time as 7:24ish when you get here
#1 alarm_button = 0;
//keypad simulate pressing of 04:35 and setting the current time to that
//0 (bit 0)
#10 keypad_buttons = 10'h1;
#10 keypad_buttons = 10'h0;
//4 (bit 4)
#10 keypad_buttons = 10'h10;
#10 keypad_buttons = 10'h0;
//3 (bit 4)
#10 keypad_buttons = 10'h8;
#10 keypad_buttons = 10'h0;
//5 (bit 4)
#10 keypad_buttons = 10'h20;
#10 keypad_buttons = 10'h0;
//now simulate time button to set the alarm time
#1 time_button = 1;
#1 time_button = 0;
end
endmodule
