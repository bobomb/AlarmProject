//**********************************************************/
// Structured VLSI - Spring 2014
// Alarm Clock Project
// Mofidul Islam Jamal
// Graduate Student, Florida Atlantic University
// mjamal1@fau.edu
//**********************************************************/

module countinglogic_test();
reg one_sec;
reg one_minute;
reg reset;
wire[15:0] disp;
reg[5:0] new_time_hr, new_time_min;
reg new_time;
countinglogic count(one_minute, reset, new_time, new_time_hr, new_time_min, disp);
  integer i;
initial begin

//first count 24 hours and one minute
  for( i = 0; i < 1441; i = i + 1) begin
    #1 one_minute = 1;
    #1 one_minute = 0;  
  end
//then set some time to 11:45
  new_time_hr = 6'd11;
  new_time_min = 6'd45;
  #1 new_time = 1;
  #1 new_time = 0;
  //now count about 2 hours and 1 min
  for( i = 0; i < 121; i = i + 1) begin
    #1 one_minute = 1;
    #1 one_minute = 0;  
  end
  //now reset clock
  #1 reset = 1;
  #1 reset = 0;
  //now count another 2 hrs 1 minute
  for( i = 0; i < 121; i = i + 1) begin
    #1 one_minute = 1;
    #1 one_minute = 0;  
  end
  
end

initial begin
  $monitor($time, "disp = %d %d %d %d", disp[15:12], disp[11:8], disp[7:4], disp[3:0]);
end
endmodule
