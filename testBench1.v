module testBench1();

reg[4:0] input_data;
reg[2:0] opcode;
wire[4:0] output_data;
wire overflow;
stack_based_alu(.input_data(input_data),.output_data(output_data),.overflow(overflow).opcode(opcode));
initial begin
    input_data = 5'b10110;
    opcode = 3'b110;
    #5
    input_data = 5'b10010;
    #5
    opcode = 3'b100;
    #5
    input_data = 5'b01110;
    opcode = 3'b110;
    #5
    input_data= 5'b11101;
    #5
    opcode = 3'b100;
    #5
    input_data=5'b01000;
    opcode=3'b110;
    #5
    input_data=5'b01010;
    #5
    opcode=3'101;
    #5
    input_data = 5'00010;
    opcode=3'110;
    #5
    input_data=5'11011;
    #5
    opcode=3'b101;
    #5
    opcode=3'b111;
    #5
    opcode=3'bxxx;
    #5
    opcode=3'b111;

end 
endmodule    
