clear;
clc;
close all;
imgx=imread("D:\mnist\mnist_train\6\24554.png"); %读取图像
rsl_up = imresize(imgx,[32,32]);
subplot(1,5,1);imshow(imgx);title('原图');
subplot(1,5,2);imshow(imgx);title('放大图像');
thresh=graythresh(rsl_up);
Binarized=im2bw(rsl_up,thresh);
%Binarized=imcomplement(Binarized)
subplot(1,5,3);imshow(Binarized);title('二值化后的灰度图');
out=Lenet5(Binarized);
%out=reshape(out,120,1);
Binarized=int8(Binarized)
Binarized=Binarized.'
%Binarized=fliplr(Binarized);
%Binarized=flipud(Binarized);
%l5=textread("D:\CNN\L5_file.txt",'%s')
%l5=signedhex_2_signeddec(l5);
%diff=out-l5;
fid = fopen ("D:\CNN\9.coe",'w');
%fprintf( fid, 'memory_initialization_radix=2;\n', Binarized);%生成索引
%fprintf( fid, 'memory_initialization_vector =\n', Binarized );
for i=1:1024%循环打印 
    fprintf(fid,'%d',Binarized(i));%一个一个将矩阵里面的数值打印进去
    if(rem(i,32)==0&&i~=1024)
        fprintf(fid,'\n');%打印逗号
    elseif(i==1024)
        %fprintf(fid,';');%最后一行的分号
    end
end
fclose(fid);