function [rvu_sc,pay_sc,tkc_sc,ekc_sc,Fkc_sc]=Sep_coa(c)
% This m-file is used for calculating the revenue, payment, task utility
% and energy cost penalty of devices in a separate coaliton c

% x (vector) solution of resource allocation
% s (matrix) s(k,i) is unit numbers of type-i task of device k
% B (matrix) B(k,l) is transmission rate from device k to l
% v (vector) value factor, v>c_d
% c_d (vector) penalty factor, v>c_d 
% N (vector) N(i) is data size of a unit of type-i task
% T number of task types
% CS number of devices for a coalition
% K number of devices in the whole system
% R (vector) R[k] is unite numbers of resource commited by device k
% Coa_str  Coa_str(c,k)=1 indicates that device k is in coaliton c 
% Beta is number of cycles per unit of cpu resource
% A (vector) A(k) is energy cofficient of device k
% F (vector) F(k) is the cpu frequency of device k
global Beta;
global s_sys;
global B_sys;
global R_sys;
global A_sys;
global F_sys;
global P_sys;
global c_e;
global K;
global T;
global N;
%c=[1 0 1 0 1];
c_lg=(c==1);
s_sc=s_sys(c_lg,:);
B_sc=B_sys(c_lg,c_lg);
R_sc=R_sys(c_lg);
A_sc=A_sys(c_lg);
F_sc=F_sys(c_lg);
P_sc=P_sys(c_lg);
CS=sum(c);
sscsum=sum(s_sc);
c_e_sc=c_e(c_lg);


%start-calculating revenue
pcbnidx_max=0;
for i=1:CS
    pcbnidx_max=pcbnidx_max+2^(i-1);
end

PCrr=zeros(1,pcbnidx_max);
for j=1:pcbnidx_max
 %   j=7;
    index_temp=mydec2bin(CS,j); % j=3 --> 011
    index_temp=fliplr(index_temp); % 011 --> 110
    index_temp_lg=(index_temp==1); % 110 --> 110 (logic)
    [PCrr(j),x]=cal_PCrr(sum(index_temp),s_sc,B_sc(:,index_temp_lg),R_sc(index_temp_lg));
end
[rvu_sc_tmp,spv_temp] = shapleyValue(CS, PCrr);
rvu_sc=zeros(1,K);
rvu_sc(c_lg)=rvu_sc_tmp;
%end-calculating revenue 
%rvu_sc(k) is the revenue of device k in a separate coalition. 
%rvu_sc(k)=0 means device k is not in the coalitoin 

%start-calculating payment
pay_sc=zeros(1,K);
if PCrr(pcbnidx_max) ~= 0
    ukc=zeros(1,CS);
    for k=1:CS
            ukc(k)=sum((x.*s_sc(k,:))./sscsum);
    end

    pay_sc(c_lg)=PCrr(pcbnidx_max)*ukc/sum(ukc);
end
%end-calculating payment
%pay_sc(k) is the revenue of device k in a separate coalition. 
%pay_sc(k)=0 means device k is not in the coalitoin

%start-calculating task utility
tkc_tmp=zeros(1,CS);
for k=1:CS
    tkc_tmp(k)=cal_tkc(x,s_sc,B_sc,k);
end

tkc_sc=zeros(1,K);
tkc_sc(c_lg)=tkc_tmp*3; %*3 for debug
%end-task utility
%tkc(k) is the task utility of device k in a separate coalition. 
%tkc(k)=0 means device k is not in the coalitoin

%start-calculating energy cost

ekc_sc=zeros(1,K);
if PCrr(pcbnidx_max) ~= 0
    ekc_111=A_sc.*F_sc.*F_sc.*R_sc.*Beta;
    for k=1:CS
        B_k=B_sc(k,:);
        minb=min(B_k(find(B_k~=0)));
        ekc_222(k)=(P_sc(k)/minb)*sum(s_sc(k,:).*N);
    end
    ekc_tmp=c_e_sc.*(ekc_111+ekc_222);
    ekc_sc(c_lg)=ekc_tmp;
end
%end-calculating energy cost
%ekc(k) is the energy cost/penalty of device k in a separate coalition
%ekc(k)=0 means device k is not in the coalitoin

% calculating Fan
Fkc_sc=zeros(1,K);
if PCrr(pcbnidx_max) ~= 0
    Fkc_sc=rvu_sc-pay_sc+tkc_sc-ekc_sc;
end

end