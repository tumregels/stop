clc; clear all; close all;

calc.serpExe = 'sss1118';
calc.stopDir = '/home/asikth/Documents/S2P/stop/';
calc.serpParInp.dir = pwd;
calc.serpParInp.name = 'fuelpin.spi';
calc.saveDir = pwd;

calc.saveResPar = {'ANA_KEFF';'IMP_KEFF'};

calc.isTest  = false;
calc.isContinue = false;
calc.isEcho = true;


calc(1:4) = calc;

calc(1).name = 'ref';
calc(1).values = struct('TITLE','fuelpin1',...
    'HEXR',0.60,...
    'FH',0,...
    'FDC',1,...
    'FT','09',...
    'CD',[0.86,663]);% sodium density at 663K

calc(2).name = 'fhhi';
calc(2).values = struct('TITLE','fuelpin2',...
    'HEXR',0.60,...
    'FH',[3.4174,3000],...% fuel hight increase at 3000K
    'FDC',[0.9670, 3000],...% fuel density coefficient at 3000K
    'FT','09',...
    'CD',0.86);

calc(3).name = 'fthi';
calc(3).values = struct('TITLE','fuelpin3',...
    'HEXR',0.60,...
    'FH',0,...
    'FDC',1,...
    'FT','18',...
    'CD',0.86);

calc(4).name = 'cdlow';
calc(4).values = struct('TITLE','fuelpin3',...
    'HEXR',0.60,...
    'FH',0,...
    'FDC',1,...
    'FT','09',...
    'CD',[0.681,1400]);% coolant density at 1400K

%==========================================================================

% add all folders of the stop wrapper to matlab search path

addpath(genpath(calc(1).stopDir))

% perform simulation

for n = 1:length(calc)
    
    [simStatus, results(n)] = stom(calc(n));
    
end

% generate xsec card

if calc(1).isTest == false
    
    s1 = results(1).res;
    s2 = results(2).res;
    s3 = results(3).res;
    
    s1 = xsec.dataOptimizer(s1);
    s2 = xsec.dataOptimizer(s2);
    s3 = xsec.dataOptimizer(s3);
    
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
    card.comp_num(3);
    card.base_macro(s3,3);
    card.display();
    card.write();
    
end
