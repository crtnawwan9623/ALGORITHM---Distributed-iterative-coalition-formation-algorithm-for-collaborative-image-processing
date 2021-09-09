% This file is for iteration_5
global R_sys;
global s_sys;
global r_it1;
global q;
global k_it2;
global q_stuck;
global T;

Tao_value=[10,20,30,40,50,60,70,80,90]; %contract term

for q=61:80
    q_stuck=1; % to ensure that sentence below can run in the 1st time
    while q_stuck == 1
        constr5;
        R_sys_uni=R_sys;   % R_sys and s_sys sampled in constr5 is just unit resource commitment and unit task request
        s_sys_uni=s_sys;
        for r_it1=1:length(Tao_value) %!!! iterate for each tao value(contract term)
            
            R_sys=Tao_value(r_it1)*R_sys_uni;  % calculate total resource commitment based on unit resource commitment and contract term
            s_sys=Tao_value(r_it1)*s_sys_uni;  % calculate total task requests based on unit task request and contract term
            
            % begin-test stuck situation
            q_stuck=0;
            main2;
            if q_stuck == 1
                break;  %if stuck, directly jump out for loop and go to while to set up a new environment
            end
            % end-test stuck situation
            
            
            dv1_rvu(q,r_it1,k_it2)=mean(rvu_sys);
            dv1_pay(q,r_it1,k_it2)=mean(pay_sys);
            dv1_tkc(q,r_it1,k_it2)=mean(tkc_sys);
            dv1_ekc(q,r_it1,k_it2)=mean(ekc_sys);
            dv1_Fkc(q,r_it1,k_it2)=mean(Fkc_sys);
            dv1_coa=Coa_str((Coa_str(:,1)==1),:);
            if sum(dv1_coa)>1
                dv1_vlnum(q,r_it1,k_it2)=1;
            else
                dv1_vlnum(q,r_it1,k_it2)=0;
            end
        end
    end
    av_dv1_rvu=mean(dv1_rvu(:,:,k_it2));
    av_dv1_pay=mean(dv1_pay(:,:,k_it2));
    av_dv1_tkc=mean(dv1_tkc(:,:,k_it2));
    av_dv1_ekc=mean(dv1_ekc(:,:,k_it2));
    av_dv1_Fkc=mean(dv1_Fkc(:,:,k_it2));
    dv1_vlcoa_rate=mean(dv1_vlnum(:,:,k_it2));
    save('iteration5.mat');
end