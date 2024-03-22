clc;
clear all;
close all;

%imgx read
imgx=textread("C:\Users\96348\Desktop\课题相关\FPGA-cnn\CNN_data\5\dat_save\b23_dat.txt",'%s');



fid = fopen ('C:\Users\96348\Desktop\课题相关\FPGA-cnn\CNN_data\5\dat_save\b23.coe','w');
formatSpec = '%s,\n';
fprintf( fid, 'memory_initialization_radix=16;\n' );%生成索引
fprintf( fid, 'memory_initialization_vector =\n' );
[nrows,ncols] = size(imgx);
for row = 1:nrows
    fprintf(fid,formatSpec,imgx{row,:});
end
fprintf(fid,';');
fclose(fid);
