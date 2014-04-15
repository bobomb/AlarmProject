//**********************************************************/
// Structured VLSI - Spring 2014
// Alarm Clock Project
// Mofidul Islam Jamal
// Graduate Student, Florida Atlantic University
// mjamal1@fau.edu
//**********************************************************/

//the counting logic takes one_minute pulses from the timing generator
//and then counts those to advance its timecount in hours and minutes
//it also accepts a set_time pulse to change the time to whatever is in the 
//new_time_hr
module countinglogic(
  input wire one_minute,
  input wire reset,
  input wire set_time,
  input reg[15:0] new_time,
  output reg[15:0] display_value
  );
reg[4:0] hours; //5 bits since hours goes to 24 (5 bit value can hold up to 32)
reg[5:0] minutes; // 6 bits since minutes can go up to 60 (6 bit value can hold up to 64)

initial begin
  hours = 0;
  minutes = 0;
end

always@(set_time) begin
  //set hours to minute most sig * 10 + minute least sig
  hours = (new_time[15:12] * 10) + new_time[11:8];
  minutes = (new_time[7:4] * 10) + new_time[3:0];
  
    //figure out the hours digits here
  if(hours < 10) begin
    //diplsays 00, 01, 02, 03, 04, 05, 06, 07, 08, 09
    display_value[11:8] = hours; //least sig
    display_value[15:12] = 0;
  end
  else begin
    //displays 10+
    display_value[11:8] = (hours % 10);
    display_value[15:12] = (hours / 10);
  end
  
    //figure out the digits here
  if(minutes < 10) begin
    //diplsays 00, 01, 02, 03, 04, 05, 06, 07, 08, 09
    display_value[3:0] = minutes; //least sig
    display_value[7:4] = 0;
  end
  else begin
    //displays 10+
    display_value[3:0] = (minutes % 10);
    display_value[7:4] = (minutes / 10);
  end
end

always@(reset) begin
  hours = 0;
  minutes = 0;
  display_value = 16'h0;
end
  
always@(posedge one_minute) begin
  //increment minutes, then check to see if we incremented an hour
  minutes = minutes + 1;
  if(minutes == 60) begin
    minutes = 0; //reset minutes 
    hours = hours + 1; //increment hours
  end
  
  if(hours == 24) begin
    hours = 0; //start over when we hit 24 hrs
  end
  
  //figure out the hours digits here
  if(hours < 10) begin
    //diplsays 00, 01, 02, 03, 04, 05, 06, 07, 08, 09
    display_value[11:8] = hours; //least sig
    display_value[15:12] = 0;
  end
  else begin
    //displays 10+
    display_value[11:8] = (hours % 10); //remainder
    display_value[15:12] = (hours / 10); //integer divisor
  end
  
    //figure out the minutes digits here
  if(minutes < 10) begin
    //diplsays 00, 01, 02, 03, 04, 05, 06, 07, 08, 09
    display_value[3:0] = minutes; //least sig
    display_value[7:4] = 0;
  end
  else begin
    //displays 10+
    display_value[3:0] = (minutes % 10);
    display_value[7:4] = (minutes / 10);
  end
end
endmodule
