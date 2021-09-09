function [vsc_size,vcs_num,av_vsc_size]=CoaSta(Cs)
% this m-file is used to calculate valid coalition numbers in a coalition
% strucutre Cs, and average coaliton size of valid coalitions(valid means at least 2 devices)
% vsc_size: total number of devices involved in valid coalition
% vcs_num: number of valid coalition 
% av_vsc_size: average size of valid coalition
vcs_num=0;
vsc_size=0;
for z=1:size(Cs,1)
    if sum(Cs(z,:))>1
        vcs_num=vcs_num+1;
        vsc_size=vsc_size+sum(Cs(z,:));
    end
end
if vcs_num ~= 0
    av_vsc_size=vsc_size/vcs_num;
else
    av_vsc_size=0;
end


end