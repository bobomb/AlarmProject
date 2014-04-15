//**********************************************************/
// Structured VLSI - Spring 2014
// Alarm Clock Project
// Mofidul Islam Jamal
// Graduate Student, Florida Atlantic University
// mjamal1@fau.edu
//**********************************************************/

//multiplexor takes in 3 16-bit fields that correspond to the digit values for 
//the time in hh:mm, with 4 bits per digit, with the digits occupying
//h[15:12]h[11:8] : m[7:4]m[3:0] for the 16 bit fields
//selector chooses between the 3 outputs, with select = 0 for showing current time
//selector = 1 to show the alarm time, and selector = 3 to show the values of the keypad buffer
//output is 4 bit numbers for the 7-segment display to decode
module multiplexor(
  input [15:0]current_time, 
  input [15:0] alarm_time, 
  input [15:0] keypad_time, 
  input [1:0] selector,
  output reg[3:0] segment_0, 
  output reg[3:0] segment_1, 
  output reg[3:0] segment_2, 
  output reg[3:0] segment_3
  );
parameter SHOW_CURRENT = 2'h0;
parameter SHOW_ALARM = 2'h1;
parameter SHOW_KEYPAD = 2'h2;

always@(selector, current_time, alarm_time, keypad_time) begin
  case(selector)
    SHOW_CURRENT : begin
      segment_0 <= current_time[3:0];
      segment_1 <= current_time[7:4];
      segment_2 <= current_time[11:8];
      segment_3 <= current_time[15:12];
    end
    SHOW_ALARM : begin
      segment_0 <= alarm_time[3:0];
      segment_1 <= alarm_time[7:4];
      segment_2 <= alarm_time[11:8];
      segment_3 <= alarm_time[15:12];
    end
    SHOW_KEYPAD : begin
      segment_0 <= keypad_time[3:0];
      segment_1 <= keypad_time[7:4];
      segment_2 <= keypad_time[11:8];
      segment_3 <= keypad_time[15:12];
    end
    default: begin //default show current time
      segment_0 <= current_time[3:0];
      segment_1 <= current_time[7:4];
      segment_2 <= current_time[11:8];
      segment_3 <= current_time[15:12];
    end
  endcase
end
endmodule