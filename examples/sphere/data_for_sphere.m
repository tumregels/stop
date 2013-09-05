clc; clear all; close all;

% add all folders of the stop wrapper to matlab search path
addpath(genpath('/home/asikth/Documents/S2P/stop/'))

%sim = stop('/home/asikth/Documents/S2P/stop/examples/fuelpin/fuelpin.spi');
sim = stop('sphere.spi');

sim.displayParameters();

sim.serpExe = 'sss1118';
sim.saveResPar = {'ANA_KEFF';'IMP_KEFF'};
sim.isTest  = false;
sim.isContinue = false;
sim.isEcho = true;

RAD = linspace(3,6,20);% RAD vector between 3 and 6 cm.

for i = 1:length(RAD)
    
    sim.name = ['case_' num2str(i)];
    sim.run('TITLE','"critical sphere"','RAD',RAD(i));
    
end

%==========================================================================

clear all;clc
load('allresults.mat') % load allresults.mat file

name = who('sphere_case_*');
for i = 1:length(name)
    
    data = eval(name{i});
    r(i) = data.serpInp.values.RAD;
    k_eff(i) = data.res.IMP_KEFF(1,1);
    
end

[~, idx] = min(abs(k_eff-1.0)) % index of closest value
closest_keff = k_eff(idx)      % closest value
radius = r(idx)                % radius of the sphere

% plot radial flux
data = eval(name{idx});
rad_flux = data.det.DET1(:,11);
rad_pos = data.det.DET1Z(:,3);
plot(rad_pos, rad_flux)

