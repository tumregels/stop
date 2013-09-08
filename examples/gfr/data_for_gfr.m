clc; clear all; close all;

% add all folders of the stop wrapper to matlab search path
addpath(genpath('/home/asikth/Documents/S2P/stop/'))

%sim = stop('/home/asikth/Documents/S2P/stop/examples/gfr/gfr.spi');
sim = stop('gfr.spi');

sim.serpExe = 'sss1118';
sim.saveResPar = {'ANA_KEFF';'IMP_KEFF'};
sim.isTest  = false;
sim.isContinue = true;
sim.isEcho = true;
sim.isXSEC = true;

sim.displayParameters();

sim.name = 'ref';
sim.values = struct('TITLE',sim.name,...
    'FTL', '12',...
    'CRP', 82.5);    
sim.run()

sim.name = 'ftlow'; % fuel temp low
sim.run('TITLE',sim.name,...
    'FTL', '03',...
    'CRP', 82.5);    

sim.name = 'fthi'; % fuel temp high
sim.run('TITLE',sim.name,...
    'FTL', '18',...
    'CRP', 82.5);   

sim.name = 'crin'; % control rods in
sim.run('TITLE',sim.name,...
    'FTL', '03',...
    'CRP',-82.5);





