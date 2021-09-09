
% m = 16;n = 8;
% A = randn(m,n);
% b = randn(m,1);
% bnds = randn(n,2);
% l = min(bnds, [], 2);
% u = max(bnds, [], 2);
% cvx_begin
%     variable x(n)
%     minimize(norm(A*x - b))
%     subject to
%         l <= x <= u
% cvx_end


% cvx_begin
%     variables x y z u v;
%     minimize(-log(1+x)-2*log(1+2*y)-3*log(1+3*z)-4*log(1+4*u)-5*log(1+5*v))
%     subject to
%         x+y+z+u+v == 15;
%         1.5 <= x;
%         2.5 <= y;
%         2.5 <= z;
%         2.5 <= u;
%         2.5 <= v;
% cvx_end


% cvx_begin
%     variables x y;
%     minimize(-log(1+x)-2*log(1+2*y))
%     subject to
%         x+y == 6;
%         1.5 <= x;
%         2.5 <= y;
% cvx_end

% cvx_begin
%     variables x(2);
%     minimize(-log(1+x(1))-2*log(1+2*x(2)))
%     subject to
%         x(1)+x(2) == 6;
%         1.5 <= x(1);
%         2.5 <= x(2);
% cvx_end
% 
% MP=[1.5,2.5];
% cvx_begin
%     variables x(2);
%     Objective = 0
%     for i = 1:2
%      Objective = Objective + (-i)*log(1+i*x(i))
%     end
%     minimize(Objective)
%     subject to
%         x(1)+x(2) == 6;
%         for i = 1:2
%         x(i) >= MP(i);
%         end
% cvx_end

% global K
% Coa_num=size(Coa_str,1);
% rvu_sys=zeros(1,K);
% pay_sys=zeros(1,K);
% ekc_sys=zeros(1,K);
% Fkc_sys=zeros(1,K);
% for z=1:Coa_num
%     [rvu_sc,pay_sc,tkc_sc,ekc_sc,Fkc_sc]=Sep_coa(Coa_str(z,:));
%     clg_tmp=(Coa_str(z,:)==1)
%     rvu_sys(clg_tmp)=rvu_sc(clg_tmp);
%     pay_sys(clg_tmp)=pay_sc(clg_tmp);
%     ekc_sys(clg_tmp)=ekc_sc(clg_tmp);
%     Fkc_sys(clg_tmp)=Fkc_sc(clg_tmp);
% end
%PCrr=zeros(1,2)
% parfor j=1:2
%     if j==1
%         index_temp=[1 1 0];
%     else
%         index_temp=[0 1 1];
%     end
%     index_temp_lg=(index_temp==1); % 110 --> 110 (logic)
%     [PCrr(j),x]=cal_PCrr(sum(index_temp),s_sc,B_sc(:,index_temp_lg),R_sc(index_temp_lg));
% end
% parfor idx = 1:10
%     % Set the global "VALUE"
%     fcn_1(idx);
%     % Read the global "VALUE"
%     out(idx) = fcn_2();
%     index_temp(idx)=idx+1
% end

% K=5;
% for ii=1:30
% constr2_2;
% DD(ii,:)=D;
% end

av_dv1_rvu=mean(dv1_rvu(1:19,:,4));
    av_dv1_pay=mean(dv1_pay(1:19,:,4));
    av_dv1_tkc=mean(dv1_tkc(1:19,:,4));
    av_dv1_ekc=mean(dv1_ekc(1:19,:,4));
    av_dv1_Fkc=mean(dv1_Fkc(1:19,:,4));
    dv1_vlcoa_rate=mean(dv1_vlnum(1:19,:,4));
    
av_dv1_Fkc_dK(4,:)=av_dv1_Fkc;
    av_dv1_rvu_dK(4,:)=av_dv1_rvu;
    av_dv1_pay_dK(4,:)=av_dv1_pay;
    av_dv1_tkc_dK(4,:)=av_dv1_tkc;
    av_dv1_ekc_dK(4,:)=av_dv1_ekc;
    dv1_vlcoa_rate_dK(4,:)=dv1_vlcoa_rate;


