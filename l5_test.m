clc;
clear all;
close all;

%imgx read
imgx=textread("C:\Users\96348\Desktop\¿ÎÌâÏà¹Ø\FPGA-cnn\CNN_data\5\dat_save\imgx_dat.txt",'%s');
imgx=hex2dec(imgx);
imgx=uint8(imgx); 
imgx=reshape(imgx,32,32);
imgx=imgx.';
imgx=int8(imgx);
out=Lenet5(imgx);