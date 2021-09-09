function R_sys_rt=norm_rsc(R,var)
% input is R_sys_unit matrix, which is the expectation of unit resource commitment
% this m-file produces a sampled onsite available resource based on
% R_sys_uni(expectation) and var(variance)
num_dev=length(R);
    for i=1:num_dev
            R_sys_rt(i)=max(0,normrnd(R(i),var));
    end
end
