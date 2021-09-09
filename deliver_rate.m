% used for main6, to calculate deliver rate
% calculate the average resource for per unit of task-i type, and sample 
% unit resource commitment and task requests throughout the contract term
% to see if actual available resource could meet the whole task requests

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

global T;
global s_sys_uni;
global r_it1;
global R_sys_uni;
global del_rt;
global vr;

if sum(Coa_str(z,:))>=2
    clg_tmp=(Coa_str(z,:)==1);
    for i_dr=1:T   % calculate teh resource per task depending on the result of resource allocation (value of x)
       rsc_per_tsk(i_dr)=x_sc(i_dr)/(Tao_value(r_it1)*sum(s_sys_uni(clg_tmp,i_dr)));
    end
    
    for j_dr=1:Tao_value(r_it1)  %onsite sample for each unit over the contract term
        s_sys_rt=norm_tsk(s_sys_uni,vr);     %sample onsite task request
        R_sys_rt=norm_rsc(R_sys_uni,vr);     %sample onsite available resource 
        
        total_rsc_req=0; %resource actually needed in a unit
        for i_dr=1:T
            total_rsc_req=total_rsc_req+rsc_per_tsk(i_dr)*sum(s_sys_rt(clg_tmp,i_dr));
        end
        total_rsc_act=sum(R_sys_rt(clg_tmp)); %resource actually available in a unit
        del_rt=[del_rt,min(total_rsc_act/total_rsc_req,1)]; %deliver rate
    end
end





