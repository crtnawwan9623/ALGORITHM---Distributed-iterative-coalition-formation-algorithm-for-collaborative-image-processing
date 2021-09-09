H2=load('temp\iteration7_1_K5_2.mat');
dv1_rvu(301:500,:,2)=H2.dv1_rvu(301:500,:,2);
dv1_pay(301:500,:,2)=H2.dv1_pay(301:500,:,2);
dv1_tkc(301:500,:,2)=H2.dv1_tkc(301:500,:,2);
dv1_ekc(301:500,:,2)=H2.dv1_ekc(301:500,:,2);
dv1_Fkc(301:500,:,2)=H2.dv1_Fkc(301:500,:,2);
dv1_vlnum(301:500,:,2)=H2.dv1_vlnum(301:500,:,2);

    av_dv1_rvu=mean(dv1_rvu(:,:,2));
    av_dv1_pay=mean(dv1_pay(:,:,2));
    av_dv1_tkc=mean(dv1_tkc(:,:,2));
    av_dv1_ekc=mean(dv1_ekc(:,:,2));
    av_dv1_Fkc=mean(dv1_Fkc(:,:,2));
    dv1_vlcoa_rate=mean(dv1_vlnum(:,:,2));
    
    av_dv1_Fkc_dK(2,:)=av_dv1_Fkc;
    av_dv1_rvu_dK(2,:)=av_dv1_rvu;
    av_dv1_pay_dK(2,:)=av_dv1_pay;
    av_dv1_tkc_dK(2,:)=av_dv1_tkc;
    av_dv1_ekc_dK(2,:)=av_dv1_ekc;
    dv1_vlcoa_rate_dK(2,:)=dv1_vlcoa_rate;
    %
    
    H3=load('temp\iteration7_1_K5_3.mat');
dv1_rvu(301:500,:,3)=H3.dv1_rvu(301:500,:,3);
dv1_pay(301:500,:,3)=H3.dv1_pay(301:500,:,3);
dv1_tkc(301:500,:,3)=H3.dv1_tkc(301:500,:,3);
dv1_ekc(301:500,:,3)=H3.dv1_ekc(301:500,:,3);
dv1_Fkc(301:500,:,3)=H3.dv1_Fkc(301:500,:,3);
dv1_vlnum(301:500,:,3)=H3.dv1_vlnum(301:500,:,3);

    av_dv1_rvu=mean(dv1_rvu(:,:,3));
    av_dv1_pay=mean(dv1_pay(:,:,3));
    av_dv1_tkc=mean(dv1_tkc(:,:,3));
    av_dv1_ekc=mean(dv1_ekc(:,:,3));
    av_dv1_Fkc=mean(dv1_Fkc(:,:,3));
    dv1_vlcoa_rate=mean(dv1_vlnum(:,:,3));
    
    av_dv1_Fkc_dK(3,:)=av_dv1_Fkc;
    av_dv1_rvu_dK(3,:)=av_dv1_rvu;
    av_dv1_pay_dK(3,:)=av_dv1_pay;
    av_dv1_tkc_dK(3,:)=av_dv1_tkc;
    av_dv1_ekc_dK(3,:)=av_dv1_ekc;
    dv1_vlcoa_rate_dK(3,:)=dv1_vlcoa_rate;