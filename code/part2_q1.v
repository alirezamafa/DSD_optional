module postfix #((parameter N=8)(
  input signed [N-1:0] char,
  input wire check,
  input wire is_free,
  output reg signed [N-1:0] fianl_out
);
  reg [2:0] op_opcode;
  reg [2:0] num_opcode;
  wire overflow;
  wire signed [N-1:0] op_out;
  wire signed [N-1:0] num_out;
  reg signed [N-1:0] op_reg; 
  reg signed [N-1:0] operatian; 
  stack_base_alu #(N) num_stack(.input_data(op_reg), .opcode(num_opcode), .output_data(num_out),.overflow(overflow));
  stack_base_alu #(N) op_stack(.input_data(operatian), op_opcode, .output_data(op_out), .overflow(overflow));
  always @(*) begin
  if (check) begin
    if (char == 16'h002b) begin
      forever begin : loop
        op_opcode =3'b111;
        #10;
        op_opcode = 3'bxxx;
        
        if (op_out == 16'h0028) begin
          operatian = 16'h0028;
          op_opcode = 3'b110;
          #10; 
          op_opcode = 3'bxxx;
          disable loop;
          
        end
        else if(no_op == 1) begin
        disable loop;
        end
        else begin
          if (op_out == 16'h002b) begin
            num_opcode = 3'b100; //sum
            #10;
            op_reg = num_out;
            num_opcode =3'b111;
             #10
            num_opcode =3'b111;
             #10
            num_opcode = 3'b110; // push
            #10;
            num_opcode = 3'bxxx;

          end
        end

    end
    operatian = 16'h002b;
    op_opcode = 3'b110;
    #10;
    op_opcode = 3'bxxx;

  end
  
  end
  else begin
    op_reg = char;
    num_opcode = 3'b110;
    #10; 
    num_opcode = 3'bxxx;
    
    if (is_free) begin
      forever begin : loop1
        op_opcode =3'b111;
        #10;
        op_opcode = 3'bxxx;

        if(no_op == 1) begin
          disable loop1;
        end
        else begin
          if (op_out == 16'h002b) begin
            num_opcode = 3'b100; //sum
            #10;
            op_reg = num_out;
            num_opcode =3'b111;
             #10
            num_opcode =3'b111;
             #10
            num_opcode = 3'b110; // push
            #10;
            num_opcode = 3'bxxx;

          end
        end

    end
     num_opcode =3'b111;
      #10;
      fianl_out = num_out;
    
      
    end

    
  end
  end
    

endmodule