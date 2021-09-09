% change S and V
% valid
global R_sys;
global r_it1;
global q;
global K;
global v;
global k_it2;
V_value=[1,2,3];
%for k_it2=4:length(K_value)
for k_it2=1:1
    v=[1,2,3]*V_value(k_it2);
    iteration7_1_int;
    av_dv1_Fkc_dK(k_it2,:)=av_dv1_Fkc;
    av_dv1_rvu_dK(k_it2,:)=av_dv1_rvu;
    av_dv1_pay_dK(k_it2,:)=av_dv1_pay;
    av_dv1_tkc_dK(k_it2,:)=av_dv1_tkc;
    av_dv1_ekc_dK(k_it2,:)=av_dv1_ekc;
    dv1_vlcoa_rate_dK(k_it2,:)=dv1_vlcoa_rate;
    save('iteration7_1.mat');
end

Ss=30:30:length(S_value)*30;

figure
plot(Ss,av_dv1_Fkc_dK(1,:),'r','marker','o','markersize',12,'linewidth',2)
hold on
plot(Ss,av_dv1_Fkc_dK(2,:),'b:','marker','d','markersize',12,'linewidth',2)
hold on
plot(Ss,av_dv1_Fkc_dK(3,:),'k--','marker','x','markersize',14,'linewidth',2)
set(gca,'FontSize',14);
xlim([30,270]);
set(gca,'XTick',[30:30:270]); 
xlabel('Total task request (Units)','fontsize',14);
ylabel('Average individual utility','fontsize',14);
set(gca,'Fontname','times new Roman');
leng1=legend('Task value=${{V}_{0}}$','Task value=$2{{V}_{0}}$','Task value=$3{{V}_{0}}$');
set(leng1,'position',[0.571614319609813 0.714285714285714 0.310528537533044 0.185714285714286]);
set(leng1,'Interpreter','latex')
grid


figure
plot(Ss,dv1_vlcoa_rate_dK(1,:),'r','marker','o','markersize',12,'linewidth',2)
hold on
plot(Ss,dv1_vlcoa_rate_dK(2,:),'b:','marker','d','markersize',12,'linewidth',2)
hold on
plot(Ss,dv1_vlcoa_rate_dK(3,:),'k--','marker','x','markersize',14,'linewidth',2)
set(gca,'FontSize',14);
xlim([30,270]);
set(gca,'XTick',[30:30:270]); 
xlabel('Total task request (Units)','fontsize',14);
ylabel('Ratio of joining a coalition','fontsize',14);
set(gca,'Fontname','times new Roman');
leng1=legend('Task value=${{V}_{0}}$','Task value=$2{{V}_{0}}$','Task value=$3{{V}_{0}}$');
set(leng1,'position',[0.571614319609813 0.714285714285714 0.310528537533044 0.185714285714286]);
set(leng1,'Interpreter','latex')
grid;