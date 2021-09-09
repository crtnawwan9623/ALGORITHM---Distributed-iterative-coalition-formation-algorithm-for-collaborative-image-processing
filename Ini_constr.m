global Ini_coa_size;
global K;
if Ini_coa_size==1
Coa_str=diag(ones(1,K));
else
    perm=randperm(K);
    Ini_coa_num=ceil(K/Ini_coa_size);
    Coa_str=zeros(Ini_coa_num,K);
    for i_IC=1:Ini_coa_num
        if i_IC<Ini_coa_num
        Coa_str(i_IC,perm((i_IC-1)*Ini_coa_size+1:i_IC*Ini_coa_size))=1;
        else
        Coa_str(i_IC,perm((i_IC-1)*Ini_coa_size+1:end))=1;   
        end
    end
end