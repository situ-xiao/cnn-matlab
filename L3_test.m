clc;
clear all;
close all;

mult1=zeros(14,14,6);
mult1=int8(mult1);
imgx =textread("E:\CNN_FPGA\CNN\L2_F1_file.txt",'%s')


imgx=signedhex_2_signeddec(imgx);
imgx=reshape(imgx,14,14);
imgx=rot90(imgx,3);
imgx=int8(imgx);
mult1(:,:,1)=imgx;

imgx =textread("E:\CNN_FPGA\CNN\L2_F2_file.txt",'%s');
imgx=signedhex_2_signeddec(imgx);
imgx=reshape(imgx,14,14);
imgx=rot90(imgx,3);
imgx=int8(imgx);
mult1(:,:,2)=imgx;

imgx =textread("E:\CNN_FPGA\CNN\L2_F3_file.txt",'%s');
imgx=signedhex_2_signeddec(imgx);
imgx=reshape(imgx,14,14);
imgx=rot90(imgx,3);
imgx=int8(imgx);
mult1(:,:,3)=imgx;

imgx =textread("E:\CNN_FPGA\CNN\L2_F4_file.txt",'%s');
imgx=signedhex_2_signeddec(imgx);
imgx=reshape(imgx,14,14);
imgx=rot90(imgx,3);
imgx=int8(imgx);
mult1(:,:,4)=imgx;

imgx =textread("E:\CNN_FPGA\CNN\L2_F5_file.txt",'%s');
imgx=signedhex_2_signeddec(imgx);
imgx=reshape(imgx,14,14);
imgx=rot90(imgx,3);
imgx=int8(imgx);
mult1(:,:,5)=imgx;

imgx =textread("E:\CNN_FPGA\CNN\L2_F6_file.txt",'%s');
imgx=signedhex_2_signeddec(imgx);
imgx=reshape(imgx,14,14);
imgx=rot90(imgx,3);
imgx=int8(imgx);
mult1(:,:,6)=imgx;

mult1=int8(mult1);


%b02 read
b02=textread("C:\Users\96348\Desktop\课题相关\FPGA-cnn\CNN_data\5\dat_save\b23_dat.txt",'%s');

b02=signedhex_2_signeddec(b02);
b02=int8(b02);


