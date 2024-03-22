function output=Lenet5(input)
%imgx read
%imgx=textread("C:\Users\96348\Desktop\课题相关\FPGA-cnn\CNN_data\7\dat_save\imgx_dat.txt",'%s');
imgx=input;
%imgx=hex2dec(imgx);
imgx=uint8(imgx); 
imgx=reshape(imgx,32,32);
%imgx=imgx.';
imgx=int8(imgx);


%w01 read
w01=textread("C:\Users\96348\Desktop\课题相关\FPGA-cnn\CNN_data\5\dat_save\w01_dat.txt",'%s');

w01=signedhex_2_signeddec(w01)
w01=reshape(w01,5,5,6);
w01=permute(w01,[2,1,3])%将权重矩阵转置
w01=int8(w01)
%b01 read
b01=textread("C:\Users\96348\Desktop\课题相关\FPGA-cnn\CNN_data\5\dat_save\b01_dat.txt",'%s');

b01=signedhex_2_signeddec(b01);
b01=int8(b01);

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
mult1=double(mult1);
figure(2)
%imshow(double(mult1(:,:,1)))
subplot(3,3,1);
imshow(mult1(:,:,1));
title('matlab第1个卷积核卷积结果(加bias，加了RELU)');
subplot(3,3,2);
imshow(mult1(:,:,2));
title('matlab第2个卷积核卷积结果(加bias，加了RELU)');
subplot(3,3,3);
imshow(mult1(:,:,3));
title('matlab第3个卷积核卷积结果(加bias，加了RELU)');
subplot(3,3,4);
imshow(mult1(:,:,4));
title('matlab第4个卷积核卷积结果(加bias，加了RELU)');
subplot(3,3,5);
imshow(mult1(:,:,5));
title('matlab第5个卷积核卷积结果(加bias，加了RELU)');
subplot(3,3,6);
imshow(mult1(:,:,6));
title('matlab第6个卷积核卷积结果(加bias，加了RELU)');
mult1=int8(mult1);
%Maxpooling_Layer1
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
lay_out_01=mult1;
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
             
             j=j+1;
         end
         i=i+1;
     end
     
     
     
 end
 %Conv_Layer2
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
  Layer2_out=pooling;

 %w23 read
W23=textread("C:\Users\96348\Desktop\课题相关\FPGA-cnn\CNN_data\5\dat_save\w23_dat.txt",'%s');

W23=signedhex_2_signeddec(W23);
W23=reshape(W23,5,5,16,6);
W23=permute(W23,[2,1,3,4]);%将权重矩阵转置
W23=double(W23);

%b23 read
b23=textread("C:\Users\96348\Desktop\课题相关\FPGA-cnn\CNN_data\5\dat_save\b23_dat.txt",'%s');

b23=signedhex_2_signeddec(b23);
b23=double(b23);

