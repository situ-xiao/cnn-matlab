%--------------------------------------------------------------------------
%                   
%--------------------------------------------------------------------------
clc;
clear all;
RGB = imread("C:\Users\96348\Downloads\FPGAandCNN-main\FPGAandCNN-main\DigitalRecognition\dataset\test\0\09.png"); %读取图像
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

subplot(1,3,1);imshow(RGB);title('原图');
subplot(1,3,2);imshow(Gr1);title('基于库函数的灰度图');
subplot(1,3,3);imshow(Gr2);title('基于自运算的灰度图');


