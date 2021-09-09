% change K
% valid
global K;
global k_it1;
global q;
global q_stuck;
global Limit_coa_size;%new_for_revision
global Ini_coa_size;%new_for_revision
Limit_coa_size_g=[8,7,6,5,4,4,4,4];%new_for_revision
Ini_coa_size_g=[6,5,4,3,1,1,1,1];%new_for_revision
%K_value=[3,4,5,6,7,8,9]; %comment_for_revision
%K_value=[30,24,18,12,6,5,4,3];
K_value=[28,24,20,16,12,8,4];
for k_it1=1:length(K_value)
    K=K_value(k_it1);
    Limit_coa_size=Limit_coa_size_g(k_it1);%new_for_revision
    Ini_coa_size=Ini_coa_size_g(k_it1);%new_for_revision
    for q=1:30
        q_stuck=1; % to ensure that sentence below can run in the 1st time
        while q_stuck == 1
            constr1;
            % begin-test stuck situation
            q_stuck=0;
            main1;
            % end-test stuck situation
        end
    
    [vld_c_dev_num(q),vld_c_num(q),av_vc_size(q)]=CoaSta(Coa_str);
    av_dv_rvu(q)=mean(rvu_sys);
    av_dv_pay(q)=mean(pay_sys);
    av_dv_tkc(q)=mean(tkc_sys);
    av_dv_ekc(q)=mean(ekc_sys);
    av_dv_Fkc(q)=mean(Fkc_sys);
        if all(Fkc_sys==0) == 1
            av_vld_dv_Fkc(q)=0;
        else
            av_vld_dv_Fkc(q)=mean(Fkc_sys(Fkc_sys~=0));
        end
    end
    mn_vld_c_dev_num(k_it1)=mean(vld_c_dev_num);
    mn_vld_c_num(k_it1)=mean(vld_c_num);
    mn_av_vc_size(k_it1)=mean(av_vc_size);
    mn_av_dv_rvu(k_it1)=mean(av_dv_rvu);
    mn_av_dv_pay(k_it1)=mean(av_dv_pay);
    mn_av_dv_tkc(k_it1)=mean(av_dv_tkc);
    mn_av_dv_ekc(k_it1)=mean(av_dv_ekc);
    mn_av_dv_Fkc(k_it1)=mean(av_dv_Fkc);
    mn_av_vld_dv_Fkc(k_it1)=mean(av_vld_dv_Fkc(av_vld_dv_Fkc~=0));
    save('iteration1.mat');
end


bar(mn_vld_c_dev_num);
xlabel('Number of devices in the system','fontsize',14);
ylabel('Average number of devices in coalitions','fontsize',14);
set(gca,'FontSize',14);
set(gca, 'XTickLabel', {'4','8','12','16','20','24','28'}  );
set(gca,'Fontname','times new Roman');
grid;

figure
bar(mn_vld_c_num);
xlabel('Number of devices in the system','fontsize',14);
ylabel('Average number of coalitions','fontsize',14);
set(gca,'FontSize',14);
set(gca, 'XTickLabel', {'4','8','12','16','20','24','28'}  );
set(gca,'Fontname','times new Roman');
grid;

figure
bar(mn_av_vc_size);
xlabel('Number of devices in the system','fontsize',14);
ylabel('Average coalition size','fontsize',14);
set(gca,'FontSize',14);
set(gca, 'XTickLabel', {'4','8','12','16','20','24','28'} );
set(gca,'Fontname','times new Roman');
grid;

%
bar(fliplr(mn_vld_c_dev_num));
xlabel('Number of devices in the system','fontsize',14);
ylabel('Average number of devices in coalitions','fontsize',14);
set(gca,'FontSize',14);
set(gca, 'XTickLabel', {'4','8','12','16','20','24','28'}  );
set(gca,'Fontname','times new Roman');
grid;

bar(fliplr(mn_vld_c_num));
xlabel('Number of devices in the system','fontsize',14);
ylabel('Average number of coalitions','fontsize',14);
set(gca,'FontSize',14);
set(gca, 'XTickLabel', {'4','8','12','16','20','24','28'}  );
set(gca,'Fontname','times new Roman');
grid;

bar(fliplr(mn_av_vc_size));
xlabel('Number of devices in the system','fontsize',14);
ylabel('Average coalition size','fontsize',14);
set(gca,'FontSize',14);
set(gca, 'XTickLabel', {'4','8','12','16','20','24','28'} );
set(gca,'Fontname','times new Roman');
grid;