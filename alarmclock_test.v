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
#1 reset = 1;
#1 reset = 0;
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
//3 (bit 3)
#10 keypad_buttons = 10'h8;
#10 keypad_buttons = 10'h0;
//5 (bit 5)
#10 keypad_buttons = 10'h20;
#10 keypad_buttons = 10'h0;
//now simulate time button to set the current time to 4:35
#1 time_button = 1;
#1 time_button = 0;

//enter alarm time of 05:37
//0 (bit 0)
#2304 keypad_buttons = 10'h1; //9 second delay
#10 keypad_buttons = 10'h0;
//5 (bit 5)
#1280 keypad_buttons = 10'h20; //5 sec delay
#10 keypad_buttons = 10'h0;
//3 (bit 3)
#10 keypad_buttons = 10'h8;
#10 keypad_buttons = 10'h0;  
//7 (bit 7)
#10 keypad_buttons = 10'h80;
#10 keypad_buttons = 10'h0;
//set alarm time to 05:37
#1 alarm_button = 1;
#1 alarm_button = 0;

//wait for 10 minutes to pass then press alarm button to display alarm time for 5 minutes
#153601 alarm_button = 1;
#76800 alarm_button = 0;
//after that the time should be around 4:50 or so

///simulate pressing 3 keys and waiting 10 seconds for the keypad display to timeout
//6 (bit 6)
#10 keypad_buttons = 10'h40;
#10 keypad_buttons = 10'h0;
//7 (bit 7)
#10 keypad_buttons = 10'h80;
#10 keypad_buttons = 10'h0;
//8 (bit 8)
#10 keypad_buttons = 10'h100;
#10 keypad_buttons = 10'h0;
//9 (bit 9)
#10 keypad_buttons = 10'h200;
#10 keypad_buttons = 10'h0;

//wait 10 seconds
#2800
$display("should go back to time");
end
endmodule
