  clc;
clear all;
close all;
% lay_out_01=zeros(28,28,6);
% lay_out_01=int8(lay_out_01);
% imgx =textread("E:\CNN_FPGA\CNN\L1_F1_file.txt",'%s')
% 
% 
% imgx=signedhex_2_signeddec(imgx);
% imgx=reshape(imgx,28,28);
% %imgx=rot90(imgx,3);
% imgx=imgx.';
% imgx=int8(imgx);
% lay_out_01(:,:,1)=imgx;
% 
% imgx =textread("E:\CNN_FPGA\CNN\L1_F2_file.txt",'%s');
% imgx=signedhex_2_signeddec(imgx);
% imgx=reshape(imgx,28,28);
% %imgx=rot90(imgx,3);
% imgx=imgx.';
% imgx=int8(imgx);
% lay_out_01(:,:,2)=imgx;
% 
% imgx =textread("E:\CNN_FPGA\CNN\L1_F3_file.txt",'%s');
% imgx=signedhex_2_signeddec(imgx);
% imgx=reshape(imgx,28,28);
% %imgx=rot90(imgx,3);
% imgx=imgx.';
% imgx=int8(imgx);
% lay_out_01(:,:,3)=imgx;
% 
% imgx =textread("E:\CNN_FPGA\CNN\L1_F4_file.txt",'%s');
% imgx=signedhex_2_signeddec(imgx);
% imgx=reshape(imgx,28,28);
% %imgx=rot90(imgx,3);
% imgx=imgx.';
% imgx=int8(imgx);
% lay_out_01(:,:,4)=imgx;
% 
% imgx =textread("E:\CNN_FPGA\CNN\L1_F5_file.txt",'%s');
% imgx=signedhex_2_signeddec(imgx);
% imgx=reshape(imgx,28,28);
% %imgx=rot90(imgx,3);
% imgx=imgx.';
% imgx=int8(imgx);
% lay_out_01(:,:,5)=imgx;
% 
% imgx =textread("E:\CNN_FPGA\CNN\L1_F6_file.txt",'%s');
% imgx=signedhex_2_signeddec(imgx);
% imgx=reshape(imgx,28,28);
% %imgx=rot90(imgx,3);
% imgx=imgx.';
% imgx=int8(imgx);
% lay_out_01(:,:,6)=imgx;

lay_out_01=textread("C:\Users\96348\Desktop\�������\FPGA-cnn\CNN_data\5\dat_save\lay1_dat.txt",'%s');
 lay_out_01=hex2dec(lay_out_01);
 lay_out_01=int8(lay_out_01);
 lay_out_01=reshape(lay_out_01,28,28,6)
 lay_out_01=permute(lay_out_01,[2,1,3]);
 lay_out_01=int8(lay_out_01);
 i=0;
 j=0;
 
 lay_out_01=double(lay_out_01);
 for k=1:6
     i=1;
     for m=1:2:27
         
         j=1;
         for n=1:2:27
             
             sum=0;
             sum=max([lay_out_01(m,n,k) lay_out_01(m+1,n,k) lay_out_01(m,n+1,k) lay_out_01(m+1,n+1,k)  ]);
             pooling(i,j,k)=sum;
             pooling=int8(pooling);
             j=j+1;
         end
         i=i+1;
     end
     
     
     
 end
 
 figure;
 pooling=double(pooling);
subplot(3,3,1)
imshow(lay_out_01(:,:,1));%��ʾһ�������ͼ��
title('�����1ͼ��');
subplot(3,3,2)
imshow(lay_out_01(:,:,2));%��ʾһ�������ͼ��
title('�����2ͼ��');
subplot(3,3,3)
imshow(lay_out_01(:,:,3));%��ʾһ�������ͼ��
title('�����3ͼ��');
subplot(3,3,4)
imshow(lay_out_01(:,:,4));%��ʾһ�������ͼ��
title('�����4ͼ��');
subplot(3,3,5)
imshow(lay_out_01(:,:,5));%��ʾһ�������ͼ��
title('�����5ͼ��');
subplot(3,3,6)
imshow(lay_out_01(:,:,6));%��ʾһ�������ͼ��
title('�����6ͼ��');
figure;
subplot(3,3,1)
imshow(pooling(:,:,1));%��ʾ�ο�������
title('pooling1ͼ��');
subplot(3,3,2)
imshow(pooling(:,:,2));%��ʾ�ο�������
title('pooling2ͼ��');
subplot(3,3,3)
imshow(pooling(:,:,3));%��ʾ�ο�������
title('pooling3ͼ��');
subplot(3,3,4)
imshow(pooling(:,:,4));%��ʾ�ο�������
title('pooling4ͼ��');
subplot(3,3,5)
imshow(pooling(:,:,5));%��ʾ�ο�������
title('pooling5ͼ��');
subplot(3,3,6)
imshow(pooling(:,:,6));%��ʾ�ο�������
title('pooling6ͼ��');

imgy=textread("C:\Users\96348\Desktop\�������\FPGA-cnn\CNN_data\5\dat_save\lay2_dat.txt",'%s');

imgy=hex2dec(imgy);
imgy=uint8(imgy); 
imgy=reshape(imgy,14,14,6);
imgy=permute(imgy,[2,1,3]);
imgy=double(imgy);
figure;
subplot(3,3,1)
imshow(imgy(:,:,1));%��ʾ�ο�������
title('�ο�pooling1ͼ��');
subplot(3,3,2)
imshow(imgy(:,:,2));%��ʾ�ο�������
title('�ο�pooling2ͼ��');
subplot(3,3,3)
imshow(imgy(:,:,3));%��ʾ�ο�������
title('�ο�pooling3ͼ��');
subplot(3,3,4)
imshow(imgy(:,:,4));%��ʾ�ο�������
title('�ο�pooling4ͼ��');
subplot(3,3,5)
imshow(imgy(:,:,5));%��ʾ�ο�������
title('�ο�pooling5ͼ��');
subplot(3,3,6)
imshow(imgy(:,:,6));%��ʾ�ο�������
title('�ο�pooling6ͼ��');
 
 

