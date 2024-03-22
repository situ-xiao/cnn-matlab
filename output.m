clc;
clear all;
close all;

outx=textread("C:\Users\96348\Desktop\课题相关\FPGA-cnn\CNN_data\5\dat_save\lay5_dat.txt",'%s');
 outx=hex2dec(outx);
 outx=uint8(outx);
 outx=reshape(outx,1,1,120);
 outx=permute(outx,[2,1,3]);%将权重矩阵转置
 outx=double(outx);
 
 
 %w56 read  %%120行，10列，源文件按行分隔
W56=textread("C:\Users\96348\Desktop\课题相关\FPGA-cnn\CNN_data\5\dat_save\w56_dat.txt",'%s');
W56=signedhex_2_signeddec(W56);
W56=reshape(W56,10,120);
W56=permute(W56,[2,1]);%将权重矩阵转置
W56=double(W56);

%b56 read
b56=textread("C:\Users\96348\Desktop\课题相关\FPGA-cnn\CNN_data\5\dat_save\b56_dat.txt",'%s');
b56=signedhex_2_signeddec(b56);
b56=double(b56);


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%output%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
for k=1:10
    out=0;
    for m=1:120
        
        out=out+outx(1,1,m)*W56(m,k);
    
    end
    out=(out+b56(k));
    if(out<0)
        out=0;
    end
     lenet5_output(k)=out;

end
lenet5_output=reshape(lenet5_output,10,1);
lenet5_output=double(lenet5_output);

out=textread("C:\Users\96348\Desktop\课题相关\FPGA-cnn\CNN_data\5\dat_save\outx_dat.txt",'%s');
 out=hex2dec(out);
 out=double(out);