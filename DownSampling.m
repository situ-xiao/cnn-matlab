clear;
clc;
close all;
IMG=imread("C:\Users\96348\Desktop\QQ截图20230829165949.png");

Grsc = rgb2gray(IMG);
subplot(1,3,1);
imshow(Grsc);title('灰度图')
%Grsc=Grsc.';

step_x=22;
step_y=32;

for i = 1:32
    for j= 1:32
        y=(i-1)*step_y+1;
        x=(j-1)*step_x+1;
        DS(j,i)=Grsc(x,y);
    end
end
subplot(1,3,2);
imshow(DS);title('降采样图')
DS_matlab=imresize(Grsc,[32,32]);
subplot(1,3,3);
imshow(DS_matlab);title('参考降采样图')
