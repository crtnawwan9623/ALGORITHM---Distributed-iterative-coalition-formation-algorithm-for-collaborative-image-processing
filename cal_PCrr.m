function [PCrr,x]=cal_PCrr(numofrs,s_scr,B_scr,R_scr)
global T;
global D;
    if numofrs == 1 || numofrs == 0
        PCrr=0;
        x=zeros(1,T);
    else
        Tmin=0;
        for i=1:T
            Tmin=Tmin+D(i)*sum(s_scr(:,i));
        end
        if sum(R_scr)< Tmin
            PCrr=0;
            x=zeros(1,T);
        else
            x=optx(s_scr,R_scr);
            PCrr=PCr(x,s_scr,B_scr);
        end
        
    end
    
end