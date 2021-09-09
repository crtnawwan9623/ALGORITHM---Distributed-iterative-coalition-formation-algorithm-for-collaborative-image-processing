global s_sys;
global r_it1;
global q;
global k_it2;
global q_stuck;
S_value=[10,20,30,40,50,60,70,80,90];
for q=804:900
    q_stuck=1; % to ensure that sentence below can run in the 1st time
    while q_stuck == 1
        constr3_1;
        for r_it1=1:length(S_value)
            s_sys(1,:)= ones(1,T)*S_value(r_it1);
            
            % begin-test stuck situation
            q_stuck=0;
            main2;
            if q_stuck == 1
                break;  %if stuck, directly jump out for loop and go to while to set up a new environment
            end
            % end-test stuck situation
            
            dv1_rvu(q,r_it1,k_it2)=rvu_sys(1);
            dv1_pay(q,r_it1,k_it2)=pay_sys(1);
            dv1_tkc(q,r_it1,k_it2)=tkc_sys(1);
            dv1_ekc(q,r_it1,k_it2)=ekc_sys(1);
            dv1_Fkc(q,r_it1,k_it2)=Fkc_sys(1);
            dv1_coa=Coa_str((Coa_str(:,1)==1),:);
            if sum(dv1_coa)>1
                dv1_vlnum(q,r_it1,k_it2)=1;
            else
                dv1_vlnum(q,r_it1,k_it2)=0;
            end
        end
    end
%       remove all-zero only needs to be applied to K=7
%     av_dv1_rvu=mean(removezerorow(dv1_rvu(:,:,k_it2)));  
%     av_dv1_pay=mean(removezerorow(dv1_pay(:,:,k_it2)));
%     av_dv1_tkc=mean(removezerorow(dv1_tkc(:,:,k_it2)));
%     av_dv1_ekc=mean(removezerorow(dv1_ekc(:,:,k_it2)));
%     av_dv1_Fkc=mean(removezerorow(dv1_Fkc(:,:,k_it2)));
%     dv1_vlcoa_rate=mean(removezerorow(dv1_vlnum(:,:,k_it2)));
    
    av_dv1_rvu=mean(dv1_rvu(:,:,k_it2));
    av_dv1_pay=mean(dv1_pay(:,:,k_it2));
    av_dv1_tkc=mean(dv1_tkc(:,:,k_it2));
    av_dv1_ekc=mean(dv1_ekc(:,:,k_it2));
    av_dv1_Fkc=mean(dv1_Fkc(:,:,k_it2));
    dv1_vlcoa_rate=mean(dv1_vlnum(:,:,k_it2));
    save('iteration3_1.mat');
end