for k=1:16
    for m=1:10
        for n=1:10
            sum3=0;
            for a=1:6
                sum3=sum3+...
                 Layer2_out(m,n,a)*W23(1,1,k,a)+Layer2_out(m,n+1,a)*W23(1,2,k,a)+Layer2_out(m,n+2,a)*W23(1,3,k,a)+Layer2_out(m,n+3,a)*W23(1,4,k,a)+Layer2_out(m,n+4,a)*W23(1,5,k,a)+...
                 Layer2_out(m+1,n,a)*W23(2,1,k,a)+Layer2_out(m+1,n+1,a)*W23(2,2,k,a)+Layer2_out(m+1,n+2,a)*W23(2,3,k,a)+Layer2_out(m+1,n+3,a)*W23(2,4,k,a)+Layer2_out(m+1,n+4,a)*W23(2,5,k,a)+...
                 Layer2_out(m+2,n,a)*W23(3,1,k,a)+Layer2_out(m+2,n+1,a)*W23(3,2,k,a)+Layer2_out(m+2,n+2,a)*W23(3,3,k,a)+Layer2_out(m+2,n+3,a)*W23(3,4,k,a)+Layer2_out(m+2,n+4,a)*W23(3,5,k,a)+...
                 Layer2_out(m+3,n,a)*W23(4,1,k,a)+Layer2_out(m+3,n+1,a)*W23(4,2,k,a)+Layer2_out(m+3,n+2,a)*W23(4,3,k,a)+Layer2_out(m+3,n+3,a)*W23(4,4,k,a)+Layer2_out(m+3,n+4,a)*W23(4,5,k,a)+...
                 Layer2_out(m+4,n,a)*W23(5,1,k,a)+Layer2_out(m+4,n+1,a)*W23(5,2,k,a)+Layer2_out(m+4,n+2,a)*W23(5,3,k,a)+Layer2_out(m+4,n+3,a)*W23(5,4,k,a)+Layer2_out(m+4,n+4,a)*W23(5,5,k,a);
            end
            sum3=(sum3 + b23(k));
            if(sum3<0)
               sum3=0; 
            end
            mult2(m,n,k)=sum3/8;
            mult2=int8(mult2);
        end
    end
    end

    mult2=double(mult2);

%  figure(2);
% subplot(4,4,1);
% imshow(mult2(:,:,1));%显示一层卷积后的图像
% title('matlab卷积核1图像');
% subplot(4,4,2)
% imshow(mult2(:,:,2));%显示一层卷积后的图像
% title('matlab卷积核2图像');
% subplot(4,4,3)
% imshow(mult2(:,:,3));%显示一层卷积后的图像
% title('matlab卷积核3图像');
% subplot(4,4,4)
% imshow(mult2(:,:,4));%显示一层卷积后的图像
% title('matlab卷积核4图像');
% subplot(4,4,5)
% imshow(mult2(:,:,5));%显示一层卷积后的图像
% title('matlab卷积核5图像');
% subplot(4,4,6)
% imshow(mult2(:,:,6));%显示一层卷积后的图像
% title('matlab卷积核6图像');
% subplot(4,4,7)
% imshow(mult2(:,:,7));%显示一层卷积后的图像
% title('matlab卷积核7图像');
% subplot(4,4,8)
% imshow(mult2(:,:,8));%显示参考卷积结果
% title('matlab卷积核8图像');
% subplot(4,4,9)
% imshow(mult2(:,:,9));%显示参考卷积结果
% title('matlab卷积核9图像');
% subplot(4,4,10)
% imshow(mult2(:,:,10));%显示参考卷积结果
% title('matlab卷积核10图像');
% subplot(4,4,11);
% imshow(mult2(:,:,11));%显示一层卷积后的图像
% title('matlab卷积核11图像');
% subplot(4,4,12)
% imshow(mult2(:,:,12));%显示一层卷积后的图像
% title('matlab卷积核2图像');
% subplot(4,4,13)
% imshow(mult2(:,:,13));%显示一层卷积后的图像
% title('matlab卷积核13图像');
% subplot(4,4,14)
% imshow(mult2(:,:,14));%显示一层卷积后的图像
% title('matlab卷积核14图像');
% subplot(4,4,15)
% imshow(mult2(:,:,15));%显示一层卷积后的图像
% title('matlab卷积核15图像');
% subplot(4,4,16)
% imshow(mult2(:,:,16));%显示一层卷积后的图像
% title('matlab卷积核16图像');


    
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%Max_pooling_L4%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%


lay_out_03=mult2;
 
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
             pooling2(i,j,k)=sum;
             
             j=j+1;
         end
         i=i+1;
     end
     
     
     
 end
 pooling2=double(pooling2);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%conv_Layer5%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
Layer4_out=pooling2;

 %w45 read
W45=textread("C:\Users\96348\Desktop\课题相关\FPGA-cnn\CNN_data\5\dat_save\w45_dat.txt",'%s');

W45=signedhex_2_signeddec(W45);
W45=reshape(W45,5,5,120,16);
W45=permute(W45,[2,1,3,4]);%将权重矩阵转置
W45=int8(W45);

