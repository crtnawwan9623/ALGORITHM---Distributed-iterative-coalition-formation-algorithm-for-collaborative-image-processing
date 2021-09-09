function [tkc]=cal_tkc(x,s,B,k)
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

if x == zeros(1,T)
    tkc=0;
else
    T111_A=0;
    for i=1:T
        T111_A=T111_A+v(i)*log(1+x(i)/sum(s(:,i)))*s(k,i);
    end
    T111_B=0;
    for i=1:T
            B_k=B(k,:);
            minb=min(B_k(find(B_k~=0)));
            temp=c_d(i)*s(k,i)*N(i)/minb;
            T111_B=T111_B+temp;
    end
    tkc=T111_A-T111_B;
end

end