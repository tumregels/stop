clear all; close all; clc
% add stop to matlab path
addpath(genpath('/home/asikth/Documents/S2P/stop/'))

%% cfsource

sim1 = stop('cfsource.spi');

sim1.serpExe = 'sss1118';
sim1.saveResPar = {'DIFFAREA';'TRANSPXS';'DIFFCOEF';'MUBAR';...
     'P1_DIFFCOEF';'P1_TRANSPXS';'P1_MUBAR';...
     'FLUX';'TOTXS';'CAPTXS';'ABSXS';'REMXS';...
     'ELAXS';'INELAXS';'RECIPVEL';...
     'TOT_SRCRATE';'TOT_FLUX'};

sim1.isTest  = false;
sim1.isContinue = false;
sim1.isEcho = true;

sim1.displayParameters();

sim1.name = 'H2O';
sim1.run('TITLE',sim1.name,'RAD',100,'FILL','water','SE','se 2.5E-8');

sim1.name = 'H2OCd';
sim1.run('TITLE',sim1.name,'RAD',100,'FILL','fill 2','SE','se 2.5E-8');


%% kthlab

sim2 = stop('kthlab.spi');

sim2.serpExe = 'sss1118';
sim2.saveResPar = sim1.saveResPar;

sim2.isTest  = false;
sim2.isContinue = true;
sim2.isEcho = true;

sim2.displayParameters();

sim2.name = 'H2OCdSS'; % water + Cd + Cf + Steel
sim2.run('TITLE',sim2.name,'FILL','fill 5');

sim2.name = 'H2OSS'; % water + steel
sim2.run('TITLE',sim2.name,'FILL','fill 5');

% sim2.name = 'H2O'; % water + Cf
% sim2.run('TITLE',sim2.name,'FILL','fill 3');
%
% sim2.name = 'H2OCd';% water + Cd + Cf
% sim2.run('TITLE',sim2.name,'FILL','fill 4');