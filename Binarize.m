%��ȡһ��ͼƬ������ʾ
original_picture=imread('C:\Users\96348\Downloads\FPGAandCNN-main\FPGAandCNN-main\DigitalRecognition\dataset\test\0\09.png');
figure(1);
imshow(original_picture);
title('ԭʼRGBͼ��')

%��ͼ��ת���ɻҶ�ͼ��
GrayPic=rgb2gray(original_picture);%��RGBͼ��ת���ɻҶ�ͼ��
figure(2)
imshow(GrayPic);
title('RGBͼ��ת��Ϊ�Ҷ�ͼ��')

%��ͼ����ж�ֵ������
thresh=graythresh(original_picture);%graythreshΪ�Զ�ȷ����ֵ����ֵ���������ڸ���ֵ�ľͱ�ɰ�ɫ��С�ڸ���ֵ�ľͱ�ɺ�ɫ��������ֵԽ��Խ�ڣ���ֵԽСԽ��
Pic2=im2bw(original_picture,thresh);%�����Ҫ�Լ��趨��ֵ����ô�Ϳ�������дPic2=im2bw(original_picture,value);,value=[0,1]�м���κ���ֵ
figure(3);
imshow(Pic2);
title('RGBͼ��ת��Ϊ��ֵ��ͼ��')

thresh=graythresh(GrayPic);
Pic2_=im2bw(GrayPic,thresh);
figure(4);
imshow(Pic2_);
title('�Ҷ�ͼ��ת��Ϊ��ֵ��ͼ��')