W02=textread("C:\Users\96348\Desktop\课题相关\FPGA-cnn\CNN_data\5\dat_save\w23_dat.txt",'%s');
W02=signedhex_2_signeddec(W02);
W02=reshape(W02,5,5,16,6);
W02=permute(W02,[2,1,3,4]);%将权重矩阵转置
W02=int8(W02);
% m=1;
% n=6,
% k=1;
% a=1;
% ans=mult1(m,n,a)*W02(1,1,k,a)+mult1(m,n+1,a)*W02(1,2,k,a)+mult1(m,n+2,a)*W02(1,3,k,a)+mult1(m,n+3,a)*W02(1,4,k,a)+mult1(m,n+4,a)*W02(1,5,k,a)+...
%                  mult1(m+1,n,a)*W02(2,1,k,a)+mult1(m+1,n+1,a)*W02(2,2,k,a)+mult1(m+1,n+2,a)*W02(2,3,k,a)+mult1(m+1,n+3,a)*W02(2,4,k,a)+mult1(m+1,n+4,a)*W02(2,5,k,a)+...
%                  mult1(m+2,n,a)*W02(3,1,k,a)+mult1(m+2,n+1,a)*W02(3,2,k,a)+mult1(m+2,n+2,a)*W02(3,3,k,a)+mult1(m+2,n+3,a)*W02(3,4,k,a)+mult1(m+2,n+4,a)*W02(3,5,k,a)+...
%                  mult1(m+3,n,a)*W02(4,1,k,a)+mult1(m+3,n+1,a)*W02(4,2,k,a)+mult1(m+3,n+2,a)*W02(4,3,k,a)+mult1(m+3,n+3,a)*W02(4,4,k,a)+mult1(m+3,n+4,a)*W02(4,5,k,a)+...
%                  mult1(m+4,n,a)*W02(5,1,k,a)+mult1(m+4,n+1,a)*W02(5,2,k,a)+mult1(m+4,n+2,a)*W02(5,3,k,a)+mult1(m+4,n+3,a)*W02(5,4,k,a)+mult1(m+4,n+4,a)*W02(5,5,k,a);
W02=double(W02);
mult1=double(mult1);
b02=double(b02);
for k=1:16
    for m=1:10
        for n=1:10
            sum3=0;
            for a=1:6
                %对于第二次卷积而言，每个输入通道所对应的6个卷积核都需要和输入图像进行卷积，卷积完以后进行相加，6个feature想加完再加上bias和RELU，因此计算顺序应该以输出channel做并行。
                sum3=sum3+...
                 mult1(m,n,a)*W02(1,1,k,a)+mult1(m,n+1,a)*W02(1,2,k,a)+mult1(m,n+2,a)*W02(1,3,k,a)+mult1(m,n+3,a)*W02(1,4,k,a)+mult1(m,n+4,a)*W02(1,5,k,a)+...
                 mult1(m+1,n,a)*W02(2,1,k,a)+mult1(m+1,n+1,a)*W02(2,2,k,a)+mult1(m+1,n+2,a)*W02(2,3,k,a)+mult1(m+1,n+3,a)*W02(2,4,k,a)+mult1(m+1,n+4,a)*W02(2,5,k,a)+...
                 mult1(m+2,n,a)*W02(3,1,k,a)+mult1(m+2,n+1,a)*W02(3,2,k,a)+mult1(m+2,n+2,a)*W02(3,3,k,a)+mult1(m+2,n+3,a)*W02(3,4,k,a)+mult1(m+2,n+4,a)*W02(3,5,k,a)+...
                 mult1(m+3,n,a)*W02(4,1,k,a)+mult1(m+3,n+1,a)*W02(4,2,k,a)+mult1(m+3,n+2,a)*W02(4,3,k,a)+mult1(m+3,n+3,a)*W02(4,4,k,a)+mult1(m+3,n+4,a)*W02(4,5,k,a)+...
                 mult1(m+4,n,a)*W02(5,1,k,a)+mult1(m+4,n+1,a)*W02(5,2,k,a)+mult1(m+4,n+2,a)*W02(5,3,k,a)+mult1(m+4,n+3,a)*W02(5,4,k,a)+mult1(m+4,n+4,a)*W02(5,5,k,a);
             
                x(m,n,a,k)=mult1(m,n,a)*W02(1,1,k,a)+mult1(m,n+1,a)*W02(1,2,k,a)+mult1(m,n+2,a)*W02(1,3,k,a)+mult1(m,n+3,a)*W02(1,4,k,a)+mult1(m,n+4,a)*W02(1,5,k,a)+...
                 mult1(m+1,n,a)*W02(2,1,k,a)+mult1(m+1,n+1,a)*W02(2,2,k,a)+mult1(m+1,n+2,a)*W02(2,3,k,a)+mult1(m+1,n+3,a)*W02(2,4,k,a)+mult1(m+1,n+4,a)*W02(2,5,k,a)+...
                 mult1(m+2,n,a)*W02(3,1,k,a)+mult1(m+2,n+1,a)*W02(3,2,k,a)+mult1(m+2,n+2,a)*W02(3,3,k,a)+mult1(m+2,n+3,a)*W02(3,4,k,a)+mult1(m+2,n+4,a)*W02(3,5,k,a)+...
                 mult1(m+3,n,a)*W02(4,1,k,a)+mult1(m+3,n+1,a)*W02(4,2,k,a)+mult1(m+3,n+2,a)*W02(4,3,k,a)+mult1(m+3,n+3,a)*W02(4,4,k,a)+mult1(m+3,n+4,a)*W02(4,5,k,a)+...
                 mult1(m+4,n,a)*W02(5,1,k,a)+mult1(m+4,n+1,a)*W02(5,2,k,a)+mult1(m+4,n+2,a)*W02(5,3,k,a)+mult1(m+4,n+3,a)*W02(5,4,k,a)+mult1(m+4,n+4,a)*W02(5,5,k,a);
            end
            sum3=(sum3 + b02(k));
            if(sum3<0)
               sum3=0; 
            end
            mult2(m,n,k)=sum3/8;
            mult2=int8(mult2);
        end
    end
    end

    mult2=double(mult2);
   
