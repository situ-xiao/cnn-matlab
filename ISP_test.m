clear;
clc;
close all;
imgx=imread("D:\mnist\mnist_train\6\24554.png"); %��ȡͼ��
rsl_up = imresize(imgx,[32,32]);
subplot(1,5,1);imshow(imgx);title('ԭͼ');
subplot(1,5,2);imshow(imgx);title('�Ŵ�ͼ��');
thresh=graythresh(rsl_up);
Binarized=im2bw(rsl_up,thresh);
%Binarized=imcomplement(Binarized)
subplot(1,5,3);imshow(Binarized);title('��ֵ����ĻҶ�ͼ');
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
%fprintf( fid, 'memory_initialization_radix=2;\n', Binarized);%��������
%fprintf( fid, 'memory_initialization_vector =\n', Binarized );
for i=1:1024%ѭ����ӡ 
    fprintf(fid,'%d',Binarized(i));%һ��һ���������������ֵ��ӡ��ȥ
    if(rem(i,32)==0&&i~=1024)
        fprintf(fid,'\n');%��ӡ����
    elseif(i==1024)
        %fprintf(fid,';');%���һ�еķֺ�
    end
end
fclose(fid);