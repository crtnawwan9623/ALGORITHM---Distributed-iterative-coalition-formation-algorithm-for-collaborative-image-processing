% clear;
% clc;
% global K;
% 
% K=20;
% constr10;

% s_sys=s_sys(1:K,:);
% R_sys=R_sys(1:K);
% B_sys=B_sys(1:K,1:K);

% K=10;
% s_sys=s_sys(11:20,:);
% R_sys=R_sys(11:20);
% B_sys=B_sys(11:20,11:20);

K=15;
% s_sys=s_sys(6:20,:);
% R_sys=R_sys(6:20);
% B_sys=B_sys(6:20,6:20);


i_Rt1=0;
delta=0;
r=0;
m_bar=0;
gama=0.9;
e=5;
delta_max=0;
m_record=[];
r_record=[];
m_bar_record=[];
delta_record=[];

while (i_Rt1<K*K) || (i_Rt1>=K*K && delta>abs(m_bar)*0.01 && i_Rt1<2^(K-1)) %delta>e
    PreNum=randi(K)-1;
    i_Rt1=i_Rt1+1;
    if PreNum==0
        m=0;
    else
        sample_group=[];
        sample_group_k=[];
        sample_group=sort(randperm(K-1,PreNum));
        sample_group_k=[sample_group,K];

        x1=optx(s_sys,R_sys(sample_group));
        PCrr1=PCr(x1,s_sys,B_sys(:,sample_group));
        if isnan(PCrr1)
            PCrr1=0;
        end

        x2=optx(s_sys,R_sys(sample_group_k));
        PCrr2=PCr(x2,s_sys,B_sys(:,sample_group_k));
        if isnan(PCrr2)
            PCrr2=0;
        end

        m=PCrr2-PCrr1;
    end

    r_old=r;
    mar_bar_old=m_bar;

    r=r+m;
    m_bar=r/i_Rt1;
    delta=gama*delta+(1-gama)*abs(m_bar-mar_bar_old);

    if delta>delta_max
        delta_max=delta;
    end

    m_record(i_Rt1)=m;
    r_record(i_Rt1)=r;
    m_bar_record(i_Rt1)=m_bar;
    delta_record(i_Rt1)=delta;
end

i_Rt1
delta_norm=delta_record./abs(m_bar_record);
%delta_norm=delta_record./delta_max;