% change R
% valid
global R_sys;
global r_it1;
global q;
R_value=[10,20,30,40,50,60,70,80,90];
%R_value=[10,20];

for q=27:30
    constr2;
    for r_it1=1:length(R_value)
        R_sys(1)=R_value(r_it1);
        main2;
        dv1_rvu(q,r_it1)=rvu_sys(1);
        dv1_pay(q,r_it1)=pay_sys(1);
        dv1_tkc(q,r_it1)=tkc_sys(1);
        dv1_ekc(q,r_it1)=ekc_sys(1);
        dv1_Fkc(q,r_it1)=Fkc_sys(1);
        dv1_coa=Coa_str((Coa_str(:,1)==1),:);
        if sum(dv1_coa)>1
            dv1_vlnum(q,r_it1)=1;
        else
            dv1_vlnum(q,r_it1)=0;
        end
    end
    av_dv1_rvu=mean(dv1_rvu);
    av_dv1_pay=mean(dv1_pay);
    av_dv1_tkc=mean(dv1_tkc);
    av_dv1_ekc=mean(dv1_ekc);
    av_dv1_Fkc=mean(dv1_Fkc);
    dv1_vlcoa_rate=mean(dv1_vlnum);
    save('iteration2_1.mat');
end

Rr=10:10:length(R_value)*10;
plot(Rr,av_dv1_Fkc,'r','marker','o','markersize',10,'linewidth',2.0)
hold on
plot(Rr,av_dv1_rvu,'b','marker','d','markersize',10,'linewidth',1.0)
hold on
plot(Rr,av_dv1_pay,'k','marker','s','markersize',10,'linewidth',1.0)
hold on
plot(Rr,av_dv1_tkc,'marker','x','markersize',10,'linewidth',1.0)
hold on
plot(Rr,av_dv1_ekc,'marker','*','markersize',10,'linewidth',1.0)

set(gca,'FontSize',14);
%axis([0.0 0.9,-inf,inf]);
xlabel('Committed resource (Units)','fontsize',14);
ylabel('Average individual utility and details','fontsize',14);
set(gca,'Fontname','times new Roman');
leng1=legend('Individual utility','Revenue','Payment','Task utility','Energy cost');
set(leng1,'position',[0.167261908912943 0.664682545359172 0.267857137588518 0.203571422894796]);
grid;

figure

plot(Rr,dv1_vlcoa_rate,'marker','.','markersize',20,'linewidth',1.0)
set(gca,'FontSize',14);
%axis([0.0 0.9,-inf,inf]);
xlabel('Committed resource (Units)','fontsize',14);
ylabel('Ratio of joining in a coalition','fontsize',14);
set(gca,'Fontname','times new Roman');
grid;
