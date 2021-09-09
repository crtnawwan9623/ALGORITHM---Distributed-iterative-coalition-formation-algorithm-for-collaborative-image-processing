function [x]=optx(s_scr,R_scr)

global v;
global T;
global D;

ssum=sum(s_scr);
Rsum=sum(R_scr);
cvx_begin quiet
    variables x(T);
    Objective = 0;
    for i = 1:T
     Objective = Objective + (-v(i))*log(1+x(i)/ssum(i))*ssum(i);
    end
    minimize(Objective);
    subject to
        sum(x) == Rsum;
        for i = 1:T
        x(i) >= D(i)*ssum(i);
        end
cvx_end
x=x';
end