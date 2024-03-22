clc;
clear all;
close all;
 Layer4_out=textread("C:\Users\96348\Desktop\课题相关\FPGA-cnn\CNN_data\5\dat_save\lay4_dat.txt",'%s');
 Layer4_out=hex2dec(Layer4_out);
 Layer4_out=uint8(Layer4_out);
 Layer4_out=reshape(Layer4_out,5,5,16);
 Layer4_out=permute(Layer4_out,[2,1,3]);
 Layer4_out=int8(Layer4_out);

 %w45 read
W45=textread("C:\Users\96348\Desktop\课题相关\FPGA-cnn\CNN_data\5\dat_save\w45_dat.txt",'%s');

W45=signedhex_2_signeddec(W45);
W45=reshape(W45,5,5,120,16);
W45=permute(W45,[2,1,3,4]);%将权重矩阵转置
W45=int8(W45);

%b45 read
b45=textread("C:\Users\96348\Desktop\课题相关\FPGA-cnn\CNN_data\5\dat_save\b45_dat.txt",'%s');

b45=signedhex_2_signeddec(b45);
b45=int8(b45);
Layer4_out=double(Layer4_out);
W45=double(W45);
m=1;
n=1;
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%test%%%%%%%%%%%%%%%%%%
k=64;
test_sum5=zeros(16,1);
for a=1:16
        
        s_temp=Layer4_out(m,n,a)*W45(1,1,k,a)+Layer4_out(m,n+1,a)*W45(1,2,k,a)+Layer4_out(m,n+2,a)*W45(1,3,k,a)+Layer4_out(m,n+3,a)*W45(1,4,k,a)+Layer4_out(m,n+4,a)*W45(1,5,k,a)+...
                 Layer4_out(m+1,n,a)*W45(2,1,k,a)+Layer4_out(m+1,n+1,a)*W45(2,2,k,a)+Layer4_out(m+1,n+2,a)*W45(2,3,k,a)+Layer4_out(m+1,n+3,a)*W45(2,4,k,a)+Layer4_out(m+1,n+4,a)*W45(2,5,k,a)+...
                 Layer4_out(m+2,n,a)*W45(3,1,k,a)+Layer4_out(m+2,n+1,a)*W45(3,2,k,a)+Layer4_out(m+2,n+2,a)*W45(3,3,k,a)+Layer4_out(m+2,n+3,a)*W45(3,4,k,a)+Layer4_out(m+2,n+4,a)*W45(3,5,k,a)+...
                 Layer4_out(m+3,n,a)*W45(4,1,k,a)+Layer4_out(m+3,n+1,a)*W45(4,2,k,a)+Layer4_out(m+3,n+2,a)*W45(4,3,k,a)+Layer4_out(m+3,n+3,a)*W45(4,4,k,a)+Layer4_out(m+3,n+4,a)*W45(4,5,k,a)+...
                 Layer4_out(m+4,n,a)*W45(5,1,k,a)+Layer4_out(m+4,n+1,a)*W45(5,2,k,a)+Layer4_out(m+4,n+2,a)*W45(5,3,k,a)+Layer4_out(m+4,n+3,a)*W45(5,4,k,a)+Layer4_out(m+4,n+4,a)*W45(5,5,k,a);
        %sum5=s_temp+sum5;
        test_sum5(a,1)=s_temp;
        
        
    end

 %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%convolutional Layer5%%%%%%%%%%%%%%%%%%            
for k=1:120
    sum5=0;
    for a=1:16
        s_temp=0;
        s_temp=Layer4_out(m,n,a)*W45(1,1,k,a)+Layer4_out(m,n+1,a)*W45(1,2,k,a)+Layer4_out(m,n+2,a)*W45(1,3,k,a)+Layer4_out(m,n+3,a)*W45(1,4,k,a)+Layer4_out(m,n+4,a)*W45(1,5,k,a)+...
                 Layer4_out(m+1,n,a)*W45(2,1,k,a)+Layer4_out(m+1,n+1,a)*W45(2,2,k,a)+Layer4_out(m+1,n+2,a)*W45(2,3,k,a)+Layer4_out(m+1,n+3,a)*W45(2,4,k,a)+Layer4_out(m+1,n+4,a)*W45(2,5,k,a)+...
                 Layer4_out(m+2,n,a)*W45(3,1,k,a)+Layer4_out(m+2,n+1,a)*W45(3,2,k,a)+Layer4_out(m+2,n+2,a)*W45(3,3,k,a)+Layer4_out(m+2,n+3,a)*W45(3,4,k,a)+Layer4_out(m+2,n+4,a)*W45(3,5,k,a)+...
                 Layer4_out(m+3,n,a)*W45(4,1,k,a)+Layer4_out(m+3,n+1,a)*W45(4,2,k,a)+Layer4_out(m+3,n+2,a)*W45(4,3,k,a)+Layer4_out(m+3,n+3,a)*W45(4,4,k,a)+Layer4_out(m+3,n+4,a)*W45(4,5,k,a)+...
                 Layer4_out(m+4,n,a)*W45(5,1,k,a)+Layer4_out(m+4,n+1,a)*W45(5,2,k,a)+Layer4_out(m+4,n+2,a)*W45(5,3,k,a)+Layer4_out(m+4,n+3,a)*W45(5,4,k,a)+Layer4_out(m+4,n+4,a)*W45(5,5,k,a);
        sum5=s_temp+sum5;
        
        
    end
    sum5=sum5+b45(k);
    if(sum5<0)
        sum5=0;
    end
    mult3(1,1,k)=sum5;

end

mult3=int8(mult3);
mult3=bitsrl(mult3,3);
Layer5_out=textread("C:\Users\96348\Desktop\课题相关\FPGA-cnn\CNN_data\5\dat_save\lay5_dat.txt",'%s');
 Layer5_out=hex2dec(Layer5_out);
 Layer5_out=uint8(Layer5_out);
 Layer5_out=reshape(Layer5_out,1,1,120);
 Layer5_out=int8(Layer5_out);
 L5_fpga=textread("D:\matlab_read\L5_out_file.txt",'%s');
  L5_fpga=hex2dec(L5_fpga);
 L5_fpga=uint8(L5_fpga);
 L5_fpga=reshape(L5_fpga,1,1,120);
 L5_fpga=int8(L5_fpga);
diff=L5_fpga-Layer5_out;

 













