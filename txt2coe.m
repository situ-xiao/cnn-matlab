clc;
clear all;
close all;

%imgx read
imgx=textread("C:\Users\96348\Desktop\课题相关\FPGA-cnn\CNN_data\9\dat_save\imgx_dat.txt",'%s');

imgx=hex2dec(imgx);
imgx=uint8(imgx); 
%imgx=cell2mat(imgx);
imgx=reshape(imgx,32,32);

%imgx=imgx.';
imgx=int8(imgx);

fid = fopen ('C:\Users\96348\Desktop\课题相关\FPGA-cnn\CNN_data\9\dat_save\output.coe','w');
fprintf( fid, 'memory_initialization_radix=2;\n', imgx);%生成索引
fprintf( fid, 'memory_initialization_vector =\n', imgx );
for i=1:1024%循环打印 
    fprintf(fid,'%d',imgx(i));%一个一个将矩阵里面的数值打印进去
    if(rem(i,32)==0&&i~=1024)
        fprintf(fid,',\n');%打印逗号
    elseif(i==1024)
        fprintf(fid,';');%最后一行的分号
    end
end
fclose(fid);
