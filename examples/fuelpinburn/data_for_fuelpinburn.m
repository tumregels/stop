clc; clear all; close all;

calc.serpExe = 'sss1118';
calc.serpParInp.dir = pwd;
calc.serpParInp.name = 'fuelpinburn.spi';
calc.stopDir = '/home/asikth/Documents/S2P/stop/';
calc.saveDir = pwd;

calc.saveResPar = {'ANA_KEFF';'IMP_KEFF'};

calc.isTest  = false;
calc.isContinue = true;
calc.isEcho = false;


calc(1:3) = calc;

calc(1).name = '1';
calc(1).values = struct('TITLE','fuelpin1burn',...
    'HEXR',0.60,'FH',0, 'FDC',1.0,'VG',0.01);

calc(2).name = '2';
calc(2).values = struct('TITLE','fuelpin2burn',...
    'HEXR',0.62,'FH',10,'FDC',1.1,'VG',0.015);

calc(3).name = '3';
calc(3).values = struct('TITLE','fuelpin3burn',...
    'HEXR',0.63,'FH',20,'FDC',1.2,'VG',0.02);


% add all folders of the stop wrapper to matlab search path

addpath(genpath(calc(1).stopDir))

% perform simulation

for n = 1:length(calc)
    
    [simStatus, results(n)] = stom(calc(n));
    
end

% generate xsec card

if calc(1).isTest == false
    
    
    s1 = results(1).res(42);
    s2 = results(2).res(42);
    
    s1 = xsec.dataOptimizer(s1);
    s2 = xsec.dataOptimizer(s2);
    
    card = xsec();
    card.comp_num(1);
    card.base_macro(s1,1);
    card.dxs_dtf(s1,1);
    card.dxs_ddm(s1,1);
    card.dxs_axexp(s1,1);
    card.dxs_radexp(s1,1);
    
    card.comp_num(2);
    card.base_macro(s2,2);
    
    s3 = (s1 + s2)./10;
    card.comp_num(2);
    card.base_macro(s3,2);
    card.display();
    card.write();
    
end


