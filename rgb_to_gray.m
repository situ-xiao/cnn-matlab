%--------------------------------------------------------------------------
%                   
%--------------------------------------------------------------------------
clc;
clear all;
RGB = imread("C:\Users\96348\Downloads\FPGAandCNN-main\FPGAandCNN-main\DigitalRecognition\dataset\test\0\09.png"); %��ȡͼ��
Gr1 = rgb2gray(RGB);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
R = (RGB(:,:,1)) ;             %R����
G = (RGB(:,:,2));             %G����
B = (RGB(:,:,3));             %B����

R = uint32(R) ;
G = uint32(G) ;
B = uint32(B) ;

[ROW,COL,N] = size(RGB);    %���ͼ��ߴ�[�߶ȣ����ȣ�ά��]

for r = 1:ROW
    for c = 1:COL
       Gr2(r,c)  =  (38*R(r,c) + 75*G(r,c) + 15*B(r,c))/128;
    end
end

Gr2 = uint8(Gr2);

subplot(1,3,1);imshow(RGB);title('ԭͼ');
subplot(1,3,2);imshow(Gr1);title('���ڿ⺯���ĻҶ�ͼ');
subplot(1,3,3);imshow(Gr2);title('����������ĻҶ�ͼ');


