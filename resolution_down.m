clear;
clc;
close all;
%���Ȼ�ȡһ���Ҷ�ͼ�񲢽���չʾ����
x=imread('C:\Users\96348\Downloads\FPGAandCNN-main\FPGAandCNN-main\DigitalRecognition\dataset\test\0\09.png');
x=rgb2gray(x);
figure(1);
%imshow(x);
%figure(2);
%��������ֱ�ÿ��2ȡԭͼ��һ���Ҷȵ㣬��ͼ��ķֱ�����240*320����Ϊ24*32��Ϊԭͼ��1/10
x1 = x(1:7.5:end,1:10:end); 
%x1=x1.';
imshow(x1);

