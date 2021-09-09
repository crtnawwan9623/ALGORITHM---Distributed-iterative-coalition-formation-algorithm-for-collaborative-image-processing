function [Coa_str_new]=spmgzero(Coa_str_old,obj_d)

global K;
Cs_tmp=Coa_str_old;
Cs_tmp(:,obj_d)=0;
v_tmp=zeros(1,K);
v_tmp(obj_d)=1;
Cs_tmp=[Cs_tmp;v_tmp];
Coa_str_new=Cs_tmp;
end