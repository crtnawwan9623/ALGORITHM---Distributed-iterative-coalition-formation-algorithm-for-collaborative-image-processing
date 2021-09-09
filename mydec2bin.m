function num_bin=mydec2bin(leng,num_dec)
%change decimal value to binary value with required length
% num_dec: input decimal value
% leng: required length of output binary
% num_bin: output binary

num=num_dec;
str = dec2bin(num);
for i=1:length(str)
    num(i)=str2num(str(i));
end

num_bin=zeros(1,leng);
lgofnum=length(num);
num_bin(leng-lgofnum+1:leng)=num;

end