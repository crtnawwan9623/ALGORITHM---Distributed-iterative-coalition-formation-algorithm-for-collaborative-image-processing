function [PCrr_fm]=PCr(x,s,B)
% x (vector) solution of resource allocation
% s (matrix) s(k,i) is unit numbers of type-i task of device k
% B (matrix) B(k,l) is transmission rate from device k to l
% v (vector) value factor, v>c_d
% c_d (vector) penalty factor, v>c_d 
% N (vector) N(i) is data size of a unit of type-i task
% T number of task types
% CS number of devices in a specific coalitoin
global v;
global c_d;
global N;
global T;
CS=size(s,1);

P111_A=0;
for i=1:T
    P111_A=P111_A+v(i)*log(1+x(i)/sum(s(:,i)))*sum(s(:,i));
end
P111_B=0;
for i=1:T
    temp=0;
    for k=1:CS
        B_k=B(k,:);
        minb=min(B_k(find(B_k~=0)));
        temp=temp+s(k,i)*N(i)/minb;
    end
    temp=temp*c_d(i);
    P111_B=P111_B+temp;
end
PCrr_fm=P111_A-P111_B;
end