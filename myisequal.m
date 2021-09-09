function [iseq]=myisequal(Cs)
% this m-file is used to check if current Coalition strucuture is the same
% to one of the past 5 ones
global Csold_1;
global Csold_2;
global Csold_3;
global Csold_4;
global Csold_5;
global Csold_6;
global Csold_7;
global Csold_8;
global Csold_9;
global Csold_10;
global Csnum;

if isequal(Csold_1,Cs) || isequal(Csold_2,Cs) || isequal(Csold_3,Cs) || isequal(Csold_4,Cs) || isequal(Csold_5,Cs) || isequal(Csold_6,Cs) || isequal(Csold_7,Cs) || isequal(Csold_8,Cs) || isequal(Csold_9,Cs) || isequal(Csold_10,Cs)
    iseq=true;
else
    iseq=false;
end

switch Csnum
    case 1
        Csold_2=Cs;
        Csnum=2;
    case 2
        Csold_3=Cs;
        Csnum=3;
    case 3
        Csold_4=Cs;
        Csnum=4;
    case 4
        Csold_5=Cs;
        Csnum=5;
    case 5
        Csold_6=Cs;
        Csnum=6;
    case 6
        Csold_7=Cs;
        Csnum=7;
    case 7
        Csold_8=Cs;
        Csnum=8;
    case 8
        Csold_9=Cs;
        Csnum=9;
    case 9
        Csold_10=Cs;
        Csnum=10;
    otherwise
        Csold_1=Cs;
        Csnum=1;
end
       
end