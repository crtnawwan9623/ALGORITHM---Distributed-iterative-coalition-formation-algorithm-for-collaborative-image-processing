% change R;
% suspended
global R_sys;
global r_it1;
global q;
R_value=[10,20,30,40,50,60,70,80,90];
%R_value=[10,20];
for r_it1=1:length(R_value)
    for q=1:30
        constr2;
        R_sys(1)=R_value(r_it1);
        main2;
        dv1_rvu(q)=rvu_sys(1);
        dv1_pay(q)=pay_sys(1);
        dv1_tkc(q)=tkc_sys(1);
        dv1_ekc(q)=ekc_sys(1);
        dv1_Fkc(q)=Fkc_sys(1);
        dv1_coa=Coa_str((Coa_str(:,1)==1),:);
        if sum(dv1_coa)>1
            dv1_vlnum(q)=1;
        else
            dv1_vlnum(q)=0;
        end
    end
    av_dv1_rvu(r_it1)=mean(dv1_rvu);
    av_dv1_pay(r_it1)=mean(dv1_pay);
    av_dv1_tkc(r_it1)=mean(dv1_tkc);
    av_dv1_ekc(r_it1)=mean(dv1_ekc);
    av_dv1_Fkc(r_it1)=mean(dv1_Fkc);
    dv1_vlcoa_rate(r_it1)=mean(dv1_vlnum);
    save('iteration2.mat');
end

Rr=1:length(R_value);
plot(Rr,av_dv1_Fkc,'-x')
hold on
plot(Rr,av_dv1_rvu,'-*')
hold on
plot(Rr,av_dv1_pay,'-.')
hold on
plot(Rr,dv1_vlcoa_rate)





