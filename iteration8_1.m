% change R and V
% valid
global R_sys;
global r_it1;
global q;
global K;
global k_it2;
global v;
V_value=[1,2,3];
R_value=[10,30,50,70,90,110,130,150,170];
for k_it2=2:2
    v=[1,2,3]*V_value(k_it2);
    iteration8_1_int;
    av_dv1_Fkc_dK(k_it2,:)=av_dv1_Fkc;
    av_dv1_rvu_dK(k_it2,:)=av_dv1_rvu;
    av_dv1_pay_dK(k_it2,:)=av_dv1_pay;
    av_dv1_tkc_dK(k_it2,:)=av_dv1_tkc;
    av_dv1_ekc_dK(k_it2,:)=av_dv1_ekc;
    dv1_vlcoa_rate_dK(k_it2,:)=dv1_vlcoa_rate;
    save('iteration8_1.mat');
end


Rr=10:20:170;
figure
plot(Rr,av_dv1_Fkc_dK(1,:),'r','marker','o','markersize',12,'linewidth',2)
hold on
plot(Rr,av_dv1_Fkc_dK(2,:),'b:','marker','d','markersize',12,'linewidth',2)
hold on
plot(Rr,av_dv1_Fkc_dK(3,:),'k--','marker','x','markersize',14,'linewidth',2)
set(gca,'FontSize',14);
xlim([10,170]);
set(gca,'XTick',[10:20:170]); 
xlabel('Total resource commitment (Units)','fontsize',14);
ylabel('Average individual utility','fontsize',14);
set(gca,'Fontname','times new Roman');
leng1=legend('Task value=${{V}_{0}}$','Task value=$2{{V}_{0}}$','Task value=$3{{V}_{0}}$');
set(leng1,'position',[0.172898534854438 0.652380952380953 0.312815750859847 0.221801567226175]);
set(leng1,'Interpreter','latex');
grid

figure
plot(Rr,dv1_vlcoa_rate_dK(1,:),'r','marker','o','markersize',12,'linewidth',2)
hold on
plot(Rr,dv1_vlcoa_rate_dK(2,:),'b:','marker','d','markersize',12,'linewidth',2)
hold on
plot(Rr,dv1_vlcoa_rate_dK(3,:),'k--','marker','x','markersize',14,'linewidth',2)
set(gca,'FontSize',14);
xlim([10,170]);
set(gca,'XTick',[10:20:170]);  
xlabel('Total resource commitment (Units)','fontsize',14);
ylabel('Ratio of joining in a coalition','fontsize',14);
set(gca,'Fontname','times new Roman');
leng1=legend('Task value=${{V}_{0}}$','Task value=$2{{V}_{0}}$','Task value=$3{{V}_{0}}$');
set(leng1,'position',[0.172898534854438 0.652380952380953 0.312815750859847 0.221801567226175]);
set(leng1,'Interpreter','latex');
grid



