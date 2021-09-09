% This m-file contruct the strucutre of whole system with the
% predertermined K, used for iteration1.m

% x (vector) solution of resource allocation
% s (matrix) s(k,i) is unit numbers of type-i task of device k
% B (matrix) B(k,l) is transmission rate from device k to l
% v (vector) value factor, v>c_d
% c_d (vector) penalty factor, v>c_d 
% N (vector) N(i) is data size of a unit of type-i task
% T number of task types
% D (vector) D(i) is the minimum resource for a unit of type-i task
% CS number of devices for a coalition
% K number of devices in the whole system
% R (vector) R[k] is unite numbers of resource commited by device k
% Coa_str (matrix) Coa_str(c,k)=1 indicates that device k is in coaliton c 
% Beta is number of cycles per unit of cpu resource
% A (vector) A(k) is energy cofficient of device k
% F (vector) F(k) is the cpu frequency of device k
% c_e (vector) penalty factor for power consumption base :0.002
global v;
global c_d;
global N;
global T;
global K;
global D;
global Beta;
global s_sys;
global B_sys;
global R_sys;
global A_sys;
global F_sys;
global P_sys;
global c_e;

%K=6;
T=3;
s_sys=randi(10,K,T)*10;
B_sys=randi(10,K).*1e7/2; %/2 is added for modulate
for i=1:K
    sys_B(i,i)=0;
end
v=randi(5,1,T)+5;
c_d=randi(5,1,T)*2; % *2 is added for modulate 
N=randi(3,1,T)*1e6;
c_e=randi(5,1,K)/5*0.002*1; %*1 is added for modulate

R_sys=randi(10,1,K)*10;
Coa_str=zeros(K,K);
A_sys=5e-27*randi(10,1,K)/10;
F_sys=3e9*randi(4,1,K)/4;
P_sys=ones(1,K);
Beta=6e10;


D=zeros(1,T);
for i=1:T
    D(i)=0.2*sum(R_sys)/T/sum(s_sys(:,i)); %original 0.5
end






