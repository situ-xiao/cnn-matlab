clc;
clear all;
close all;


lay_out_03=textread("C:\Users\96348\Desktop\课题相关\FPGA-cnn\CNN_data\5\dat_save\lay3_dat.txt",'%s');
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
imshow(pooling(:,:,1));%显示参考卷积结果
title('pooling1图像');
subplot(4,4,2)
imshow(pooling(:,:,2));%显示参考卷积结果
title('pooling2图像');
subplot(4,4,3)
imshow(pooling(:,:,3));%显示参考卷积结果
title('pooling3图像');
subplot(4,4,4)
imshow(pooling(:,:,4));%显示参考卷积结果
title('pooling4图像');
subplot(4,4,5)
imshow(pooling(:,:,5));%显示参考卷积结果
title('pooling5图像');
subplot(4,4,6)
imshow(pooling(:,:,6));%显示参考卷积结果
title('pooling6图像');
subplot(4,4,7)
imshow(pooling(:,:,7));%显示参考卷积结果
title('pooling7图像');
subplot(4,4,8)
imshow(pooling(:,:,8));%显示参考卷积结果
title('pooling8图像');
subplot(4,4,9)
imshow(pooling(:,:,9));%显示参考卷积结果
title('pooling9图像');
subplot(4,4,10)
imshow(pooling(:,:,10));%显示参考卷积结果
title('pooling10图像');
subplot(4,4,11)
imshow(pooling(:,:,11));%显示参考卷积结果
title('pooling11图像');
subplot(4,4,12)
imshow(pooling(:,:,12));%显示参考卷积结果
title('pooling12图像');
subplot(4,4,13)
imshow(pooling(:,:,13));%显示参考卷积结果
title('pooling13图像');
subplot(4,4,14)
imshow(pooling(:,:,14));%显示参考卷积结果
title('pooling14图像');
subplot(4,4,15)
imshow(pooling(:,:,15));%显示参考卷积结果
title('pooling15图像');
subplot(4,4,16)
imshow(pooling(:,:,16));%显示参考卷积结果
title('pooling16图像');


imgy=textread("C:\Users\96348\Desktop\课题相关\FPGA-cnn\CNN_data\5\dat_save\lay4_dat.txt",'%s');

imgy=hex2dec(imgy);
imgy=uint8(imgy); 
imgy=reshape(imgy,5,5,16);
imgy=permute(imgy,[2,1,3]);
imgy=double(imgy);
figure;
subplot(4,4,1)
imshow(imgy(:,:,1));%显示参考卷积结果
title('参考pooling1图像');
subplot(4,4,2)
imshow(imgy(:,:,2));%显示参考卷积结果
title('参考pooling2图像');
subplot(4,4,3)
imshow(imgy(:,:,3));%显示参考卷积结果
title('参考pooling3图像');
subplot(4,4,4)
imshow(imgy(:,:,4));%显示参考卷积结果
title('参考pooling4图像');
subplot(4,4,5)
imshow(imgy(:,:,5));%显示参考卷积结果
title('参考pooling5图像');
subplot(4,4,6)
imshow(imgy(:,:,6));%显示参考卷积结果
title('参考pooling6图像');
subplot(4,4,7)
imshow(imgy(:,:,7));%显示参考卷积结果
title('参考pooling7图像');
subplot(4,4,8)
imshow(imgy(:,:,8));%显示参考卷积结果
title('参考pooling8图像');
subplot(4,4,9)
imshow(imgy(:,:,9));%显示参考卷积结果
title('参考pooling9图像');
subplot(4,4,10)
imshow(imgy(:,:,10));%显示参考卷积结果
title('参考pooling10图像');
subplot(4,4,11)
imshow(imgy(:,:,11));%显示参考卷积结果
title('参考pooling11图像');
subplot(4,4,12)
imshow(imgy(:,:,12));%显示参考卷积结果
title('参考pooling12图像');
subplot(4,4,13)
imshow(imgy(:,:,13));%显示参考卷积结果
title('参考pooling13图像');
subplot(4,4,14)
imshow(imgy(:,:,14));%显示参考卷积结果
title('参考pooling14图像');
subplot(4,4,15)
imshow(imgy(:,:,15));%显示参考卷积结果
title('参考pooling15图像');
subplot(4,4,16)
imshow(imgy(:,:,16));%显示参考卷积结果
title('参考pooling16图像');
