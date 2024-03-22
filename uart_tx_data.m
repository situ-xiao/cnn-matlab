clear;
clc;
close all;
imgx=imread("D:\mnist\mnist_test\9\479.png"); %读取图像
rsl_up = imresize(imgx,[32,32]);
thresh=graythresh(rsl_up);
Binarized=im2bw(rsl_up,thresh);
%subplot(1,5,3);imshow(Binarized);title('二值化后的灰度图');
Binarized=int8(Binarized)



% 将二进制数转换为十六进制数

    hexNumber = dec2hex(bin2dec(num2str(Binarized)));
    while(length(hexNumber(1,:))<8)
        hexNumber(:,2:(length(hexNumber(1,:))+1))=hexNumber(:,1:length(hexNumber(1,:)));
        hexNumber(:,1)='0';
    end
fid = fopen("D:\Lenet_5\uart.txt",'w');
for i=1:32
    fprintf(fid,"%s",hexNumber(i,:));
    
           
    



end
fclose(fid);