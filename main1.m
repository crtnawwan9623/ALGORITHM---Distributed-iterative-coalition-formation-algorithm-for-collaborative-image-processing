%this m-file is for iteration1.m

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
global K_sys;
global F_sys;
global P_sys;
global c_e;
global q_stuck;
global Limit_coa_size;
global Ini_coa_size;
% monitor variable:
global k_it1;
global q;

tic;
%Coa_str=diag(ones(1,K));%comment_for_revision
Ini_constr;%new_for_revision

Coa_num=size(Coa_str,1);
Cont=1;
myisequal_ini(Coa_str);
while Cont == 1 && Coa_num > 1
    Cont=0;
    for k=1:K
        Coa_num=size(Coa_str,1);
        Fkc_sd_tmp=zeros(Coa_num,K);
        for z=1:Coa_num
            c=Coa_str(z,:);
            if c(k)==1 || sum(c) < Limit_coa_size %new_for_revision
                c(k)=1;
                [rvu_sc,pay_sc,tkc_sc,ekc_sc,Fkc_sc]=Sep_coa(c);
                Fkc_sd_tmp(z,:)=Fkc_sc;
                if Coa_str(z,k)==1
                    Fkc_sd_cur=Fkc_sc(k);
                    cur_c=z;
                end
            end %new_for_revision
        end
        [maxv,maxi]=max(Fkc_sd_tmp(:,k));

        if maxv > Fkc_sd_cur && maxv > 0 && all(Fkc_sd_tmp (maxi,:)>=0)
            [Coa_str]=spmg(Coa_str,k,maxi,cur_c);
             Cont=1;
         else if Fkc_sd_cur < 0 || (Fkc_sd_cur == 0 && sum(Coa_str(cur_c,:))>1)
             [Coa_str]=spmgzero(Coa_str,k);
             Cont=1;
             end
        end
        k
        Coa_str
        Cont
        k_it1
        q
        time_elps=toc
    end
    Coa_num=size(Coa_str,1);
    if myisequal(Coa_str)
        Cont=0;
    else
        Coa_str_old=Coa_str;
    end
    display('one round finished.')
    t1=toc;
    if t1> 1200 && Cont == 1 && Coa_num > 1 % more than 30min=1800s, main1 has stuck;600 for K_value=9,15 
        %q_stuck=1;
        q_stuck=0; %directly accept after 600s 
        break;
    end
end
if q_stuck == 0
    % finally calculate the revenue, payment, task utility and energy cost of
    % each device in the system:
    Coa_num=size(Coa_str,1);
    rvu_sys=zeros(1,K);
    pay_sys=zeros(1,K);
    tkc_sys=zeros(1,K);
    ekc_sys=zeros(1,K);
    Fkc_sys=zeros(1,K);
    for z=1:Coa_num
        [rvu_sc,pay_sc,tkc_sc,ekc_sc,Fkc_sc]=Sep_coa(Coa_str(z,:));
        clg_tmp=(Coa_str(z,:)==1)
        rvu_sys(clg_tmp)=rvu_sc(clg_tmp);
        pay_sys(clg_tmp)=pay_sc(clg_tmp);
        tkc_sys(clg_tmp)=tkc_sc(clg_tmp);
        ekc_sys(clg_tmp)=ekc_sc(clg_tmp);
        Fkc_sys(clg_tmp)=Fkc_sc(clg_tmp);
    end
end
