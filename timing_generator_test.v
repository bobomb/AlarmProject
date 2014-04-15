//**********************************************************/
// Structured VLSI - Spring 2014
// Alarm Clock Project
// Mofidul Islam Jamal
// Graduate Student, Florida Atlantic University
// mjamal1@fau.edu
//**********************************************************/

module timing_generator_test;
  wire clk;
  wire one_second;
  wire one_minute;
  wire reset;
  reg[16:0] clocks;
  timing_generator tgen(clk, reset, one_second, one_minute);
  
  initial begin
    clocks = 0;
    $monitor($time, " one_second = %b, one_minute = %b", one_second, one_minute);
  end
endmodule