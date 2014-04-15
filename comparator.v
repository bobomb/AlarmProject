//**********************************************************/
// Structured VLSI - Spring 2014
// Alarm Clock Project
// Mofidul Islam Jamal
// Graduate Student, Florida Atlantic University
// mjamal1@fau.edu
//**********************************************************/

//at every clock the comparator checks to see if we should pulse the sound_alarm line
module comparator(
  input wire clk,
  input[15:0] current_time, 
  input[15:0] alarm_time, 
  output reg sound_alarm
  );

//start with a zero value
initial begin
  sound_alarm <= 0;
end

always@(posedge clk) begin
  if(current_time == alarm_time)
    sound_alarm <= 1;
  else
    sound_alarm <= 0;
end
endmodule