figure;
subplot(4,4,1);
imshow(mult2(:,:,1));%显示一层卷积后的图像
title('matlab卷积核1图像');
subplot(4,4,2)
imshow(mult2(:,:,2));%显示一层卷积后的图像
title('matlab卷积核2图像');
subplot(4,4,3)
imshow(mult2(:,:,3));%显示一层卷积后的图像
title('matlab卷积核3图像');
subplot(4,4,4)
imshow(mult2(:,:,4));%显示一层卷积后的图像
title('matlab卷积核4图像');
subplot(4,4,5)
imshow(mult2(:,:,5));%显示一层卷积后的图像
title('matlab卷积核5图像');
subplot(4,4,6)
imshow(mult2(:,:,6));%显示一层卷积后的图像
title('matlab卷积核6图像');
subplot(4,4,7)
imshow(mult2(:,:,7));%显示一层卷积后的图像
title('matlab卷积核7图像');
subplot(4,4,8)
imshow(mult2(:,:,8));%显示参考卷积结果
title('matlab卷积核8图像');
subplot(4,4,9)
imshow(mult2(:,:,9));%显示参考卷积结果
title('matlab卷积核9图像');
subplot(4,4,10)
imshow(mult2(:,:,10));%显示参考卷积结果
title('matlab卷积核10图像');
subplot(4,4,11);
imshow(mult2(:,:,11));%显示一层卷积后的图像
title('matlab卷积核11图像');
subplot(4,4,12)
imshow(mult2(:,:,12));%显示一层卷积后的图像
title('matlab卷积核2图像');
subplot(4,4,13)
imshow(mult2(:,:,13));%显示一层卷积后的图像
title('matlab卷积核13图像');
subplot(4,4,14)
imshow(mult2(:,:,14));%显示一层卷积后的图像
title('matlab卷积核14图像');
subplot(4,4,15)
imshow(mult2(:,:,15));%显示一层卷积后的图像
title('matlab卷积核15图像');
subplot(4,4,16)
imshow(mult2(:,:,16));%显示一层卷积后的图像
title('matlab卷积核16图像');
test=zeros(10,10);
for m=1:10
    for n=1:10
    test(m,n)=x(m,n,1,11)+x(m,n,2,11)+x(m,n,3,11)+x(m,n,4,11)+x(m,n,5,11)+x(m,n,6,11)+b02(11);
    test(m,n)=test(m,n)/8;
    test(m,n)=int8(test(m,n));
%     if(test(m,n)<0)
%         test(m,n)=0;
%     end
%     final(m,n)=test(m,n)/8;
%     final=int8(final);
    end
end
% a=1;
% k=1;
% for a=1:6
%     for m=1:10
%         for n=1:10
%             sum3=0;
%             
%                 %对于第二次卷积而言，每个输入通道所对应的6个卷积核都需要和输入图像进行卷积，卷积完以后进行相加，6个feature想加完再加上bias和RELU，因此计算顺序应该以输出channel做并行。
%                 sum3=...
%                  mult1(m,n,a)*W02(1,1,k,a)+mult1(m,n+1,a)*W02(1,2,k,a)+mult1(m,n+2,a)*W02(1,3,k,a)+mult1(m,n+3,a)*W02(1,4,k,a)+mult1(m,n+4,a)*W02(1,5,k,a)+...
%                  mult1(m+1,n,a)*W02(2,1,k,a)+mult1(m+1,n+1,a)*W02(2,2,k,a)+mult1(m+1,n+2,a)*W02(2,3,k,a)+mult1(m+1,n+3,a)*W02(2,4,k,a)+mult1(m+1,n+4,a)*W02(2,5,k,a)+...
%                  mult1(m+2,n,a)*W02(3,1,k,a)+mult1(m+2,n+1,a)*W02(3,2,k,a)+mult1(m+2,n+2,a)*W02(3,3,k,a)+mult1(m+2,n+3,a)*W02(3,4,k,a)+mult1(m+2,n+4,a)*W02(3,5,k,a)+...
%                  mult1(m+3,n,a)*W02(4,1,k,a)+mult1(m+4,n+1,a)*W02(4,2,k,a)+mult1(m+3,n+2,a)*W02(4,3,k,a)+mult1(m+3,n+3,a)*W02(4,4,k,a)+mult1(m+3,n+4,a)*W02(4,5,k,a)+...
%                  mult1(m+4,n,a)*W02(5,1,k,a)+mult1(m+4,n+1,a)*W02(5,2,k,a)+mult1(m+4,n+2,a)*W02(5,3,k,a)+mult1(m+4,n+3,a)*W02(5,4,k,a)+mult1(m+4,n+4,a)*W02(5,5,k,a);
%         end
%        
%            
%             mult2(m,n,a)=sum3;
%             mult2=int8(mult2);
%     end
% 
% 
%     
% end
% mult2=double(mult2);
% sum=mult2(:,:,1)+mult2(:,:,2)+mult2(:,:,3)+mult2(:,:,4)+mult2(:,:,5)+mult2(:,:,6);
% for m=1:10
%     for n =1:10
%         if(sum(m,n)+b02(1)<0)
%         sum(m,n)=0;
%         end
%         sum(m,n)=sum(m,n)/8;
%     end
% end
% imshow(sum);
