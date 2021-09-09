function s_sys_rt=norm_tsk(s,var)
% input is s_sys_unit matrix, which is the expectation of unit task requests 
% this m-file produces a sampled onsite task requests based on s_sys_uni
% (expectation) and var(variance)
[num_dev,num_tsktp]=size(s);
    for i=1:num_dev
        for j=1:num_tsktp
            s_sys_rt(i,j)=max(0,normrnd(s(i,j),var));
        end
    end
end