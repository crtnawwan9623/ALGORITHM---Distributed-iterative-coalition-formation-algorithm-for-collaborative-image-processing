function [Coa_str_new]=spmg(Coa_str_old,obj_d,obj_c,c_old)

Cs_tmp=Coa_str_old;
Cs_tmp(:,obj_d)=0;
Cs_tmp(obj_c,obj_d)=1;
Cs_tmp(all(Cs_tmp==0,2),:)=[];

Coa_str_new=Cs_tmp;
end

% if all(Cs_tmp(c_old,:)) == 0
%     Cn_tmp=Cn_tmp-1;
% end




