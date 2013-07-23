clc;close all;

TITLE = '"FP    Sodium cooled pin cell with (U,Pu)O2 fuel"';

HEXR = [0.60, 0.62, 0.63];
FH =   [   0,   10,   20];
FDC =  [ 1.0,  1.1,  1.2];
VG =   [0.01,0.015, 0.02];


[path, name, ext] = fileparts(...
    '/home/asikth/Documents/S2P/stop/examples/fuelpin/fuelpin.spi');
cd(path);

genData.serpCallCommand = 'sss1118';
genData.serpParInpDir = path;
genData.serpParInpName = [name ext];
genData.stopDir = '/home/asikth/Documents/S2P/stop/';
genData.saveDir = genData.serpParInpDir;

genData.saveResPar = {...
    'CHI';'CHID';'BETA_EFF';'P1_TRANSPXS';'RABSXS';'NSF';...
    'FISSXS';'FISSE';...
    'GPRODXS';'RECIPVEL';...
    'ADFS';'ADFC';...
    'PRECURSOR_GROUPS';'BETA_EFF';'BETA_ZERO';'DECAY_CONSTANT'...
    };
genData.saveDetPar = {''};


genData.eneGroups = int8(2);
genData.isTest  = false;
genData.isLog = false;
genData.isExtract = false;
genData.isBurnup = false;
genData.isContinue = false;

inpPar.HEXR = 0;
inpPar.FH = 0;
inpPar.FDC = 0;
inpPar.TITLE = TITLE;

for n = 1:length(HEXR)
    calc(n).genData = genData;
    calc(n).genData.calcNum = n;
    calc(n).inpPar = inpPar;
    calc(n).inpPar.HEXR = HEXR(n);
    calc(n).inpPar.FH = FH(n);
    calc(n).inpPar.FDC = FDC(n);
    calc(n).inpPar.VG = VG(n);
end

addpath(genpath(genData.stopDir))
stom(calc(1));


