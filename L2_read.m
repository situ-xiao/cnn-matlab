clc;
clear all;
close all;

mult1=zeros(14,14,6);
mult1=int8(mult1);
imgx =textread("D:\matlab_read\L2_F1_file.txt",'%s')


imgx=signedhex_2_signeddec(imgx);
imgx=reshape(imgx,14,14);
%imgx=rot90(imgx,3);
imgx=imgx.';
imgx=int8(imgx);
mult1(:,:,1)=imgx;

imgx =textread("D:\matlab_read\L2_F2_file.txt",'%s');
imgx=signedhex_2_signeddec(imgx);
imgx=reshape(imgx,14,14);
%imgx=rot90(imgx,3);
imgx=imgx.';
imgx=int8(imgx);
mult1(:,:,2)=imgx;

imgx =textread("D:\matlab_read\L2_F3_file.txt",'%s');
imgx=signedhex_2_signeddec(imgx);
imgx=reshape(imgx,14,14);
%imgx=rot90(imgx,3);
imgx=imgx.';
imgx=int8(imgx);
mult1(:,:,3)=imgx;

imgx =textread("D:\matlab_read\L2_F4_file.txt",'%s');
imgx=signedhex_2_signeddec(imgx);
imgx=reshape(imgx,14,14);
%imgx=rot90(imgx,3);
imgx=imgx.';
imgx=int8(imgx);
mult1(:,:,4)=imgx;

imgx =textread("D:\matlab_read\L2_F5_file.txt",'%s');
imgx=signedhex_2_signeddec(imgx);
imgx=reshape(imgx,14,14);
%imgx=rot90(imgx,3);
imgx=imgx.';
imgx=int8(imgx);
mult1(:,:,5)=imgx;

imgx =textread("D:\matlab_read\L2_F6_file.txt",'%s');
imgx=signedhex_2_signeddec(imgx);
imgx=reshape(imgx,14,14);
%imgx=rot90(imgx,3);
imgx=imgx.';
imgx=int8(imgx);
mult1(:,:,6)=imgx;

mult1=double(mult1);

figure(1)
subplot(3,3,1);
imshow(mult1(:,:,1));
title('verilog��1���ػ����1');
subplot(3,3,2);
imshow(mult1(:,:,2));
title('verilog��1���ػ����2');
subplot(3,3,3);
imshow(mult1(:,:,3));
title('verilog��1���ػ����3');
subplot(3,3,4);
imshow(mult1(:,:,4));
title('verilog��1���ػ����4');
subplot(3,3,5);
imshow(mult1(:,:,5));
title('verilog��1���ػ����5');
subplot(3,3,6);
imshow(mult1(:,:,6));
title('verilog��1���ػ����6');
lay_out_01=textread("C:\Users\96348\Desktop\�������\FPGA-cnn\CNN_data\5\dat_save\lay2_dat.txt",'%s');
 lay_out_01=hex2dec(lay_out_01);
 lay_out_01=int8(lay_out_01);
 lay_out_01=reshape(lay_out_01,14,14,6)
 lay_out_01=permute(lay_out_01,[2,1,3]);
 lay_out_01=double(lay_out_01);
 diff=lay_out_01-mult1;
 figure(2)
 subplot(3,3,1)
imshow(lay_out_01(:,:,1));%��ʾ�ο�������
title('�ο������1ͼ��');
subplot(3,3,2)
imshow(lay_out_01(:,:,2));%��ʾ�ο�������
title('�ο������2ͼ��');
subplot(3,3,3)
imshow(lay_out_01(:,:,3));%��ʾ�ο�������
title('�ο������3ͼ��');
subplot(3,3,4)
imshow(lay_out_01(:,:,4));%��ʾ�ο�������
title('�ο������4ͼ��');
subplot(3,3,5)
imshow(lay_out_01(:,:,5));%��ʾ�ο�������
title('�ο������5ͼ��');
subplot(3,3,6)
imshow(lay_out_01(:,:,6));%��ʾ�ο�������
title('�ο������6ͼ��');
