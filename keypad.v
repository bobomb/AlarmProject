//**********************************************************/
// Structured VLSI - Spring 2014
// Alarm Clock Project
// Mofidul Islam Jamal
// Graduate Student, Florida Atlantic University
// mjamal1@fau.edu
//**********************************************************/

module keypad(
  input clk, 
  input [9:0] keypad_buttons, 
  input reset_shift, 
  output reg[15:0] keypad_values,
  output reg shift_pulse
  );
  //holds state of the keypad
  reg state;
  //holds decoded value of keypad button to be clocked into shift register when
  //keypad button transitions from 1 to 0
  reg[3:0] keypad_decoded;
  parameter INITIAL_STATE = 0;
  parameter SHIFT_IN = 1;
  parameter SHIFT_OUT = 2;
  
  //set initial states
  initial begin
    state = INITIAL_STATE;
    keypad_decoded = 0;
    shift_pulse = 0;
  end
  
  //reset  to blank segments the output values
  always@(reset_shift) begin
    keypad_values <= {4'ha, 4'ha, 4'ha, 4'ha};
  end
  
  //anytime the button is pressed
  always@(posedge keypad_buttons[0], posedge keypad_buttons[1],
  posedge keypad_buttons[2],posedge keypad_buttons[3],
  posedge keypad_buttons[4],posedge keypad_buttons[5],
  posedge keypad_buttons[6],posedge keypad_buttons[7],
  posedge keypad_buttons[8],posedge keypad_buttons[9]) begin
    case(keypad_buttons)
      10'b0000000000 : keypad_decoded = 10;
      10'b0000000001 : keypad_decoded = 0;
      10'b0000000010 : keypad_decoded = 1;
      10'b0000000100 : keypad_decoded = 2;
      10'b0000001000 : keypad_decoded = 3;
      10'b0000010000 : keypad_decoded = 4;    
      10'b0000100000 : keypad_decoded = 5;
      10'b0001000000 : keypad_decoded = 6;
      10'b0010000000 : keypad_decoded = 7;
      10'b0100000000 : keypad_decoded = 8;
      10'b1000000000 : keypad_decoded = 9;          
      default : keypad_decoded = 10;
    endcase
    
    if(state == INITIAL_STATE)
      state = SHIFT_IN;
  end
  
  always@(negedge keypad_buttons[0], negedge keypad_buttons[1],
  negedge keypad_buttons[2],negedge keypad_buttons[3],
  negedge keypad_buttons[4],negedge keypad_buttons[5],
  negedge keypad_buttons[6],negedge keypad_buttons[7],
  negedge keypad_buttons[8],negedge keypad_buttons[9]) begin
    if(state == SHIFT_IN) begin
      keypad_values = {keypad_values[11:0], keypad_decoded};
      state = INITIAL_STATE;
      shift_pulse = 1;
    end
  end
  
  always@(clk) begin
    shift_pulse = 0;
  end
endmodule