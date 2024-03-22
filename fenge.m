%%%%%%%字符分割与定位。
I=imread('C:\Users\96348\Desktop\database\char\lianti\1_3.png');
figure(1)
imshow(I)
%I=rgb2gray(I);
I=1-im2bw(I);%二值化并取反色
[ix1,iy1]=xfenge(I);
[jx1,jy1]=yfenge(I);
goal=I(ix1:iy1,jx1:jy1);%定位区域
goal=[zeros(size(goal,1),2) goal zeros(size(goal,1),2)];
a=sum(goal);
label=find(a>0);
summ=0;
j=1;
for i=1:length(label)-1
    if (label(i+1)-label(i))>1
        KK(j)=label(i);
        JJ(j)=label(i+1);
        summ=summ+1;
        j=j+1;
    end
end
%figure(2)
JJ=[3 JJ];
KK=[KK size(goal,2)-2];
summ=summ+1;
figure(2)
for i=1:summ
    subplot(1,summ,i);
    II=goal(:,JJ(i)-2:KK(i)+2);
    II=imresize(II,[25,18]);
    imshow(II);
    hold on
end