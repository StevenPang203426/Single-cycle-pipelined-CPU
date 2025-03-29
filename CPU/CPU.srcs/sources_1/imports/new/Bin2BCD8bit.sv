// 8-bit binary-to-BCD converter: 移位加3算法 
module Bin2BCD8bit(
    input  logic [7:0] b,
    output logic [9:0] p );
    
    logic [17:0] z;
    integer i;
    
    always_comb
    begin
        for(i=0; i<=17; i=i+1)
            z[i] = 0; //初始化
            
        z[10:3] = b; //左移3位
            
        repeat(5)   //重复5次
        begin
            // 如果个位大于5，则加3
            if(z[11:8] >=5) z[11:8]  = z[11:8] + 3;
            // 如果十位大于5，则加3
            if(z[15:12]>=5) z[15:12] = z[15:12] + 3;
            // 左移1位
            z[17:1] = z[16:0];
        end
        p = z[17:8];
    end
endmodule