% change K, change S and R with Tao
% valid
global R_sys;
global r_it1;
global q;
global K;
global k_it2;
global vr; %variance for sampling unit resource and task in deliver_rate.m
var_value=[1,2,3,4,5];
K_value=[3,5,7];
for vr_it2=1:5
    vr=var_value(vr_it2);
    for k_it2=1:3
        K=K_value(k_it2);
        iteration6_int;
        av_dv1_Fkc_dK(k_it2,:)=av_dv1_Fkc;
        av_dv1_rvu_dK(k_it2,:)=av_dv1_rvu;
        av_dv1_pay_dK(k_it2,:)=av_dv1_pay;
        av_dv1_tkc_dK(k_it2,:)=av_dv1_tkc;
        av_dv1_ekc_dK(k_it2,:)=av_dv1_ekc;
        av_dv1_del_rat_dK(k_it2,:)=av_dv1_del_rat;
        av_dv1_del_rat_var_dK(k_it2,:)=av_dv1_del_rat_var;
        dv1_vlcoa_rate_dK(k_it2,:)=dv1_vlcoa_rate;
        save('iteration6.mat');
    end
    vr_del_rat(:,vr_it2)=av_dv1_del_rat_dK;
    vr_del_rat_var(:,vr_it2)=av_dv1_del_rat_var_dK;
end

Tao=Tao_value;

figure
bar(vr_del_rat');
ylim([0.7,0.95]);
xlabel('Variance of task request and resource commitment ','fontsize',14);
ylabel('Onsite resource delivery rate','fontsize',14);
set(gca,'FontSize',14);
set(gca, 'XTickLabel', {'1','2','3','4','5'} );
set(gca,'Fontname','times new Roman');
leng1=legend('K=3','K=5','K=7');
grid;

figure
bar(vr_del_rat_var');
xlabel('Variance of task request and resource commitment ','fontsize',14);
ylabel('Variance of onsite resource delivery rate','fontsize',14);
set(gca,'FontSize',14);
set(gca, 'XTickLabel', {'1','2','3','4','5'} );
set(gca,'Fontname','times new Roman');
leng1=legend('K=3','K=5','K=7');
grid;
