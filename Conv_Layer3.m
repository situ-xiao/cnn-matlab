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
%%%%%%%%%%%%%%%%%%%%%%%计算channel 1~6的卷积结果%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
a=1;
b=1;
c=1;
for k=1:6
    switch k
        case 1
        a=1;
        b=2;
        c=3;
        case 2
        a=2;
        b=3;
        c=4;
        case 3
        a=3;
        b=4;
        c=5;
        case 4
        a=4;
        b=5;
        c=6;
        case 5
        a=1;
        b=5;
        c=6;    
        case 6
        a=1;
        b=2;
        c=6;
         
        
            
    end
    
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
end
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
d=0;
%%%%%%%%%%%%%%%%%%%%%%%计算channel 7~15的卷积结果%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
for k=7:15
    switch k
        case 7
        a=1;
        b=2;
        c=3;
        d=4;
        case 8
        a=2;
        b=3;
        c=4;
        d=5;
        case 9
        a=3;
        b=4;
        c=5;
        d=6;
        case 10
        a=1;
        b=4;
        c=5;
        d=6;
        case 11
        a=1;
        b=2;
        c=5;
        d=6;
        case 12
        a=1;
        b=2;
        c=3;
        d=6;
        case 13
        a=1;
        b=2;
        c=4;
        d=5;
        case 14
        a=2;
        b=3;
        c=5;
        d=6;
        case 15
        a=1;
        b=3;
        c=4;
        d=3;
        
            
    end
    
    for m=1:10
        for n=1:10
            sum=0;
            s1=0;
            s2=0;
            s3=0;
            s4=0;
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
             s4=Layer2_out(m,n,d)*W02(1,1,k,d)+Layer2_out(m,n+1,d)*W02(1,2,k,d)+Layer2_out(m,n+2,d)*W02(1,3,k,d)+Layer2_out(m,n+3,d)*W02(1,4,k,d)+Layer2_out(m,n+4,d)*W02(1,5,k,d)+...
                 Layer2_out(m+1,n,d)*W02(2,1,k,d)+Layer2_out(m+1,n+1,d)*W02(2,2,k,d)+Layer2_out(m+1,n+2,d)*W02(2,3,k,d)+Layer2_out(m+1,n+3,d)*W02(2,4,k,d)+Layer2_out(m+1,n+4,d)*W02(2,5,k,d)+...
                 Layer2_out(m+2,n,d)*W02(3,1,k,d)+Layer2_out(m+2,n+1,d)*W02(3,2,k,d)+Layer2_out(m+2,n+2,d)*W02(3,3,k,d)+Layer2_out(m+2,n+3,d)*W02(3,4,k,d)+Layer2_out(m+2,n+4,d)*W02(3,5,k,d)+...
                 Layer2_out(m+3,n,d)*W02(4,1,k,d)+Layer2_out(m+4,n+1,d)*W02(4,2,k,d)+Layer2_out(m+3,n+2,d)*W02(4,3,k,d)+Layer2_out(m+3,n+3,d)*W02(4,4,k,d)+Layer2_out(m+3,n+4,d)*W02(4,5,k,d)+...
                 Layer2_out(m+4,n,d)*W02(5,1,k,d)+Layer2_out(m+4,n+1,d)*W02(5,2,k,d)+Layer2_out(m+4,n+2,d)*W02(5,3,k,d)+Layer2_out(m+4,n+3,d)*W02(5,4,k,d)+Layer2_out(m+4,n+4,d)*W02(5,5,k,d);
             sum=s1+s2+s3+s4+b02(k);
             if(sum<0)
                    sum=0;
             end
             mult2(m,n,k)=sum/8;
             
        end
        
    end
end






%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%%%%%%%%%%%%%%%%%%%%%%%计算channel 16的卷积结果%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

 k=16;
