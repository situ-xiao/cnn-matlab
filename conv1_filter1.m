clc;
clear all;
close all;

%imgx read
imgx=textread("C:\Users\96348\Desktop\课题相关\FPGA-cnn\CNN_data\5\dat_save\imgx_dat.txt",'%s');

imgx=hex2dec(imgx);
imgx=uint8(imgx); 
imgx=reshape(imgx,32,32);
imgx=imgx.';
imgx=int8(imgx);
% imgx=imread("D:\mnist\mnist_test\6\54.png"); %读取图像
% rsl_up = imresize(imgx,[32,32]);
% thresh=graythresh(rsl_up);
% Binarized=im2bw(rsl_up,thresh);
% imgx=int8(Binarized)
%imgx=Binarized.'

%w01 read
w01=textread("C:\Users\96348\Desktop\课题相关\FPGA-cnn\CNN_data\5\dat_save\w01_dat.txt",'%s');

w01=signedhex_2_signeddec(w01)
w01=reshape(w01,5,5,6);
w01=permute(w01,[2,1,3])%将权重矩阵转置
w01=int8(w01)
%b01 read
b01=textread("C:\Users\96348\Desktop\课题相关\FPGA-cnn\CNN_data\5\dat_save\b01_dat.txt",'%s');

b01=signedhex_2_signeddec(b01);
b01=double(b01);

%conv1_layer 
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
imgx=double(imgx);
w01=double(w01);
for k=1:6
     for  m=1:28
         for n=1:28
             sum=0;
             sum=imgx(m,n)*w01(1,1,k)+imgx(m,n+1)*w01(1,2,k)+imgx(m,n+2)*w01(1,3,k)+imgx(m,n+3)*w01(1,4,k)+imgx(m,n+4)*w01(1,5,k)+...
                 imgx(m+1,n)*w01(2,1,k)+imgx(m+1,n+1)*w01(2,2,k)+imgx(m+1,n+2)*w01(2,3,k)+imgx(m+1,n+3)*w01(2,4,k)+imgx(m+1,n+4)*w01(2,5,k)+...
                 imgx(m+2,n)*w01(3,1,k)+imgx(m+2,n+1)*w01(3,2,k)+imgx(m+2,n+2)*w01(3,3,k)+imgx(m+2,n+3)*w01(3,4,k)+imgx(m+2,n+4)*w01(3,5,k)+...
                 imgx(m+3,n)*w01(4,1,k)+imgx(m+3,n+1)*w01(4,2,k)+imgx(m+3,n+2)*w01(4,3,k)+imgx(m+3,n+3)*w01(4,4,k)+imgx(m+3,n+4)*w01(4,5,k)+...
                 imgx(m+4,n)*w01(5,1,k)+imgx(m+4,n+1)*w01(5,2,k)+imgx(m+4,n+2)*w01(5,3,k)+imgx(m+4,n+3)*w01(5,4,k)+imgx(m+4,n+4)*w01(5,5,k);
             sum=sum+b01(k);%加上bias
             if(sum<0)%RELU
                    sum=0;
             end
             mult1(m,n,k)=sum/8;
             mult1=int8(mult1);
         end
     end

end

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
 lay_out_01=textread("C:\Users\96348\Desktop\课题相关\FPGA-cnn\CNN_data\5\dat_save\lay1_dat.txt",'%s');
 lay_out_01=hex2dec(lay_out_01);
 lay_out_01=int8(lay_out_01);
 lay_out_01=reshape(lay_out_01,28,28,6)
 lay_out_01=permute(lay_out_01,[2,1,3]);
 lay_out_01=double(lay_out_01);

fid = fopen('C:\Users\96348\Desktop\课题相关\FPGA-cnn\CNN_data\5\dat_save\data.txt', 'wt');
mat = mult1;
for i = 1:size(mat, 1)
    fprintf(fid, '%d\t', mat(i,:));
    fprintf(fid, '\n');
end
fclose(fid);
mult1=double(mult1);
figure;
subplot(4,4,1);
imshow(imgx);%显示原图像
title('原图像');
subplot(4,4,2)
imshow(mult1(:,:,1));%显示一层卷积后的图像
title('matlab卷积核1图像');
subplot(4,4,3)
imshow(mult1(:,:,2));%显示一层卷积后的图像
title('matlab卷积核2图像');
subplot(4,4,4)
imshow(mult1(:,:,3));%显示一层卷积后的图像
title('matlab卷积核3图像');
subplot(4,4,5)
imshow(mult1(:,:,4));%显示一层卷积后的图像
title('matlab卷积核4图像');
subplot(4,4,6)
imshow(mult1(:,:,5));%显示一层卷积后的图像
title('matlab卷积核5图像');
subplot(4,4,7)
imshow(mult1(:,:,6));%显示一层卷积后的图像
title('matlab卷积核6图像');
subplot(4,4,8)
imshow(lay_out_01(:,:,1));%显示参考卷积结果
title('参考卷积核1图像');
subplot(4,4,9)
imshow(lay_out_01(:,:,2));%显示参考卷积结果
title('参考卷积核2图像');
subplot(4,4,10)
imshow(lay_out_01(:,:,3));%显示参考卷积结果
title('参考卷积核3图像');
subplot(4,4,11)
imshow(lay_out_01(:,:,4));%显示参考卷积结果
title('参考卷积核4图像');
subplot(4,4,12)
imshow(lay_out_01(:,:,5));%显示参考卷积结果
title('参考卷积核5图像');
subplot(4,4,13)
imshow(lay_out_01(:,:,6));%显示参考卷积结果
title('参考卷积核6图像');



