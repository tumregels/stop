clc; clear all; close all;

% add all folders of the stop wrapper to matlab search path

addpath(genpath('/home/asikth/Documents/S2P/stop/'))

calc.serpExe = 'sss1118';
calc.serpParInp.name = 'fuelpin.spi';
calc.serpParInp.dir = pwd;
calc.saveDir = pwd;

calc.saveResPar = {'ANA_KEFF';'IMP_KEFF'};

calc.isTest  = false;
calc.isContinue = true;
calc.isEcho = true;


calc(1:4) = calc;

calc(1).name = 'ref';
calc(1).values = struct('TITLE','"fuelpin1"',...
    'FH',0,...
    'FDC',1,...
    'FT','09',...
    'CD',[0.86,663]);% sodium density at 663K

calc(2).name = 'fhhi';
calc(2).values = struct('TITLE','"fuelpin2"',...
    'FH',[3.4174,3000],...% fuel hight increase at 3000K
    'FDC',[0.9670, 3000],...% fuel density coefficient at 3000K
    'FT','09',...
    'CD',0.86);

calc(3).name = 'fthi';
calc(3).values = struct('TITLE','"fuelpin3"',...
    'FH',0,...
    'FDC',1,...
    'FT','18',...
    'CD',0.86);

calc(4).name = 'cdlow';
calc(4).values = struct('TITLE','"fuelpin3"',...
    'FH',0,...
    'FDC',1,...
    'FT','09',...
    'CD',[0.681,1400]);% coolant density at 1400K

%==========================================================================

% perform simulation

for n = 1:length(calc)
    
    [simStatus, results(n)] = stom(calc(n));
    
end

%==========================================================================

load('allresults.mat')

%%calculate rho and std

rho = @(x)...
    10^5*(x(1,1) - 1)/x(1,1);
stdrho = @(x)...
    rho(x)*sqrt( (x(1,2)/(x(1,1)-1))^2 + (x(1,2)/x(1,1))^2 );

rho_ref = rho(fuelpin_ref.res.IMP_KEFF)
std_rho_ref = stdrho(fuelpin_ref.res.IMP_KEFF)

rho_fthi = rho(fuelpin_fthi.res.IMP_KEFF)
std_rho_fthi = stdrho(fuelpin_fthi.res.IMP_KEFF)

rho_fhhi = rho(fuelpin_fhhi.res.IMP_KEFF)
std_rho_fhhi = stdrho(fuelpin_fhhi.res.IMP_KEFF)

rho_cdlow = rho(fuelpin_cdlow.res.IMP_KEFF)
std_rho_cdlow = stdrho(fuelpin_cdlow.res.IMP_KEFF)

% calculate doppler constant + std.
K_dop = (rho_ref - rho_fthi)/(log(1800) - log(900))%pcm/K
std_K_dop = ( 1/( log(1800)-log(900) ) )*sqrt(...
    std_rho_ref^2 + std_rho_fthi^2 )

% calculate axial fuel expansion coefficient "afec" + std.
temp_ref = 900; % Kelvin
temp_fhhi = 3000; % Kelvin

afec = ...
    (rho_ref - rho_fhhi)/(temp_ref - temp_fhhi) %pcm/K
std_afec = ( -1/(temp_ref - temp_fhhi) )*sqrt(...
    std_rho_ref^2 + std_rho_fhhi^2 )

% calculate coolant expansion coefficient + std.
ctemp_ref = 663;
ctemp_cdlow = 1400;

cec = (rho_ref - rho_cdlow)/(ctemp_ref - ctemp_cdlow)%pcm/K
std_cec = ( -1/(ctemp_ref - ctemp_cdlow) )*sqrt(...
    std_rho_ref^2 + std_rho_cdlow^2 )