a=1;
b=2;
c=3;
d=4;

    for m=1:10
        for n=1:10
            sum=0;
            s1=0;
            s2=0;
            s3=0;
            s4=0;
            s5=0;
            s6=0;
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
             s4=Layer2_out(m,n,d)*W02(1,1,k,d)+Layer2_out(m,n+1,d)*W02(1,2,k,d)+Layer2_out(m,n+2,d)*W02(1,3,k,d)+Layer2_out(m,n+3,d)*W02(1,4,k,d)+Layer2_out(m,n+4,d)*W02(1,5,k,d)+...
                 Layer2_out(m+1,n,d)*W02(2,1,k,d)+Layer2_out(m+1,n+1,d)*W02(2,2,k,d)+Layer2_out(m+1,n+2,d)*W02(2,3,k,d)+Layer2_out(m+1,n+3,d)*W02(2,4,k,d)+Layer2_out(m+1,n+4,d)*W02(2,5,k,d)+...
                 Layer2_out(m+2,n,d)*W02(3,1,k,d)+Layer2_out(m+2,n+1,d)*W02(3,2,k,d)+Layer2_out(m+2,n+2,d)*W02(3,3,k,d)+Layer2_out(m+2,n+3,d)*W02(3,4,k,d)+Layer2_out(m+2,n+4,d)*W02(3,5,k,d)+...
                 Layer2_out(m+3,n,d)*W02(4,1,k,d)+Layer2_out(m+4,n+1,d)*W02(4,2,k,d)+Layer2_out(m+3,n+2,d)*W02(4,3,k,d)+Layer2_out(m+3,n+3,d)*W02(4,4,k,d)+Layer2_out(m+3,n+4,d)*W02(4,5,k,d)+...
                 Layer2_out(m+4,n,d)*W02(5,1,k,d)+Layer2_out(m+4,n+1,d)*W02(5,2,k,d)+Layer2_out(m+4,n+2,d)*W02(5,3,k,d)+Layer2_out(m+4,n+3,d)*W02(5,4,k,d)+Layer2_out(m+4,n+4,d)*W02(5,5,k,d);
             s5=Layer2_out(m,n,d+1)*W02(1,1,k,d+1)+Layer2_out(m,n+1,d+1)*W02(1,2,k,d+1)+Layer2_out(m,n+2,d+1)*W02(1,3,k,d+1)+Layer2_out(m,n+3,d+1)*W02(1,4,k,d+1)+Layer2_out(m,n+4,d+1)*W02(1,5,k,d+1)+...
             Layer2_out(m+1,n,d+1)*W02(2,1,k,d+1)+Layer2_out(m+1,n+1,d+1)*W02(2,2,k,d+1)+Layer2_out(m+1,n+2,d+1)*W02(2,3,k,d+1)+Layer2_out(m+1,n+3,d+1)*W02(2,4,k,d+1)+Layer2_out(m+1,n+4,d+1)*W02(2,5,k,d+1)+...
             Layer2_out(m+2,n,d+1)*W02(3,1,k,d+1)+Layer2_out(m+2,n+1,d+1)*W02(3,2,k,d+1)+Layer2_out(m+2,n+2,d+1)*W02(3,3,k,d+1)+Layer2_out(m+2,n+3,d+1)*W02(3,4,k,d+1)+Layer2_out(m+2,n+4,d+1)*W02(3,5,k,d+1)+...
             Layer2_out(m+3,n,d+1)*W02(4,1,k,d+1)+Layer2_out(m+4,n+1,d+1)*W02(4,2,k,d+1)+Layer2_out(m+3,n+2,d+1)*W02(4,3,k,d+1)+Layer2_out(m+3,n+3,d+1)*W02(4,4,k,d+1)+Layer2_out(m+3,n+4,d+1)*W02(4,5,k,d+1)+...
             Layer2_out(m+4,n,d+1)*W02(5,1,k,d+1)+Layer2_out(m+4,n+1,d+1)*W02(5,2,k,d+1)+Layer2_out(m+4,n+2,d+1)*W02(5,3,k,d+1)+Layer2_out(m+4,n+3,d+1)*W02(5,4,k,d+1)+Layer2_out(m+4,n+4,d+1)*W02(5,5,k,d+1);
         s6=Layer2_out(m,n,d+2)*W02(1,1,k,d+2)+Layer2_out(m,n+1,d+2)*W02(1,2,k,d+2)+Layer2_out(m,n+2,d+2)*W02(1,3,k,d+2)+Layer2_out(m,n+3,d+2)*W02(1,4,k,d+2)+Layer2_out(m,n+4,d+2)*W02(1,5,k,d+2)+...
             Layer2_out(m+1,n,d+2)*W02(2,1,k,d+2)+Layer2_out(m+1,n+1,d+2)*W02(2,2,k,d+2)+Layer2_out(m+1,n+2,d+2)*W02(2,3,k,d+2)+Layer2_out(m+1,n+3,d+2)*W02(2,4,k,d+2)+Layer2_out(m+1,n+4,d+2)*W02(2,5,k,d+2)+...
             Layer2_out(m+2,n,d+2)*W02(3,1,k,d+2)+Layer2_out(m+2,n+1,d+2)*W02(3,2,k,d+2)+Layer2_out(m+2,n+2,d+2)*W02(3,3,k,d+2)+Layer2_out(m+2,n+3,d+2)*W02(3,4,k,d+2)+Layer2_out(m+2,n+4,d+2)*W02(3,5,k,d+2)+...
             Layer2_out(m+3,n,d+2)*W02(4,1,k,d+2)+Layer2_out(m+4,n+1,d+2)*W02(4,2,k,d+2)+Layer2_out(m+3,n+2,d+2)*W02(4,3,k,d+2)+Layer2_out(m+3,n+3,d+2)*W02(4,4,k,d+2)+Layer2_out(m+3,n+4,d+2)*W02(4,5,k,d+2)+...
             Layer2_out(m+4,n,d+2)*W02(5,1,k,d+2)+Layer2_out(m+4,n+1,d+2)*W02(5,2,k,d+2)+Layer2_out(m+4,n+2,d+2)*W02(5,3,k,d+2)+Layer2_out(m+4,n+3,d+2)*W02(5,4,k,d+2)+Layer2_out(m+4,n+4,d+2)*W02(5,5,k,d+2);
            sum=s1+s2+s3+s4+s5+s6+b02(k);
            if(sum<0)
                sum=0;
            end
             mult2(m,n,k)=sum/8;
             
        end
        
    end
    

  mult2=int8(mult2);

    
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
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
 lay_out_03=textread("C:\Users\96348\Desktop\课题相关\FPGA-cnn\CNN_data\5\dat_save\lay3_dat.txt",'%s');
 lay_out_03=hex2dec(lay_out_03);
 lay_out_03=int8(lay_out_03);
 lay_out_03=reshape(lay_out_03,10,10,16)
 lay_out_03=permute(lay_out_03,[2,1,3]);
 lay_out_03=double(lay_out_03);
