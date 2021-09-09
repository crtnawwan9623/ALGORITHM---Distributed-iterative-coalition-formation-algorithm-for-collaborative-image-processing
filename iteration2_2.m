% change R and K
% valid
global R_sys;
global r_it1;
global q;
global K;
global k_it2;
K_value=[3,5,7,9];
%for k_it2=4:length(K_value)
for k_it2=3:3
    K=K_value(k_it2);
    iteration2_2_int;
    av_dv1_Fkc_dK(k_it2,:)=av_dv1_Fkc;
    av_dv1_rvu_dK(k_it2,:)=av_dv1_rvu;
    av_dv1_pay_dK(k_it2,:)=av_dv1_pay;
    av_dv1_tkc_dK(k_it2,:)=av_dv1_tkc;
    av_dv1_ekc_dK(k_it2,:)=av_dv1_ekc;
    dv1_vlcoa_rate_dK(k_it2,:)=dv1_vlcoa_rate;
    save('iteration2_2.mat');
end

%  begin-remove all-zero row only needs to be applied to K=7(to beautify the curve)
    av_dv1_rvu=mean(removezerorow(dv1_rvu(1:400,:,3)));
    av_dv1_pay=mean(removezerorow(dv1_pay(1:400,:,3)));
    av_dv1_tkc=mean(removezerorow(dv1_tkc(1:400,:,3)));
    av_dv1_ekc=mean(removezerorow(dv1_ekc(1:400,:,3)));
    av_dv1_Fkc=mean(removezerorow(dv1_Fkc(1:400,:,3)));
    dv1_vlcoa_rate=mean(removezerorow(dv1_vlnum(1:400,:,3)));
    
    av_dv1_Fkc_dK(3,:)=av_dv1_Fkc;
    av_dv1_rvu_dK(3,:)=av_dv1_rvu;
    av_dv1_pay_dK(3,:)=av_dv1_pay;
    av_dv1_tkc_dK(3,:)=av_dv1_tkc;
    av_dv1_ekc_dK(3,:)=av_dv1_ekc;
    dv1_vlcoa_rate_dK(3,:)=dv1_vlcoa_rate;
% end-remove all-zero row only needs to be applied to K=7


Rr=10:10:length(R_value)*10;
figure
plot(Rr,av_dv1_Fkc_dK(2,:),'r','marker','o','markersize',10,'linewidth',2.0)
hold on
plot(Rr,av_dv1_rvu_dK(2,:),'b','marker','d','markersize',10,'linewidth',1.0)
hold on
plot(Rr,av_dv1_pay_dK(2,:),'k','marker','s','markersize',10,'linewidth',1.0)
hold on
plot(Rr,av_dv1_tkc_dK(2,:),'marker','x','markersize',10,'linewidth',1.0)
hold on
plot(Rr,av_dv1_ekc_dK(2,:),'marker','*','markersize',10,'linewidth',1.0)
set(gca,'FontSize',14);
xlim([10,170]);
set(gca,'XTick',[10:20:170]);
xlabel('Total resource commitment (Units)','fontsize',14);
ylabel('Average individual utility and details','fontsize',14);
set(gca,'Fontname','times new Roman');
leng1=legend('Individual utility','Revenue','Payment','Task utility','Energy cost');
set(leng1,'position',[0.167261908912943 0.664682545359172 0.267857137588518 0.203571422894796]);
grid;

plot(Rr,av_dv1_Fkc_dK(1,:),'r','marker','o','markersize',8,'linewidth',1.0)
hold on
plot(Rr,av_dv1_Fkc_dK(2,:),'b','marker','d','markersize',8,'linewidth',1.0)
hold on
plot(Rr,av_dv1_Fkc_dK(3,:),'k','marker','s','markersize',8,'linewidth',1.0)
% hold on
% plot(Rr,av_dv1_Fkc_dK(4,:),'y','marker','s','markersize',10,'linewidth',1.0)
set(gca,'FontSize',14);
xlim([10,170]);
set(gca,'XTick',[10:20:170]); 
xlabel('Total resource commitment (Units)','fontsize',14);
ylabel('Average individual utility','fontsize',14);
set(gca,'Fontname','times new Roman');
leng1=legend('K=3','K=5','K=7');
set(leng1,'position',[0.690476192072743 0.335515852650952 0.144642855546304 0.15476190050443]);
grid



figure
plot(Rr,dv1_vlcoa_rate_dK(1,:),'r','marker','o','markersize',8,'linewidth',1.0)
hold on
plot(Rr,dv1_vlcoa_rate_dK(2,:),'b','marker','d','markersize',8,'linewidth',1.0)
hold on
plot(Rr,dv1_vlcoa_rate_dK(3,:),'k','marker','s','markersize',8,'linewidth',1.0)
% hold on
% plot(Rr,dv1_vlcoa_rate_dK(4,:),'y','marker','s','markersize',10,'linewidth',1.0)
set(gca,'FontSize',14);
xlim([10,170]);
set(gca,'XTick',[10:20:170]);  
xlabel('Total resource commitment (Units)','fontsize',14);
ylabel('Ratio of joining in a coalition','fontsize',14);
set(gca,'Fontname','times new Roman');
leng1=legend('K=3','K=5','K=7');
set(leng1,'position',[0.701190477787029 0.435515852650952 0.144642855546304 0.15476190050443]);
grid



