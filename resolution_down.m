clear;
clc;
close all;
%首先获取一个灰度图像并将其展示出来
x=imread('C:\Users\96348\Downloads\FPGAandCNN-main\FPGAandCNN-main\DigitalRecognition\dataset\test\0\09.png');
x=rgb2gray(x);
figure(1);
%imshow(x);
%figure(2);
%横向，纵向分别每隔2取原图的一个灰度点，则图像的分辨率由240*320降低为24*32，为原图的1/10
x1 = x(1:7.5:end,1:10:end); 
%x1=x1.';
imshow(x1);

