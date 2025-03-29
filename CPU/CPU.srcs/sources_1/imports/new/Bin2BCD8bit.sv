// 8-bit binary-to-BCD converter: ��λ��3�㷨 
module Bin2BCD8bit(
    input  logic [7:0] b,
    output logic [9:0] p );
    
    logic [17:0] z;
    integer i;
    
    always_comb
    begin
        for(i=0; i<=17; i=i+1)
            z[i] = 0; //��ʼ��
            
        z[10:3] = b; //����3λ
            
        repeat(5)   //�ظ�5��
        begin
            // �����λ����5�����3
            if(z[11:8] >=5) z[11:8]  = z[11:8] + 3;
            // ���ʮλ����5�����3
            if(z[15:12]>=5) z[15:12] = z[15:12] + 3;
            // ����1λ
            z[17:1] = z[16:0];
        end
        p = z[17:8];
    end
endmodule