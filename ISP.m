clear;
clc;
close all;
%首先获取一个灰度图像并将其展示出来
RGB=imread('C:\Users\96348\Downloads\FPGAandCNN-main\FPGAandCNN-main\DigitalRecognition\dataset\test\0\09.png');
%x=rgb2gray(x);

%RGB = imread("C:\Users\96348\Desktop\06.png"); %读取图像
Gr1 = rgb2gray(RGB);

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
R = (RGB(:,:,1)) ;             %R分量
G = (RGB(:,:,2));             %G分量
B = (RGB(:,:,3));             %B分量
R = uint32(R) ;
G = uint32(G) ;
B = uint32(B) ;

[ROW,COL,N] = size(RGB);    %获得图像尺寸[高度，长度，维度]

for r = 1:ROW
    for c = 1:COL
       Gr2(r,c)  =  (38*R(r,c) + 75*G(r,c) + 15*B(r,c))/128;
    end
end

Gr2 = uint8(Gr2);

subplot(1,5,1);imshow(RGB);title('原图');
subplot(1,5,2);imshow(Gr1);title('基于库函数的灰度图');
subplot(1,5,3);imshow(Gr2);title('基于自运算的灰度图');
%imshow(x);
%figure(2);
%横向，纵向分别每隔2取原图的一个灰度点，则图像的分辨率由240*320降低为32*32
% rsl_down = Gr2(1:7.5:end,1:10:end);   
% %x1=x1.';
% subplot(1,5,4);imshow(rsl_down);title('降采样后的灰度图');
% thresh=graythresh(rsl_down);
% Binarized=im2bw(rsl_down,thresh);
% Binarized=imcomplement(Binarized);
% subplot(1,5,5);imshow(Binarized);title('二值化后的灰度图');
thresh=graythresh(Gr2);
Binarized=im2bw(Gr2,thresh);
Binarized=imcomplement(Binarized);
subplot(1,5,4);imshow(Binarized);title('二值化后的灰度图');
% rsl_down = Binarized(1:7.5:end,1:10:end);   
% subplot(1,5,5);imshow(rsl_down);title('降采样后的二值化图像');
% img=textread("C:\Users\96348\Desktop\课题相关\FPGA-cnn\CNN_data\5\dat_save\imgx_dat.txt",'%s');
% img=hex2dec(img);
% img=img.';
%rsl_down=rsl_down.';

step_size = [7,10];
target_size = [32, 32];
target_img = zeros(target_size);
for i = 1:target_size(1)
    for j = 1:target_size(2)
        x = (i - 1) * step_size(1) + 1;
        y = (j - 1) * step_size(2) + 1;
        target_img(i, j) = Binarized(x, y);
    end
end
target_img(:,1)=0;
subplot(1,5,5);imshow(target_img);title('降采样后的二值化图像');

out=Lenet5(target_img);

%out=reshape(out,120,1);
target_img=int8(target_img)
target_img=target_img.'
%l5=textread("D:\CNN\L5_file.txt",'%s')
%l5=signedhex_2_signeddec(l5);
%diff=out-l5;
fid = fopen ("D:\CNN\testnum.coe",'w');
fprintf( fid, 'memory_initialization_radix=2;\n', target_img);%生成索引
fprintf( fid, 'memory_initialization_vector =\n', target_img );
for i=1:1024%循环打印 
    fprintf(fid,'%d',target_img(i));%一个一个将矩阵里面的数值打印进去
    if(rem(i,32)==0&&i~=1024)
        fprintf(fid,',\n');%打印逗号
    elseif(i==1024)
        fprintf(fid,';');%最后一行的分号
    end
end
fclose(fid);