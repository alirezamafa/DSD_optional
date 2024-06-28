module stack_base_alu#(parameter N=8)(input signed[N-1:0] input_data,[2:0] opcode,
output reg overflow ,reg signed [N-1:0] output_data);

//initial stack and pointer for it and also two regs in size 2n-1 for checking overflow and extended_reg
reg signed [N-1:0]stack [200:0];
integer pointer=0;
reg signed [2*N-1:0] checking_of;
reg signed [2*N-1:0] extended_reg;

always @(*)begin
    //multiply     
    if(opcode==3'b101 && pointer>=2)begin
        output_data=stack[pointer-1] * stack[pointer-2];
        checking_of=stack[pointer-1] * stack[pointer-2];
        extended_reg={{N{output_data[N-1]}},output_data};
        if(checking_of != extended_reg)begin
            overflow=1;
        end    
        else
            overflow=0;
    end 
    //addition
    else if(opcode==3'b100 && (pointer>=2))begin
        output_data=stack[pointer-1]+stack[pointer-2];
        if((stack[pointer-1][N-1]==stack[pointer-2][N-1]) && (output_data[N-1]!= stack[pointer-1][N-1]))begin
            overflow =1;
        end    
        else
            overflow=0;
    end       
    //push           
    else if(opcode==3'b110)begin
        stack[pointer]=input_data//put input in the current place of stack that pointer point into that;
        pointer=pointer +1//inc pointer;
    end
    //pop
    else if(opcode==3'111)begin
        pointer=pointer-1;//dec pointer
        output_data=stack[pointer]//pick the amount of stack in perevious place;
    end

end
endmodule            