//**********************************************************/
// Structured VLSI - Spring 2014
// Alarm Clock Project
// Mofidul Islam Jamal
// Graduate Student, Florida Atlantic University
// mjamal1@fau.edu
//**********************************************************/

module multiplexor_sevensegment_test;
reg [15:0] current_time;
reg [15:0] alarm_time;
reg [15:0] keypad_time;
reg [1:0] selector;
wire[3:0] segment_0, segment_1, segment_2, segment_3;
wire[6:0] s0_disp, s1_disp, s2_disp, s3_disp;


multiplexor mult(current_time, alarm_time, keypad_time, selector, segment_0, segment_1, segment_2, segment_3);
sevensegment s0(segment_0, s0_disp);
sevensegment s1(segment_1, s1_disp);
sevensegment s2(segment_2, s2_disp);
sevensegment s3(segment_3, s3_disp);

initial begin
  current_time = {4'h0, 4'h0, 4'h0, 4'h0};
  alarm_time = {4'h1, 4'h2, 4'h3, 4'h4};
  keypad_time = {4'h9, 4'h3, 4'h6, 4'h2};
  selector = 0;
  #5 current_time = {4'h0, 4'h1, 4'h2, 4'h3};
  #5 current_time = {4'h4, 4'h5, 4'h6, 4'h7};
  #5 current_time = {4'h8, 4'h9, 4'ha, 4'hb};
  #5
  selector = 1;
  #5 
  selector = 2;
end

initial begin
  $monitor($time," \n %c\t %c\t %c\t %c\n%c%c%c\t%c%c%c\t%c%c%c\t%c%c%c\n%c%c%c\t%c%c%c\t%c%c%c\t%c%c%c\n" ,
  s3_disp[0] ? "_" : " ", s2_disp[0] ? "_" : " ", s1_disp[0] ? "_" : " ", s0_disp[0] ? "_" : " ",
  
  s3_disp[5] ? "|" : " ", s3_disp[6] ? "_" : " ", s3_disp[1] ? "|" : " ", 
  s2_disp[5] ? "|" : " ", s2_disp[6] ? "_" : " ", s2_disp[1] ? "|" : " ", 
  s1_disp[5] ? "|" : " ", s1_disp[6] ? "_" : " ", s1_disp[1] ? "|" : " ", 
  s0_disp[5] ? "|" : " ", s0_disp[6] ? "_" : " ", s0_disp[1] ? "|" : " ",
   
  s3_disp[4] ? "|" : " ", s3_disp[3] ? "_" : " ", s3_disp[2] ? "|" : " ",
  s2_disp[4] ? "|" : " ", s2_disp[3] ? "_" : " ", s2_disp[2] ? "|" : " ",
  s1_disp[4] ? "|" : " ", s1_disp[3] ? "_" : " ", s1_disp[2] ? "|" : " ",
  s0_disp[4] ? "|" : " ", s0_disp[3] ? "_" : " ", s0_disp[2] ? "|" : " "
  
  );
end
endmodule