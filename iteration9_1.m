% change R and V
% valid
global R_sys;
global r_it1;
global q;
global K;
global k_it2;
global Ce_value;
Ce_value=[5,15,45]*1e-4;
for k_it2=1:3
    iteration9_1_int;
    av_dv1_Fkc_dK(k_it2,:)=av_dv1_Fkc;
    av_dv1_rvu_dK(k_it2,:)=av_dv1_rvu;
    av_dv1_pay_dK(k_it2,:)=av_dv1_pay;
    av_dv1_tkc_dK(k_it2,:)=av_dv1_tkc;
    av_dv1_ekc_dK(k_it2,:)=av_dv1_ekc;
    dv1_vlcoa_rate_dK(k_it2,:)=dv1_vlcoa_rate;
    save('iteration9_1.mat');
end


Rr=30:20:210;
figure
plot(Rr,av_dv1_Fkc_dK(1,:),'r','marker','o','markersize',12,'linewidth',2)
hold on
plot(Rr,av_dv1_Fkc_dK(2,:),'b:','marker','d','markersize',12,'linewidth',2)
hold on
plot(Rr,av_dv1_Fkc_dK(3,:),'k--','marker','x','markersize',14,'linewidth',2)
set(gca,'FontSize',14);
xlim([30,210]);
set(gca,'XTick',[30:20:210]); 
xlabel('Total resource commitment (Units)','fontsize',14);
ylabel('Average individual utility','fontsize',14);
set(gca,'Fontname','times new Roman');
leng1=legend('Resource value=${{C}_{e}}$','Resource value=$3{{C}_{e}}$','Resource value=$9{{C}_{e}}$');
set(leng1,'position',[0.149827988422821 0.7 0.371958342764172 0.185714285714286]);
set(leng1,'Interpreter','latex');
grid

figure
plot(Rr,dv1_vlcoa_rate_dK(1,:),'r','marker','o','markersize',12,'linewidth',2)
hold on
plot(Rr,dv1_vlcoa_rate_dK(2,:),'b:','marker','d','markersize',12,'linewidth',2)
hold on
plot(Rr,dv1_vlcoa_rate_dK(3,:),'k--','marker','x','markersize',14,'linewidth',2)
set(gca,'FontSize',14);
xlim([30,210]);
set(gca,'XTick',[30:20:210]);  
xlabel('Total resource commitment (Units)','fontsize',14);
ylabel('Ratio of joining in a coalition','fontsize',14);
set(gca,'Fontname','times new Roman');
leng1=legend('Resource value=${{C}_{e}}$','Resource value=$3{{C}_{e}}$','Resource value=$9{{C}_{e}}$');
set(leng1,'position',[0.149827988422821 0.7 0.371958342764172 0.185714285714286]);
set(leng1,'Interpreter','latex');
grid