figure;
subplot(4,4,1);
imshow(lay_out_03(:,:,1));%显示一层卷积后的图像
title('参考卷积核1图像');
subplot(4,4,2)
imshow(lay_out_03(:,:,2));%显示一层卷积后的图像
title('参考卷积核2图像');
subplot(4,4,3)
imshow(lay_out_03(:,:,3));%显示一层卷积后的图像
title('参考卷积核3图像');
subplot(4,4,4)
imshow(lay_out_03(:,:,4));%显示一层卷积后的图像
title('参考卷积核4图像');
subplot(4,4,5)
imshow(lay_out_03(:,:,5));%显示一层卷积后的图像
title('参考卷积核5图像');
subplot(4,4,6)
imshow(lay_out_03(:,:,6));%显示一层卷积后的图像
title('参考卷积核6图像');
subplot(4,4,7)
imshow(lay_out_03(:,:,7));%显示一层卷积后的图像
title('参考卷积核7图像');
subplot(4,4,8)
imshow(lay_out_03(:,:,8));%显示参考卷积结果
title('参考卷积核8图像');
subplot(4,4,9)
imshow(lay_out_03(:,:,9));%显示参考卷积结果
title('参考卷积核9图像');
subplot(4,4,10)
imshow(lay_out_03(:,:,10));%显示参考卷积结果
title('参考卷积核10图像');
subplot(4,4,11);
imshow(lay_out_03(:,:,11));%显示一层卷积后的图像
title('参考卷积核11图像');
subplot(4,4,12)
imshow(lay_out_03(:,:,12));%显示一层卷积后的图像
title('参考卷积核2图像');
subplot(4,4,13)
imshow(lay_out_03(:,:,13));%显示一层卷积后的图像
title('参考卷积核13图像');
subplot(4,4,14)
imshow(lay_out_03(:,:,14));%显示一层卷积后的图像
title('参考卷积核14图像');
subplot(4,4,15)
imshow(lay_out_03(:,:,15));%显示一层卷积后的图像
title('参考卷积核15图像');
subplot(4,4,16)
imshow(lay_out_03(:,:,16));%显示一层卷积后的图像
title('参考卷积核16图像');

