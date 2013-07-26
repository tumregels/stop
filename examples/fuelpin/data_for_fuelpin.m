clc;close all;
clear all;

[path, name, ext] = fileparts(...
    '/home/asikth/Documents/S2P/stop/examples/fuelpin/fuelpin.spi');

genData.serpCallCommand = 'sss1118';
genData.serpParInpDir = path;
genData.serpParInpName = [name ext];
genData.stopDir = '/home/asikth/Documents/S2P/stop/';
genData.saveDir = genData.serpParInpDir;

genData.saveResPar = {...
    'CHI';'CHID';
    };

genData.isTest  = false;
genData.isLog = false;
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


