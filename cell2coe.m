clc;
clear all;
close all;

%imgx read
imgx=textread("C:\Users\96348\Desktop\�������\FPGA-cnn\CNN_data\5\dat_save\w23_dat.txt",'%s');

%imgx=hex2dec(imgx);
%imgx=uint8(imgx); 
%imgx=cell2mat(imgx);
%imgx=imgx.';
imgx=reshape(imgx,5,480);

%5*5*16*6
%���������������룬����˰��������������õ�channel˳�����У����ӵ�һ����channel����������channel��ÿ������channel�ж�Ӧ16��channel
imgx=imgx.';
%imgx=int8(imgx);

fid = fopen ('C:\Users\96348\Desktop\�������\FPGA-cnn\CNN_data\5\dat_save\w23.coe','w');
formatSpec = '%s,\n';
fprintf( fid, 'memory_initialization_radix=16;\n' );%��������
fprintf( fid, 'memory_initialization_vector =\n' );
[nrows,ncols] = size(imgx);
for row = 1:nrows
    fprintf(fid,formatSpec,imgx{row,:});
end
fprintf(fid,';');
fclose(fid);
