% change K
% measure onsite latency
global K;
global k_it1;
global q;
K_value=[3,5,7,9];
for k_it1=4:length(K_value)
    K=K_value(k_it1);
 
    for q=1:30
    constr1;
    tic;
    main1;
    latencyforK(q)=toc;
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
    latency(k_it1)=mean(latencyforK); %latency for bargain
    mn_vld_c_dev_num(k_it1)=mean(vld_c_dev_num);
    mn_vld_c_num(k_it1)=mean(vld_c_num);
    mn_av_vc_size(k_it1)=mean(av_vc_size);
    mn_av_dv_rvu(k_it1)=mean(av_dv_rvu);
    mn_av_dv_pay(k_it1)=mean(av_dv_pay);
    mn_av_dv_tkc(k_it1)=mean(av_dv_tkc);
    mn_av_dv_ekc(k_it1)=mean(av_dv_ekc);
    mn_av_dv_Fkc(k_it1)=mean(av_dv_Fkc);
    mn_av_vld_dv_Fkc(k_it1)=mean(av_vld_dv_Fkc(av_vld_dv_Fkc~=0));
    save('iteration4.mat');
end

latency_nofut=latency';
latency_fut=0.01.*K_value';

bar([latency_fut,latency_nofut]);
xlabel('Number of devices in the system','fontsize',14);
ylabel('Onsite latency for resource trading','fontsize',14);
set(gca,'YScale','log');
set(gca,'FontSize',14);
set(gca, 'XTickLabel', {'3','5','7','9'}  );
set(gca,'Fontname','times new Roman');
leng1=legend('Smart futures','Onsite negotiation');
set(leng1,'position',[0.199404768503847 0.786111113949428 0.312499993400914 0.105952378114065]);
grid;

%figure
% bar(mn_vld_c_dev_num);
% xlabel('Number of devices in the system','fontsize',14);
% ylabel('Average number of devices in coalitions','fontsize',14);
% set(gca,'FontSize',14);
% set(gca, 'XTickLabel', {'3','4','5','6','7','8','9'}  );
% set(gca,'Fontname','times new Roman');
% grid;
% 
% figure
% bar(mn_vld_c_num);
% xlabel('Number of devices in the system','fontsize',14);
% ylabel('Average number of coalitions','fontsize',14);
% set(gca,'FontSize',14);
% set(gca, 'XTickLabel', {'3','4','5','6','7','8','9'}  );
% set(gca,'Fontname','times new Roman');
% grid;
% 
% figure
% bar(mn_av_vc_size);
% xlabel('Number of devices in the system','fontsize',14);
% ylabel('Average coalition size','fontsize',14);
% set(gca,'FontSize',14);
% set(gca, 'XTickLabel', {'3','4','5','6','7','8','9'}  );
% set(gca,'Fontname','times new Roman');
% grid;



