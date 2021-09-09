% change K and S
% valid
global R_sys;
global r_it1;
global q;
global K;
global k_it2;
K_value=[3,5,7];
%for k_it2=4:length(K_value)
for k_it2=2:2
    K=K_value(k_it2);
    iteration3_1_int;
    av_dv1_Fkc_dK(k_it2,:)=av_dv1_Fkc;
    av_dv1_rvu_dK(k_it2,:)=av_dv1_rvu;
    av_dv1_pay_dK(k_it2,:)=av_dv1_pay;
    av_dv1_tkc_dK(k_it2,:)=av_dv1_tkc;
    av_dv1_ekc_dK(k_it2,:)=av_dv1_ekc;
    dv1_vlcoa_rate_dK(k_it2,:)=dv1_vlcoa_rate;
    save('iteration3_1.mat');
end

%  begin-remove all-zero only needs to be applied to K=7(to beautify the curve)
    av_dv1_rvu=mean(removezerorow(dv1_rvu(1:960,:,3)));
    av_dv1_pay=mean(removezerorow(dv1_pay(1:960,:,3)));
    av_dv1_tkc=mean(removezerorow(dv1_tkc(1:960,:,3)));
    av_dv1_ekc=mean(removezerorow(dv1_ekc(1:960,:,3)));
    av_dv1_Fkc=mean(removezerorow(dv1_Fkc(1:960,:,3)));
    dv1_vlcoa_rate=mean(removezerorow(dv1_vlnum(1:960,:,3)));
    
    av_dv1_Fkc_dK(3,:)=av_dv1_Fkc;
    av_dv1_rvu_dK(3,:)=av_dv1_rvu;
    av_dv1_pay_dK(3,:)=av_dv1_pay;
    av_dv1_tkc_dK(3,:)=av_dv1_tkc;
    av_dv1_ekc_dK(3,:)=av_dv1_ekc;
    dv1_vlcoa_rate_dK(3,:)=dv1_vlcoa_rate;
% end-remove all-zero only needs to be applied to K=7
    
Ss=30:30:length(S_value)*30;
plot(Ss,av_dv1_Fkc_dK(2,:),'r','marker','o','markersize',10,'linewidth',2.0)
hold on
plot(Ss,av_dv1_rvu_dK(2,:),'b','marker','d','markersize',10,'linewidth',1.0)
hold on
plot(Ss,av_dv1_pay_dK(2,:),'k','marker','s','markersize',10,'linewidth',1.0)
hold on
plot(Ss,av_dv1_tkc_dK(2,:),'marker','x','markersize',10,'linewidth',1.0)
hold on
plot(Ss,av_dv1_ekc_dK(2,:),'marker','*','markersize',10,'linewidth',1.0)
set(gca,'FontSize',14);
xlim([30,270]);
set(gca,'XTick',[30:30:270]); 
xlabel('Total task requests (Units)','fontsize',14);
ylabel('Average individual utility and details','fontsize',14);
set(gca,'Fontname','times new Roman');
leng1=legend('Individual utility','Revenue','Payment','Task utility','Energy cost');
set(leng1,'position',[0.446726195026367 0.278373022259228 0.294642851075956 0.252380945285161]);
grid;

figure
plot(Ss,av_dv1_Fkc_dK(1,:),'r','marker','o','markersize',10,'linewidth',1.0)
hold on
plot(Ss,av_dv1_Fkc_dK(2,:),'b','marker','d','markersize',10,'linewidth',1.0)
hold on
plot(Ss,av_dv1_Fkc_dK(3,:),'k','marker','s','markersize',10,'linewidth',1.0)
% hold on
% plot(Ss,av_dv1_Fkc_dK(4,:),'y','marker','+','markersize',10,'linewidth',1.0)
set(gca,'FontSize',14);
xlim([30,270]);
set(gca,'XTick',[30:30:270]); 
xlabel('Total task requests (Units)','fontsize',14);
ylabel('Average individual utility','fontsize',14);
set(gca,'Fontname','times new Roman');
leng1=legend('K=3','K=5','K=7');
set(leng1,'position',[0.708333334929886 0.740872994798516 0.144642855546304 0.105952378114064]);
grid


figure
plot(Ss,dv1_vlcoa_rate_dK(1,:),'r','marker','o','markersize',10,'linewidth',1.0)
hold on
plot(Ss,dv1_vlcoa_rate_dK(2,:),'b','marker','d','markersize',10,'linewidth',1.0)
hold on
plot(Ss,dv1_vlcoa_rate_dK(3,:),'k','marker','s','markersize',10,'linewidth',1.0)
% hold on
% plot(Ss,dv1_vlcoa_rate_dK(4,:),'y','marker','+','markersize',10,'linewidth',1.0)
set(gca,'FontSize',14);
xlim([30,270]);
set(gca,'XTick',[30:30:270]); 
xlabel('Total task requests (Units)','fontsize',14);
ylabel('Ratio of joining in a coalition','fontsize',14);
set(gca,'Fontname','times new Roman');
leng1=legend('K=3','K=5','K=7');
set(leng1,'position',[0.708333334929886 0.740872994798516 0.144642855546304 0.105952378114064]);
grid;