clc; clear all; close all;

calc.serpExe = 'sss1118';
calc.stopDir = '/home/asikth/Documents/S2P/stop/';
calc.serpParInp.name = 'fuelpin.spi';
calc.serpParInp.dir = pwd;
calc.saveDir = pwd;

calc.saveResPar = {'ANA_KEFF';'IMP_KEFF'};

calc.isTest  = false;
calc.isContinue = true;
calc.isEcho = true;


calc(1:4) = calc;

calc(1).name = 'ref';
calc(1).values = struct('TITLE','fuelpin1',...
    'FH',0,...
    'FDC',1,...
    'FT','09',...
    'CD',[0.86,663]);% sodium density at 663K

calc(2).name = 'fhhi';
calc(2).values = struct('TITLE','fuelpin2',...
    'FH',[3.4174,3000],...% fuel hight increase at 3000K
    'FDC',[0.9670, 3000],...% fuel density coefficient at 3000K
    'FT','09',...
    'CD',0.86);

calc(3).name = 'fthi';
calc(3).values = struct('TITLE','fuelpin3',...
    'FH',0,...
    'FDC',1,...
    'FT','18',...
    'CD',0.86);

calc(4).name = 'cdlow';
calc(4).values = struct('TITLE','fuelpin3',...
    'FH',0,...
    'FDC',1,...
    'FT','09',...
    'CD',[0.681,1400]);% coolant density at 1400K

%==========================================================================

% add all folders of the stop wrapper to matlab search path

addpath(genpath(calc(1).stopDir))

% perform simulation

for n = 1:length(calc)
    
    [simStatus, results(n)] = stom(calc(n));
    
end

%%calculate doppler constant

keff_ref = results(1).res.IMP_KEFF(1,1);
keff_fthi = results(3).res.IMP_KEFF(1,1);

rho_ref = 10^5*(keff_ref - 1)/keff_ref;
rho_fthi = 10^5*(keff_fthi - 1)/keff_fthi;

K_dop = (rho_ref - rho_fthi)/(log(1800) - log(900))%pcm/K

% standard deviation of doppler constant

std_ref = results(1).res.IMP_KEFF(1,2);
std_fthi = results(3).res.IMP_KEFF(1,2);

std_rho_ref = rho_ref*sqrt(...
    (std_ref/(keff_ref-1))^2 + (std_ref/keff_ref)^2 );
std_rho_fthi = rho_fthi*sqrt(...
    (std_fthi/(keff_fthi-1))^2 + (std_ref/keff_fthi)^2 );

std_K_dop = ( 1/( log(1800)-log(900) ) )*sqrt(...
    std_rho_ref^2 + std_rho_fthi^2 )

%%calculate axial fuel expansion coefficient "afec"

keff_fhhi = results(2).res.IMP_KEFF(1,1);

rho_fhhi = 10^5*(keff_fhhi - 1)/keff_fthi;

temp_ref = 900; % Kelvin
temp_fhhi = 3000; % Kelvin

afec = ...
    (rho_ref - rho_fhhi)/(temp_ref - temp_fhhi) %pcm/K

% standard deviation of expansion coefficient

std_fhhi = results(2).res.IMP_KEFF(1,2);

std_rho_fhhi = rho_fhhi*sqrt(...
    (std_fhhi/(keff_fhhi-1))^2 + (std_ref/keff_fhhi)^2 );

std_afec = ( -1/(temp_ref - temp_fhhi) )*sqrt(...
    std_rho_ref^2 + std_rho_fhhi^2 )

%%calculate coolant expansion coefficient

keff_cdlow = results(4).res.IMP_KEFF(1,1);

rho_cdlow = 10^5*(keff_cdlow - 1)/keff_cdlow;

ctemp_ref = 663;%K
ctemp_cdlow = 1400;%K

cec = (rho_ref - rho_cdlow)/(ctemp_ref - ctemp_cdlow)

% standard deviation of coolant expansion coefficient

std_cdlow = results(4).res.IMP_KEFF(1,2);

std_rho_cdlow = rho_cdlow*sqrt(...
    (std_cdlow/(keff_cdlow-1))^2 + (std_ref/keff_cdlow)^2 );

std_cec = ( -1/(ctemp_ref - ctemp_cdlow) )*sqrt(...
    std_rho_ref^2 + std_rho_cdlow^2 )


