% change K, change S and R with Tao
% valid
global R_sys;
global r_it1;
global q;
global K;
global k_it2;
K_value=[3,5,7];
for k_it2=1:3
    K=K_value(k_it2);
    iteration5_int;
    av_dv1_Fkc_dK(k_it2,:)=av_dv1_Fkc;
    av_dv1_rvu_dK(k_it2,:)=av_dv1_rvu;
    av_dv1_pay_dK(k_it2,:)=av_dv1_pay;
    av_dv1_tkc_dK(k_it2,:)=av_dv1_tkc;
    av_dv1_ekc_dK(k_it2,:)=av_dv1_ekc;
    dv1_vlcoa_rate_dK(k_it2,:)=dv1_vlcoa_rate;
    save('iteration5.mat');
end

Tao=Tao_value;

figure
plot(Tao,av_dv1_Fkc_dK(1,:)*3,'r','marker','o','markersize',12,'linewidth',2.0)
hold on
plot(Tao,av_dv1_Fkc_dK(2,:)*5,'b:','marker','d','markersize',12,'linewidth',2.0)
hold on
plot(Tao,av_dv1_Fkc_dK(3,:)*7,'k--','marker','x','markersize',14,'linewidth',2.0)
set(gca,'FontSize',14);
xlim([10,90]);
set(gca,'XTick',[10:10:90]);
xlabel('Futures contract term (unit time)','fontsize',14);
ylabel('Total individual utility of all participants','fontsize',14);
set(gca,'Fontname','times new Roman');
leng1=legend('K=3','K=5','K=7');
set(leng1,'position',[0.197619049215601 0.623809523809524 0.166666665070114 0.202182515060144]);
grid
