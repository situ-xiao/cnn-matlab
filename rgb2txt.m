clear;
clc;
close all;


RGB = imread("C:\Users\96348\Desktop\1234.png"); %��ȡͼ��
R=RGB(:,:,1);
G=RGB(:,:,2);
B=RGB(:,:,3);
% A=RGB;
% A(:,:,3)=R;
% A(:,:,1)=G;
% A(:,:,2)=B;
R=R.';
G=G.';
B=B.';
R=reshape(R,640*480,1);
G=reshape(G,640*480,1);
B=reshape(B,640*480,1);
R=dec2hex(R);
G=dec2hex(G);
B=dec2hex(B);
%R=uint8(R)
% A=zeros(76800,1)
% for j=1:76800
%     A(j,1)=dec2hex(R(j,1));
% 
% end
fid = fopen ("D:\ISP\R.coe",'w');
fprintf( fid, 'memory_initialization_radix=16;\n', R);%��������
fprintf( fid, 'memory_initialization_vector =\n', R );
for i=1:640*480%ѭ����ӡ 
    fprintf(fid,'%s',R(i,:));%һ��һ���������������ֵ��ӡ��ȥ
    if(i<640*480)
        fprintf(fid,',\n');%
    
    else 
        fprintf(fid,';');%���һ�еķֺ�
    end
end
fclose(fid);
fid = fopen ("D:\ISP\G.coe",'w');
fprintf( fid, 'memory_initialization_radix=16;\n', G);%��������
fprintf( fid, 'memory_initialization_vector =\n', G );
for i=1:640*480%ѭ����ӡ 
    fprintf(fid,'%s',G(i,:));%һ��һ���������������ֵ��ӡ��ȥ
   if(i<640*480)
        fprintf(fid,',\n');%
    
    else 
        fprintf(fid,';');%���һ�еķֺ�
    end
end
fclose(fid);
fid = fopen ("D:\ISP\B.coe",'w');
fprintf( fid, 'memory_initialization_radix=16;\n', B);%��������
fprintf( fid, 'memory_initialization_vector =\n', B );
for i=1:640*480%
    fprintf(fid,'%s',B(i,:));%
    if(i<640*480)
        fprintf(fid,',\n');%
    
    else 
        fprintf(fid,';');%���һ�еķֺ�
    end
end
fclose(fid);