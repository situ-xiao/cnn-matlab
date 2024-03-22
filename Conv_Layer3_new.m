clc;
clear all;
close all;



 Layer2_out=textread("C:\Users\96348\Desktop\�������\FPGA-cnn\CNN_data\5\dat_save\lay2_dat.txt",'%s');
 Layer2_out=hex2dec(Layer2_out);
 Layer2_out=uint8(Layer2_out);
 Layer2_out=reshape(Layer2_out,14,14,6);
 Layer2_out=permute(Layer2_out,[2,1,3]);
 Layer2_out=double(Layer2_out);
 
 
 
 %w02 read
W02=textread("C:\Users\96348\Desktop\�������\FPGA-cnn\CNN_data\5\dat_save\w23_dat.txt",'%s');

W02=signedhex_2_signeddec(W02);
W02=reshape(W02,5,5,16,6);
W02=permute(W02,[2,1,3,4]);%��Ȩ�ؾ���ת��
W02=double(W02);

%b02 read
b02=textread("C:\Users\96348\Desktop\�������\FPGA-cnn\CNN_data\5\dat_save\b23_dat.txt",'%s');

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
                %���ڵڶ��ξ�����ԣ�ÿ������ͨ������Ӧ��6������˶���Ҫ������ͼ����о����������Ժ������ӣ�6��feature������ټ���bias��RELU����˼���˳��Ӧ�������channel�����С�
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
imshow(mult2(:,:,1));%��ʾһ�������ͼ��
title('matlab�����1ͼ��');
subplot(4,4,2)
imshow(mult2(:,:,2));%��ʾһ�������ͼ��
title('matlab�����2ͼ��');
subplot(4,4,3)
imshow(mult2(:,:,3));%��ʾһ�������ͼ��
title('matlab�����3ͼ��');
subplot(4,4,4)
imshow(mult2(:,:,4));%��ʾһ�������ͼ��
title('matlab�����4ͼ��');
subplot(4,4,5)
imshow(mult2(:,:,5));%��ʾһ�������ͼ��
title('matlab�����5ͼ��');
subplot(4,4,6)
imshow(mult2(:,:,6));%��ʾһ�������ͼ��
title('matlab�����6ͼ��');
subplot(4,4,7)
imshow(mult2(:,:,7));%��ʾһ�������ͼ��
title('matlab�����7ͼ��');
subplot(4,4,8)
imshow(mult2(:,:,8));%��ʾ�ο�������
title('matlab�����8ͼ��');
subplot(4,4,9)
imshow(mult2(:,:,9));%��ʾ�ο�������
title('matlab�����9ͼ��');
subplot(4,4,10)
imshow(mult2(:,:,10));%��ʾ�ο�������
title('matlab�����10ͼ��');
subplot(4,4,11);
imshow(mult2(:,:,11));%��ʾһ�������ͼ��
title('matlab�����11ͼ��');
subplot(4,4,12)
imshow(mult2(:,:,12));%��ʾһ�������ͼ��
title('matlab�����2ͼ��');
subplot(4,4,13)
imshow(mult2(:,:,13));%��ʾһ�������ͼ��
title('matlab�����13ͼ��');
subplot(4,4,14)
imshow(mult2(:,:,14));%��ʾһ�������ͼ��
title('matlab�����14ͼ��');
subplot(4,4,15)
imshow(mult2(:,:,15));%��ʾһ�������ͼ��
title('matlab�����15ͼ��');
subplot(4,4,16)
imshow(mult2(:,:,16));%��ʾһ�������ͼ��
title('matlab�����16ͼ��');