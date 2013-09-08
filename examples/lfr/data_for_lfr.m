clc; clear all; close all;

% add all folders of the stop wrapper to matlab search path
addpath(genpath('/home/asikth/Documents/S2P/stop/'))

%sim = stop('/home/asikth/Documents/S2P/stop/examples/lfr/lfr.spi');
sim = stop('lfr.spi');

sim.serpExe = 'sss1118';
sim.saveResPar = {'ANA_KEFF';'IMP_KEFF'};
sim.isContinue = true;
sim.isEcho = true;
sim.isXSEC = true;

sim.displayParameters();

sim.name = 'ref';
sim.values = struct('TITLE',sim.name,...
    'FTL', '12',...
    'CR', 0.0);    
sim.run()

sim.name = 'ftlow'; % fuel temp low
sim.run('TITLE',sim.name,...
    'FTL', '03',...
    'CR', 0.0);    

sim.name = 'fthi'; % fuel temp high
sim.run('TITLE',sim.name,...
    'FTL', '18',...
    'CR', 0.0);   

sim.name = 'crin'; % control rods in
sim.run('TITLE',sim.name,...
    'FTL', '03',...
    'CR',120.0);





