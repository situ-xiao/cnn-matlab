clc;
clear all;
close all;

 Layer2_out=textread("C:\Users\96348\Desktop\课题相关\FPGA-cnn\CNN_data\5\dat_save\lay2_dat.txt",'%s');
 Layer2_out=hex2dec(Layer2_out);
 Layer2_out=uint8(Layer2_out);
 Layer2_out=reshape(Layer2_out,14,14,6);
  Layer2_out=permute(Layer2_out,[2,1,3]);
 Layer2_out=int8(Layer2_out);
 %Layer2_out=double(Layer2_out);

 
 
 %w02 read
W02=textread("C:\Users\96348\Desktop\课题相关\FPGA-cnn\CNN_data\5\dat_save\w23_dat.txt",'%s');

W02=signedhex_2_signeddec(W02);
W02=reshape(W02,5,5,16,6);
W02=permute(W02,[2,1,3,4]);%将权重矩阵转置
W02=int8(W02);

%b02 read
b02=textread("C:\Users\96348\Desktop\课题相关\FPGA-cnn\CNN_data\5\dat_save\b23_dat.txt",'%s');

b02=signedhex_2_signeddec(b02);
b02=int8(b02);
Layer2_out=double(Layer2_out);
W02=double(W02);

k=1;
a=1;
b=2;
c=3;


    for m=1:10
        for n=1:10
            sum=0;
            s1=0;
            s2=0;
            s3=0;
            
            s1=Layer2_out(m,n,a)*W02(1,1,k,a)+Layer2_out(m,n+1,a)*W02(1,2,k,a)+Layer2_out(m,n+2,a)*W02(1,3,k,a)+Layer2_out(m,n+3,a)*W02(1,4,k,a)+Layer2_out(m,n+4,a)*W02(1,5,k,a)+...
                 Layer2_out(m+1,n,a)*W02(2,1,k,a)+Layer2_out(m+1,n+1,a)*W02(2,2,k,a)+Layer2_out(m+1,n+2,a)*W02(2,3,k,a)+Layer2_out(m+1,n+3,a)*W02(2,4,k,a)+Layer2_out(m+1,n+4,a)*W02(2,5,k,a)+...
                 Layer2_out(m+2,n,a)*W02(3,1,k,a)+Layer2_out(m+2,n+1,a)*W02(3,2,k,a)+Layer2_out(m+2,n+2,a)*W02(3,3,k,a)+Layer2_out(m+2,n+3,a)*W02(3,4,k,a)+Layer2_out(m+2,n+4,a)*W02(3,5,k,a)+...
                 Layer2_out(m+3,n,a)*W02(4,1,k,a)+Layer2_out(m+4,n+1,a)*W02(4,2,k,a)+Layer2_out(m+3,n+2,a)*W02(4,3,k,a)+Layer2_out(m+3,n+3,a)*W02(4,4,k,a)+Layer2_out(m+3,n+4,a)*W02(4,5,k,a)+...
                 Layer2_out(m+4,n,a)*W02(5,1,k,a)+Layer2_out(m+4,n+1,a)*W02(5,2,k,a)+Layer2_out(m+4,n+2,a)*W02(5,3,k,a)+Layer2_out(m+4,n+3,a)*W02(5,4,k,a)+Layer2_out(m+4,n+4,a)*W02(5,5,k,a);
            s2=Layer2_out(m,n,b)*W02(1,1,k,b)+Layer2_out(m,n+1,b)*W02(1,2,k,b)+Layer2_out(m,n+2,b)*W02(1,3,k,b)+Layer2_out(m,n+3,b)*W02(1,4,k,b)+Layer2_out(m,n+4,b)*W02(1,5,k,b)+...
                 Layer2_out(m+1,n,b)*W02(2,1,k,b)+Layer2_out(m+1,n+1,b)*W02(2,2,k,b)+Layer2_out(m+1,n+2,b)*W02(2,3,k,b)+Layer2_out(m+1,n+3,b)*W02(2,4,k,b)+Layer2_out(m+1,n+4,b)*W02(2,5,k,b)+...
                 Layer2_out(m+2,n,b)*W02(3,1,k,b)+Layer2_out(m+2,n+1,b)*W02(3,2,k,b)+Layer2_out(m+2,n+2,b)*W02(3,3,k,b)+Layer2_out(m+2,n+3,b)*W02(3,4,k,b)+Layer2_out(m+2,n+4,b)*W02(3,5,k,b)+...
                 Layer2_out(m+3,n,b)*W02(4,1,k,b)+Layer2_out(m+4,n+1,b)*W02(4,2,k,b)+Layer2_out(m+3,n+2,b)*W02(4,3,k,b)+Layer2_out(m+3,n+3,b)*W02(4,4,k,b)+Layer2_out(m+3,n+4,b)*W02(4,5,k,b)+...
                 Layer2_out(m+4,n,b)*W02(5,1,k,b)+Layer2_out(m+4,n+1,b)*W02(5,2,k,b)+Layer2_out(m+4,n+2,b)*W02(5,3,k,b)+Layer2_out(m+4,n+3,b)*W02(5,4,k,b)+Layer2_out(m+4,n+4,b)*W02(5,5,k,b);
             s3=Layer2_out(m,n,c)*W02(1,1,k,c)+Layer2_out(m,n+1,c)*W02(1,2,k,c)+Layer2_out(m,n+2,c)*W02(1,3,k,c)+Layer2_out(m,n+3,c)*W02(1,4,k,c)+Layer2_out(m,n+4,c)*W02(1,5,k,c)+...
                 Layer2_out(m+1,n,c)*W02(2,1,k,c)+Layer2_out(m+1,n+1,c)*W02(2,2,k,c)+Layer2_out(m+1,n+2,c)*W02(2,3,k,c)+Layer2_out(m+1,n+3,c)*W02(2,4,k,c)+Layer2_out(m+1,n+4,c)*W02(2,5,k,c)+...
                 Layer2_out(m+2,n,c)*W02(3,1,k,c)+Layer2_out(m+2,n+1,c)*W02(3,2,k,c)+Layer2_out(m+2,n+2,c)*W02(3,3,k,c)+Layer2_out(m+2,n+3,c)*W02(3,4,k,c)+Layer2_out(m+2,n+4,c)*W02(3,5,k,c)+...
                 Layer2_out(m+3,n,c)*W02(4,1,k,c)+Layer2_out(m+4,n+1,c)*W02(4,2,k,c)+Layer2_out(m+3,n+2,c)*W02(4,3,k,c)+Layer2_out(m+3,n+3,c)*W02(4,4,k,c)+Layer2_out(m+3,n+4,c)*W02(4,5,k,c)+...
                 Layer2_out(m+4,n,c)*W02(5,1,k,c)+Layer2_out(m+4,n+1,c)*W02(5,2,k,c)+Layer2_out(m+4,n+2,c)*W02(5,3,k,c)+Layer2_out(m+4,n+3,c)*W02(5,4,k,c)+Layer2_out(m+4,n+4,c)*W02(5,5,k,c);
             sum=s1+s2+s3+b02(k);
            if(sum<0)
                sum=0;
            end
             mult2(m,n,k)=sum/8;
             
        end
        
    end

mult2=double(mult2);
imshow(mult2(:,:,1))