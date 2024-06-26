module testBench2();

reg[2:0] opcode;
reg[3:0] input_data_4bit;
wire[3:0] output_data_4bit;
wire overflow_4bit;
reg[7:0] input_data_8bit;
wire[7:0] output_data_8bit;
wire overflow_8bit;
reg[15:0] input_data_16bit;
wire[15:0] output_data_16bit;
wire overflow_16bit;
reg[31:0] input_data_32bit;
wire[31:0] output_data_32bit;
wire overflow_32bit;
stack_base_alu #(4) stack_based_alu_4bit(.input_data(input_data_4bit),.opcode(opcode),.overflow(overflow_4bit),.output_data(output_data_4bit));
stack_base_alu #(8) stack_based_alu_8bit(.input_data(input_data_8bit),.opcode(opcode),.overflow(overflow_8bit),.output_data(output_data_8bit));
stack_base_alu #(16) stack_based_alu_16bit(.input_data(input_data_16bit),.opcode(opcode),.overflow(overflow_16bit),.output_data(output_data_16bit));
stack_base_alu #(32) stack_based_alu_32bit(.input_data(input_data_32bit),.opcode(opcode),.overflow(overflow_32bit),.output_data(output_data_32bit));
initial begin
   input_data_4bit=4'b0011;
   opcode =3'b110;
   #5
   input_data_4bit=4'b0100;
   #5
   opcode =3'b100;
   #5
   input_data_8bit=8'b11101011;
   opcode=3'b110;
   #5
   input_data_8bit=8'b00001010;
   #5
   opcode= 3'b101;
   #5
   input_data_16bit=16'b0101111111111111;
   opcode=3'b110;
   #5
   input_data_16bit=16'b0101111111111110;
   #5
   opcode=3'b100;
   #5
   input_data_32bit=32'b00000000000010000101111111111111;
   opcode=3'b110;
   #5
   input_data_32bit=32'b00000000000000000000000000001111;
   #5
   opcode=3'b101;
end
endmodule
