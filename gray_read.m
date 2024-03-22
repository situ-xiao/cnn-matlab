clc;
clear all;
close all;

imgx =textread("D:\ISP_new\gray.txt",'%s')
imgx=signedhex_2_signeddec(imgx);
imgx=reshape(imgx,240,320);
imgx=imgx.';
imgx=int8(imgx);

imshow(imgx);