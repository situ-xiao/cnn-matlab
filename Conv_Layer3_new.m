clc;
clear all;
close all;



 Layer2_out=textread("C:\Users\96348\Desktop\课题相关\FPGA-cnn\CNN_data\5\dat_save\lay2_dat.txt",'%s');
 Layer2_out=hex2dec(Layer2_out);
 Layer2_out=uint8(Layer2_out);
 Layer2_out=reshape(Layer2_out,14,14,6);
 Layer2_out=permute(Layer2_out,[2,1,3]);
 Layer2_out=double(Layer2_out);
 
 
 
 %w02 read
W02=textread("C:\Users\96348\Desktop\课题相关\FPGA-cnn\CNN_data\5\dat_save\w23_dat.txt",'%s');

W02=signedhex_2_signeddec(W02);
W02=reshape(W02,5,5,16,6);
W02=permute(W02,[2,1,3,4]);%将权重矩阵转置
W02=double(W02);

%b02 read
b02=textread("C:\Users\96348\Desktop\课题相关\FPGA-cnn\CNN_data\5\dat_save\b23_dat.txt",'%s');

b02=signedhex_2_signeddec(b02);
b02=double(b02);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%test%%%%%%%%%%%%%%%%%%
k=1;
test_sum3=zeros(6,1);
m=1;
n=1;
 for a=1:6
        s_temp=Layer2_out(m,n,a)*W02(1,1,k,a)+Layer2_out(m,n+1,a)*W02(1,2,k,a)+Layer2_out(m,n+2,a)*W02(1,3,k,a)+Layer2_out(m,n+3,a)*W02(1,4,k,a)+Layer2_out(m,n+4,a)*W02(1,5,k,a)+...
                 Layer2_out(m+1,n,a)*W02(2,1,k,a)+Layer2_out(m+1,n+1,a)*W02(2,2,k,a)+Layer2_out(m+1,n+2,a)*W02(2,3,k,a)+Layer2_out(m+1,n+3,a)*W02(2,4,k,a)+Layer2_out(m+1,n+4,a)*W02(2,5,k,a)+...
                 Layer2_out(m+2,n,a)*W02(3,1,k,a)+Layer2_out(m+2,n+1,a)*W02(3,2,k,a)+Layer2_out(m+2,n+2,a)*W02(3,3,k,a)+Layer2_out(m+2,n+3,a)*W02(3,4,k,a)+Layer2_out(m+2,n+4,a)*W02(3,5,k,a)+...
                 Layer2_out(m+3,n,a)*W02(4,1,k,a)+Layer2_out(m+3,n+1,a)*W02(4,2,k,a)+Layer2_out(m+3,n+2,a)*W02(4,3,k,a)+Layer2_out(m+3,n+3,a)*W02(4,4,k,a)+Layer2_out(m+3,n+4,a)*W02(4,5,k,a)+...
                 Layer2_out(m+4,n,a)*W02(5,1,k,a)+Layer2_out(m+4,n+1,a)*W02(5,2,k,a)+Layer2_out(m+4,n+2,a)*W02(5,3,k,a)+Layer2_out(m+4,n+3,a)*W02(5,4,k,a)+Layer2_out(m+4,n+4,a)*W02(5,5,k,a);
        %sum5=s_temp+sum5;
        test_sum3(a,1)=s_temp;
 end

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%conv%%%%%%%%%%%%%%%%%%
for k=1:16
    for m=1:10
        for n=1:10
            sum3=0;
            for a=1:6
                %对于第二次卷积而言，每个输入通道所对应的6个卷积核都需要和输入图像进行卷积，卷积完以后进行相加，6个feature想加完再加上bias和RELU，因此计算顺序应该以输出channel做并行。
                sum3=sum3+...
                 Layer2_out(m,n,a)*W02(1,1,k,a)+Layer2_out(m,n+1,a)*W02(1,2,k,a)+Layer2_out(m,n+2,a)*W02(1,3,k,a)+Layer2_out(m,n+3,a)*W02(1,4,k,a)+Layer2_out(m,n+4,a)*W02(1,5,k,a)+...
                 Layer2_out(m+1,n,a)*W02(2,1,k,a)+Layer2_out(m+1,n+1,a)*W02(2,2,k,a)+Layer2_out(m+1,n+2,a)*W02(2,3,k,a)+Layer2_out(m+1,n+3,a)*W02(2,4,k,a)+Layer2_out(m+1,n+4,a)*W02(2,5,k,a)+...
                 Layer2_out(m+2,n,a)*W02(3,1,k,a)+Layer2_out(m+2,n+1,a)*W02(3,2,k,a)+Layer2_out(m+2,n+2,a)*W02(3,3,k,a)+Layer2_out(m+2,n+3,a)*W02(3,4,k,a)+Layer2_out(m+2,n+4,a)*W02(3,5,k,a)+...
                 Layer2_out(m+3,n,a)*W02(4,1,k,a)+Layer2_out(m+3,n+1,a)*W02(4,2,k,a)+Layer2_out(m+3,n+2,a)*W02(4,3,k,a)+Layer2_out(m+3,n+3,a)*W02(4,4,k,a)+Layer2_out(m+3,n+4,a)*W02(4,5,k,a)+...
                 Layer2_out(m+4,n,a)*W02(5,1,k,a)+Layer2_out(m+4,n+1,a)*W02(5,2,k,a)+Layer2_out(m+4,n+2,a)*W02(5,3,k,a)+Layer2_out(m+4,n+3,a)*W02(5,4,k,a)+Layer2_out(m+4,n+4,a)*W02(5,5,k,a);
            end
            sum3=(sum3 + b02(k));
            if(sum3<0)
               sum3=0; 
            end
            mult2(m,n,k)=bitsrl(int8(sum3),3);
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