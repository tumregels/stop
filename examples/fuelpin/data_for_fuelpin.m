clc; clear all; close all;

% add all folders of the stop wrapper to matlab search path
addpath(genpath('/home/asikth/Documents/S2P/stop/'))

%sim = stop('/home/asikth/Documents/S2P/stop/examples/fuelpin/fuelpin.spi');
sim = stop('fuelpin.spi');

sim.serpExe = 'sss1118';
sim.saveResPar = {'ANA_KEFF';'IMP_KEFF'};
sim.isTest  = false;
sim.isContinue = false;
sim.isEcho = true;

sim.displayParameters();

sim.name = 'ref';
sim.values = struct('TITLE','"fuelpin reference"',...
    'FH',0,...
    'FDC',1,...
    'FT','09',...
    'CD',[0.86,663]);% sodium density at 663Ks
sim.run()

sim.name = 'fhhi';
sim.run('TITLE','"fuelpin fuel hight high"',...
    'FH',[3.4174,3000],...% fuel hight increase at 3000K
    'FDC',[0.9670, 3000],...% fuel density coefficient at 3000K
    'FT','09',...
    'CD',0.86);

sim.name = 'fthi';
sim.run('TITLE','"fuelpin fuel temperature high"',...
    'FH',0,...
    'FDC',1,...
    'FT','18',...
    'CD',0.86);

sim.name = 'cdlow';
sim.run('TITLE','"fuelpin coolant density low"',...
    'FH',0,...
    'FDC',1,...
    'FT','09',...
    'CD',[0.681,1400]);% coolant density at 1400K






