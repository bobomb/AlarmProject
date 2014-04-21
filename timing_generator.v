//**********************************************************/
// Structured VLSI - Spring 2014
// Alarm Clock Project
// Mofidul Islam Jamal
// Graduate Student, Florida Atlantic University
// mjamal1@fau.edu
//**********************************************************/

//timinggenerator takes in clock pulses, and counts them
//with the period of 256 clocks = 1 second
//generates a 1 clock pulse every second
//and also a 1 clock pulse every minute
module timing_generator(
  input clock, 
  input reset, 
  output reg one_second, 
  output reg one_minute
  );
  
  reg[7:0] pulse_counter;
  reg[6:0] second_counter;
  
  initial begin
    pulse_counter = 0;
    second_counter = 0;
  end
  
  always@(posedge reset) begin
  pulse_counter = 0;
  second_counter = 0;
  end
  always@(clock) begin
   one_second = 0;
   one_minute = 0;
  
  if(pulse_counter == 255)
    one_second = 1;
  
  pulse_counter <= pulse_counter + 1;
  end
  
  always@(posedge one_second) begin
    if(second_counter == 59) begin
      one_minute = 1;
      second_counter = 0;
     end else begin
      second_counter = second_counter + 1;
    end
  end  
  
endmodule