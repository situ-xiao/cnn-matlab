function output=signedhex_2_signeddec(input)
%�ú�����������з���16���ƾ�����ת��Ϊ10�����з��ž���
for i =1:length(input)

input_hex = input(i);
input_bin = dec2bin(hex2dec(input_hex),8);%
my_code = input_bin;
nbit = length(input_bin);
if my_code(1) == '0' % ��һ��������
    out_dec(i) = bin2dec(my_code);
else
    tmp = my_code(2:nbit);
    pos0 = find(tmp == '0');% find position 0
    pos1 = find(tmp == '1');
    my_code(pos0+1) = '1';
    my_code(pos1+1) = '0'; % ȡ��

    d = bin2dec( my_code(2:nbit) ) + 1; % +1
    
    d = dec2bin(d,nbit); % absolute value(dec)
    d = d(2:nbit); % base code(without mark )
    out_dec(i) = -bin2dec(d);
end
end
output=out_dec.';