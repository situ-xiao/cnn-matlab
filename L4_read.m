clc;
clear all;
close all;

mult1=zeros(5,5,16);
mult1=int8(mult1);
imgx =textread("D:\matlab_read\L4_F1_file.txt",'%s')


imgx=signedhex_2_signeddec(imgx);
imgx=reshape(imgx,5,5);
%imgx=rot90(imgx,3);
imgx=imgx.';%文件是按行存储，读出是把每行按列排列，因此要转置。
imgx=int8(imgx);
mult1(:,:,1)=imgx;

imgx =textread("D:\matlab_read\L4_F2_file.txt",'%s');
imgx=signedhex_2_signeddec(imgx);
imgx=reshape(imgx,5,5);
%imgx=rot90(imgx,3);
imgx=imgx.';
imgx=int8(imgx);
mult1(:,:,2)=imgx;

imgx =textread("D:\matlab_read\L4_F3_file.txt",'%s');
imgx=signedhex_2_signeddec(imgx);
imgx=reshape(imgx,5,5);
%imgx=rot90(imgx,3);
imgx=imgx.';
imgx=int8(imgx);
mult1(:,:,3)=imgx;

imgx =textread("D:\matlab_read\L4_F4_file.txt",'%s');
imgx=signedhex_2_signeddec(imgx);
imgx=reshape(imgx,5,5);
%imgx=rot90(imgx,3);
imgx=imgx.';
imgx=int8(imgx);
mult1(:,:,4)=imgx;

imgx =textread("D:\matlab_read\L4_F5_file.txt",'%s');
imgx=signedhex_2_signeddec(imgx);
imgx=reshape(imgx,5,5);
%imgx=rot90(imgx,3);
imgx=imgx.';
imgx=int8(imgx);
mult1(:,:,5)=imgx;

imgx =textread("D:\matlab_read\L4_F6_file.txt",'%s');
imgx=signedhex_2_signeddec(imgx);
imgx=reshape(imgx,5,5);
%imgx=rot90(imgx,3);
imgx=imgx.';
imgx=int8(imgx);
mult1(:,:,6)=imgx;

imgx =textread("D:\matlab_read\L4_F7_file.txt",'%s');
imgx=signedhex_2_signeddec(imgx);
imgx=reshape(imgx,5,5);
%imgx=rot90(imgx,3);
imgx=imgx.';
imgx=int8(imgx);
mult1(:,:,7)=imgx;

imgx =textread("D:\matlab_read\L4_F8_file.txt",'%s');
imgx=signedhex_2_signeddec(imgx);
imgx=reshape(imgx,5,5);
%imgx=rot90(imgx,3);
imgx=imgx.';
imgx=int8(imgx);
mult1(:,:,8)=imgx;
imgx =textread("D:\matlab_read\L4_F9_file.txt",'%s');
imgx=signedhex_2_signeddec(imgx);
imgx=reshape(imgx,5,5);
%imgx=rot90(imgx,3);
imgx=imgx.';
imgx=int8(imgx);
mult1(:,:,9)=imgx;
imgx =textread("D:\matlab_read\L4_F10_file.txt",'%s');
imgx=signedhex_2_signeddec(imgx);
imgx=reshape(imgx,5,5);
%imgx=rot90(imgx,3);
imgx=imgx.';
imgx=int8(imgx);
mult1(:,:,10)=imgx;
imgx =textread("D:\matlab_read\L4_F11_file.txt",'%s');
imgx=signedhex_2_signeddec(imgx);
imgx=reshape(imgx,5,5);
%imgx=rot90(imgx,3);
imgx=imgx.';
imgx=int8(imgx);
mult1(:,:,11)=imgx;
imgx =textread("D:\matlab_read\L4_F12_file.txt",'%s');
imgx=signedhex_2_signeddec(imgx);
imgx=reshape(imgx,5,5);
%imgx=rot90(imgx,3);
imgx=imgx.';
imgx=int8(imgx);
mult1(:,:,12)=imgx;
imgx =textread("D:\matlab_read\L4_F13_file.txt",'%s');
imgx=signedhex_2_signeddec(imgx);
imgx=reshape(imgx,5,5);
%imgx=rot90(imgx,3);
imgx=imgx.';
imgx=int8(imgx);
mult1(:,:,13)=imgx;
imgx =textread("D:\matlab_read\L4_F14_file.txt",'%s');
imgx=signedhex_2_signeddec(imgx);
imgx=reshape(imgx,5,5);
%imgx=rot90(imgx,3);
imgx=imgx.';
imgx=int8(imgx);
mult1(:,:,14)=imgx;
imgx =textread("D:\matlab_read\L4_F15_file.txt",'%s');
imgx=signedhex_2_signeddec(imgx);
imgx=reshape(imgx,5,5);
%imgx=rot90(imgx,3);
imgx=imgx.';
imgx=int8(imgx);
mult1(:,:,15)=imgx;
imgx =textread("D:\matlab_read\L4_F16_file.txt",'%s');
imgx=signedhex_2_signeddec(imgx);
imgx=reshape(imgx,5,5);
%imgx=rot90(imgx,3);
imgx=imgx.';
imgx=int8(imgx);
mult1(:,:,16)=imgx;
mult1=double(mult1);


subplot(4,4,1);
imshow(mult1(:,:,1));
title('verilog第二次池化结果1');
subplot(4,4,2);
imshow(mult1(:,:,2));
title('verilog第二次池化结果2');
subplot(4,4,3);
imshow(mult1(:,:,3));
title('verilog第二次池化结果3');
subplot(4,4,4);
imshow(mult1(:,:,4));
title('verilog第二次池化结果4');
subplot(4,4,5);
imshow(mult1(:,:,5));
title('verilog第二次池化结果5');
subplot(4,4,6);
imshow(mult1(:,:,6));
title('verilog第二次池化结果6');

subplot(4,4,7);
imshow(mult1(:,:,7));
title('verilog第二次池化结果7');
subplot(4,4,8);
imshow(mult1(:,:,8));
title('verilog第二次池化结果8');
subplot(4,4,9);
imshow(mult1(:,:,9));
title('verilog第二次池化结果9');
subplot(4,4,10);
imshow(mult1(:,:,10));
title('verilog第二次池化结果10');
subplot(4,4,11);
imshow(mult1(:,:,11));
title('verilog第二次池化结果11');
subplot(4,4,12);
imshow(mult1(:,:,12));
title('verilog第二次池化结果12');
subplot(4,4,13);
imshow(mult1(:,:,13));
title('verilog第二次池化结果13');
subplot(4,4,14);
imshow(mult1(:,:,14));
title('verilog第二次池化结果14');
subplot(4,4,15);
imshow(mult1(:,:,15));
title('verilog第二次池化结果15');
subplot(4,4,16);
imshow(mult1(:,:,16));
title('verilog第二次池化结果16');

lay_out_04=textread("C:\Users\96348\Desktop\课题相关\FPGA-cnn\CNN_data\5\dat_save\lay4_dat.txt",'%s');
 lay_out_04=hex2dec(lay_out_04);
 lay_out_04=int8(lay_out_04);
 lay_out_04=reshape(lay_out_04,5,5,16)
 lay_out_04=permute(lay_out_04,[2,1,3]);
 lay_out_04=double(lay_out_04);
 
 diff=mult1-lay_out_04;