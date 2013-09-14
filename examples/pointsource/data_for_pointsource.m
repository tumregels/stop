clear all; close all; clc
% add all folders of the stop wrapper to matlab search path
addpath(genpath('/home/asikth/Documents/S2P/stop/'))

sim = stop('pointsource.spi');

sim.serpExe = 'sss1118';
sim.saveResPar = {'DIFFAREA';'TRANSPXS';'DIFFCOEF';'MUBAR';...
    'P1_DIFFCOEF';'P1_TRANSPXS';'P1_MUBAR';...
    'FLUX';'TOTXS';'CAPTXS';'ABSXS';'ELAXS';'INELAXS';'RECIPVEL';...
    'TOT_SRCRATE';'TOT_FLUX'};

sim.isTest  = false;
sim.isContinue = false;
sim.isEcho = true;

sim.displayParameters();

% RAD = [15:5:150,200:100:2000,2500:500:10000];

RAD = 10:5:150;

for i = 1:length(RAD)
    sim.name = sprintf('PS%02d', i);
    sim.run('TITLE',sim.name,'RAD',RAD(i));
end