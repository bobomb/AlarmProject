//**********************************************************/
// Structured VLSI - Spring 2014
// Alarm Clock Project
// Mofidul Islam Jamal
// Graduate Student, Florida Atlantic University
// mjamal1@fau.edu
//**********************************************************/

module alarmclock_test();
  wire clk;
  wire reset;
  wire alarm_button;
  wire time_button;
  wire[9:0] keypad_buttons;
  alarmclock clock(
  clk, 
  reset,
  alarm_button, 
  time_button,
  keypad_buttons
);
endmodule
