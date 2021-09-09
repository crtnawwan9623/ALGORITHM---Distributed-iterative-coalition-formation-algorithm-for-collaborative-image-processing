%combine results from other mat file together
H1=load('temp\iteration3_1_a_1_120.mat');
dv1_rvu(601:720,:,3)=H1.dv1_rvu(1:120,:,3);
dv1_pay(601:720,:,3)=H1.dv1_pay(1:120,:,3);
dv1_tkc(601:720,:,3)=H1.dv1_tkc(1:120,:,3);
dv1_ekc(601:720,:,3)=H1.dv1_ekc(1:120,:,3);
dv1_Fkc(601:720,:,3)=H1.dv1_Fkc(1:120,:,3);
dv1_vlnum(601:720,:,3)=H1.dv1_vlnum(1:120,:,3);

H2=load('temp\iteration3_1_b_1_120.mat');
dv1_rvu(721:840,:,3)=H2.dv1_rvu(1:120,:,3);
dv1_pay(721:840,:,3)=H2.dv1_pay(1:120,:,3);
dv1_tkc(721:840,:,3)=H2.dv1_tkc(1:120,:,3);
dv1_ekc(721:840,:,3)=H2.dv1_ekc(1:120,:,3);
dv1_Fkc(721:840,:,3)=H2.dv1_Fkc(1:120,:,3);
dv1_vlnum(721:840,:,3)=H2.dv1_vlnum(1:120,:,3);

H3=load('temp\iteration3_1_c_1_120.mat');
dv1_rvu(841:960,:,3)=H3.dv1_rvu(1:120,:,3);
dv1_pay(841:960,:,3)=H3.dv1_pay(1:120,:,3);
dv1_tkc(841:960,:,3)=H3.dv1_tkc(1:120,:,3);
dv1_ekc(841:960,:,3)=H3.dv1_ekc(1:120,:,3);
dv1_Fkc(841:960,:,3)=H3.dv1_Fkc(1:120,:,3);
dv1_vlnum(841:960,:,3)=H3.dv1_vlnum(1:120,:,3);

    av_dv1_rvu=mean(removezerorow(dv1_rvu(:,:,3)));
    av_dv1_pay=mean(removezerorow(dv1_pay(:,:,3)));
    av_dv1_tkc=mean(removezerorow(dv1_tkc(:,:,3)));
    av_dv1_ekc=mean(removezerorow(dv1_ekc(:,:,3)));
    av_dv1_Fkc=mean(removezerorow(dv1_Fkc(:,:,3)));
    dv1_vlcoa_rate=mean(removezerorow(dv1_vlnum(:,:,3)));
    
    av_dv1_Fkc_dK(3,:)=av_dv1_Fkc;
    av_dv1_rvu_dK(3,:)=av_dv1_rvu;
    av_dv1_pay_dK(3,:)=av_dv1_pay;
    av_dv1_tkc_dK(3,:)=av_dv1_tkc;
    av_dv1_ekc_dK(3,:)=av_dv1_ekc;
    dv1_vlcoa_rate_dK(3,:)=dv1_vlcoa_rate;