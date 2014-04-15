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
//first wait 6,666,240 (434 minutes or 7:14 time) then reset
#6666239 reset = 0;
#1 reset = 0;

//keypad simulate pressing of 4:35 and setting the current time to that
end
endmodule
