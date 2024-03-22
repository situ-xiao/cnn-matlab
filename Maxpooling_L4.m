clc;
clear all;
close all;


lay_out_03=textread("C:\Users\96348\Desktop\�������\FPGA-cnn\CNN_data\5\dat_save\lay3_dat.txt",'%s');
 lay_out_03=hex2dec(lay_out_03);
 lay_out_03=int8(lay_out_03);
 lay_out_03=reshape(lay_out_03,10,10,16)
 lay_out_03=permute(lay_out_03,[2,1,3]);
 lay_out_03=int8(lay_out_03);
 
 i=0;
 j=0;
 
 lay_out_03=double(lay_out_03);
 for k=1:16
     i=1;
     for m=1:2:9
         
         j=1;
         for n=1:2:9
             
             sum=0;
             sum=max([lay_out_03(m,n,k) lay_out_03(m+1,n,k) lay_out_03(m,n+1,k) lay_out_03(m+1,n+1,k)  ]);
             pooling(i,j,k)=sum;
             pooling=int8(pooling);
             j=j+1;
         end
         i=i+1;
     end
     
     
     
 end
 
 pooling=double(pooling);
figure;
subplot(4,4,1)
imshow(pooling(:,:,1));%��ʾ�ο�������
title('pooling1ͼ��');
subplot(4,4,2)
imshow(pooling(:,:,2));%��ʾ�ο�������
title('pooling2ͼ��');
subplot(4,4,3)
imshow(pooling(:,:,3));%��ʾ�ο�������
title('pooling3ͼ��');
subplot(4,4,4)
imshow(pooling(:,:,4));%��ʾ�ο�������
title('pooling4ͼ��');
subplot(4,4,5)
imshow(pooling(:,:,5));%��ʾ�ο�������
title('pooling5ͼ��');
subplot(4,4,6)
imshow(pooling(:,:,6));%��ʾ�ο�������
title('pooling6ͼ��');
subplot(4,4,7)
imshow(pooling(:,:,7));%��ʾ�ο�������
title('pooling7ͼ��');
subplot(4,4,8)
imshow(pooling(:,:,8));%��ʾ�ο�������
title('pooling8ͼ��');
subplot(4,4,9)
imshow(pooling(:,:,9));%��ʾ�ο�������
title('pooling9ͼ��');
subplot(4,4,10)
imshow(pooling(:,:,10));%��ʾ�ο�������
title('pooling10ͼ��');
subplot(4,4,11)
imshow(pooling(:,:,11));%��ʾ�ο�������
title('pooling11ͼ��');
subplot(4,4,12)
imshow(pooling(:,:,12));%��ʾ�ο�������
title('pooling12ͼ��');
subplot(4,4,13)
imshow(pooling(:,:,13));%��ʾ�ο�������
title('pooling13ͼ��');
subplot(4,4,14)
imshow(pooling(:,:,14));%��ʾ�ο�������
title('pooling14ͼ��');
subplot(4,4,15)
imshow(pooling(:,:,15));%��ʾ�ο�������
title('pooling15ͼ��');
subplot(4,4,16)
imshow(pooling(:,:,16));%��ʾ�ο�������
title('pooling16ͼ��');


imgy=textread("C:\Users\96348\Desktop\�������\FPGA-cnn\CNN_data\5\dat_save\lay4_dat.txt",'%s');

imgy=hex2dec(imgy);
imgy=uint8(imgy); 
imgy=reshape(imgy,5,5,16);
imgy=permute(imgy,[2,1,3]);
imgy=double(imgy);
figure;
subplot(4,4,1)
imshow(imgy(:,:,1));%��ʾ�ο�������
title('�ο�pooling1ͼ��');
subplot(4,4,2)
imshow(imgy(:,:,2));%��ʾ�ο�������
title('�ο�pooling2ͼ��');
subplot(4,4,3)
imshow(imgy(:,:,3));%��ʾ�ο�������
title('�ο�pooling3ͼ��');
subplot(4,4,4)
imshow(imgy(:,:,4));%��ʾ�ο�������
title('�ο�pooling4ͼ��');
subplot(4,4,5)
imshow(imgy(:,:,5));%��ʾ�ο�������
title('�ο�pooling5ͼ��');
subplot(4,4,6)
imshow(imgy(:,:,6));%��ʾ�ο�������
title('�ο�pooling6ͼ��');
subplot(4,4,7)
imshow(imgy(:,:,7));%��ʾ�ο�������
title('�ο�pooling7ͼ��');
subplot(4,4,8)
imshow(imgy(:,:,8));%��ʾ�ο�������
title('�ο�pooling8ͼ��');
subplot(4,4,9)
imshow(imgy(:,:,9));%��ʾ�ο�������
title('�ο�pooling9ͼ��');
subplot(4,4,10)
imshow(imgy(:,:,10));%��ʾ�ο�������
title('�ο�pooling10ͼ��');
subplot(4,4,11)
imshow(imgy(:,:,11));%��ʾ�ο�������
title('�ο�pooling11ͼ��');
subplot(4,4,12)
imshow(imgy(:,:,12));%��ʾ�ο�������
title('�ο�pooling12ͼ��');
subplot(4,4,13)
imshow(imgy(:,:,13));%��ʾ�ο�������
title('�ο�pooling13ͼ��');
subplot(4,4,14)
imshow(imgy(:,:,14));%��ʾ�ο�������
title('�ο�pooling14ͼ��');
subplot(4,4,15)
imshow(imgy(:,:,15));%��ʾ�ο�������
title('�ο�pooling15ͼ��');
subplot(4,4,16)
imshow(imgy(:,:,16));%��ʾ�ο�������
title('�ο�pooling16ͼ��');
