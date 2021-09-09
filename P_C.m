% P(C)

% x=[1e11,8e11,5e12];
% s=[10e6,20e6,30e6;40e6,50e6,60e6;70e6,80e6,90e6];
% b=[0 1e7 2e7;3e7 0 4e7;5e7 6e7 0];

global v;
global c_d;
global N;
global T;
global K;

x=[10,20,30];
s=[10,20,30;40,50,60;70,80,90];
B=[0 1e7 2e7;3e7 0 4e7;5e7 6e7 0];
v=[1,1,1];
c_d=[1 1 1];
N=[1e6,2e6,3e6];
T=3;
D=3;

P111_A=0;
for i=1:T
    P111_A=P111_A+v(i)*log(1+x(i)/sum(s(:,i)))*sum(s(:,i))
end

P111_B=0;
for i=1:T
    temp=0;
    for k=1:D
        B_k=B(k,:);
        minb=min(B_k(find(B_k~=0)));
        temp=temp+s(k,i)*N(i)/minb;
    end
    temp=temp*c_d(i);
    P111_B=P111_B+temp
end

PC=P111_A-P111_B