%b45 read
b45=textread("C:\Users\96348\Desktop\课题相关\FPGA-cnn\CNN_data\5\dat_save\b45_dat.txt",'%s');

b45=signedhex_2_signeddec(b45);
b45=int8(b45);
Layer4_out=double(Layer4_out);
W45=double(W45);
m=1;
n=1;
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%convolutional Layer5%%%%%%%%%%%%%%%%%%
for k=1:120
    sum5=0;
    for a=1:16
        s_temp=0;
        s_temp=Layer4_out(m,n,a)*W45(1,1,k,a)+Layer4_out(m,n+1,a)*W45(1,2,k,a)+Layer4_out(m,n+2,a)*W45(1,3,k,a)+Layer4_out(m,n+3,a)*W45(1,4,k,a)+Layer4_out(m,n+4,a)*W45(1,5,k,a)+...
                 Layer4_out(m+1,n,a)*W45(2,1,k,a)+Layer4_out(m+1,n+1,a)*W45(2,2,k,a)+Layer4_out(m+1,n+2,a)*W45(2,3,k,a)+Layer4_out(m+1,n+3,a)*W45(2,4,k,a)+Layer4_out(m+1,n+4,a)*W45(2,5,k,a)+...
                 Layer4_out(m+2,n,a)*W45(3,1,k,a)+Layer4_out(m+2,n+1,a)*W45(3,2,k,a)+Layer4_out(m+2,n+2,a)*W45(3,3,k,a)+Layer4_out(m+2,n+3,a)*W45(3,4,k,a)+Layer4_out(m+2,n+4,a)*W45(3,5,k,a)+...
                 Layer4_out(m+3,n,a)*W45(4,1,k,a)+Layer4_out(m+3,n+1,a)*W45(4,2,k,a)+Layer4_out(m+3,n+2,a)*W45(4,3,k,a)+Layer4_out(m+3,n+3,a)*W45(4,4,k,a)+Layer4_out(m+3,n+4,a)*W45(4,5,k,a)+...
                 Layer4_out(m+4,n,a)*W45(5,1,k,a)+Layer4_out(m+4,n+1,a)*W45(5,2,k,a)+Layer4_out(m+4,n+2,a)*W45(5,3,k,a)+Layer4_out(m+4,n+3,a)*W45(5,4,k,a)+Layer4_out(m+4,n+4,a)*W45(5,5,k,a);
        sum5=s_temp+sum5;
        
        
    end
    sum5=sum5+b45(k);
    if(sum5<0)
        sum5=0;
    end
    mult3(1,1,k)=sum5/8;













end

mult3=double(mult3);

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%output%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
outx=mult3;
%w56 read  %%120行，10列，源文件按行分隔
W56=textread("C:\Users\96348\Desktop\课题相关\FPGA-cnn\CNN_data\5\dat_save\w56_dat.txt",'%s');
W56=signedhex_2_signeddec(W56);
W56=reshape(W56,10,120);
W56=permute(W56,[2,1]);%将权重矩阵转置
W56=double(W56);

%b56 read
b56=textread("C:\Users\96348\Desktop\课题相关\FPGA-cnn\CNN_data\5\dat_save\b56_dat.txt",'%s');
b56=signedhex_2_signeddec(b56);
b56=double(b56);



for k=1:10
    out=0;
    for m=1:120
        
        out=out+outx(1,1,m)*W56(m,k);
    
    end
    out=(out+b56(k));
    if(out<0)
        out=0;
    end
     lenet5_output(k)=out;

end
lenet5_output=reshape(lenet5_output,10,1);
lenet5_output=double(lenet5_output);

%out=textread("C:\Users\96348\Desktop\课题相关\FPGA-cnn\CNN_data\7\dat_save\outx_dat.txt",'%s');
 %out=hex2dec(out);
 %out=double(out);
output=lenet5_output;
end















