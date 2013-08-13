clc; clear all; close all;

[path, name, ext] = fileparts(...
    '/home/asikth/Documents/S2P/stop/examples/fuelpin/fuelpin.spi');

genData.serpCallCommand = 'sss1118';
genData.serpParInpDir = path;
genData.serpParInpName = [name ext];
genData.stopDir = '/home/asikth/Documents/S2P/stop/';
genData.saveDir = genData.serpParInpDir;

genData.saveResPar = {'ANA_KEFF';'IMP_KEFF'};

genData.isTest  = false;
genData.isContinue = false;

% list of parameters to be used during simulation

TITLE = '"FP    Sodium cooled pin cell with (U,Pu)O2 fuel"';

HEXR = [0.60, 0.62, 0.63];
FH =   [   0,   10,   20];
FDC =  [ 1.0,  1.1,  1.2];
VG =   [0.01,0.015, 0.02];

% prepare data structure for 'stop' wrapper

for n = 1:length(HEXR)
    
    calc(n).genData = genData;
    calc(n).genData.calcNum = n;
    
    calc(n).inpPar.HEXR = HEXR(n);
    calc(n).inpPar.FH = FH(n);
    calc(n).inpPar.FDC = FDC(n);
    calc(n).inpPar.VG = VG(n);
    calc(n).inpPar.TITLE = TITLE;
    
end

% add all folders of the stop wrapper to matlab search path

addpath(genpath(genData.stopDir))

% perform simulation

for n = 1:length(HEXR)
    
    [results(n), ~] = stom(calc(n));
    
end

% generate xsec card

s1 = results(1).resm;
s2 = results(2).resm;
s3 = results(3).resm;

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

