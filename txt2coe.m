clc;
clear all;
close all;

%imgx read
imgx=textread("C:\Users\96348\Desktop\�������\FPGA-cnn\CNN_data\9\dat_save\imgx_dat.txt",'%s');

imgx=hex2dec(imgx);
imgx=uint8(imgx); 
%imgx=cell2mat(imgx);
imgx=reshape(imgx,32,32);

%imgx=imgx.';
imgx=int8(imgx);

fid = fopen ('C:\Users\96348\Desktop\�������\FPGA-cnn\CNN_data\9\dat_save\output.coe','w');
fprintf( fid, 'memory_initialization_radix=2;\n', imgx);%��������
fprintf( fid, 'memory_initialization_vector =\n', imgx );
for i=1:1024%ѭ����ӡ 
    fprintf(fid,'%d',imgx(i));%һ��һ���������������ֵ��ӡ��ȥ
    if(rem(i,32)==0&&i~=1024)
        fprintf(fid,',\n');%��ӡ����
    elseif(i==1024)
        fprintf(fid,';');%���һ�еķֺ�
    end
end
fclose(fid);
