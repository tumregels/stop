clc; clear all; close all;

% add all folders of the stop wrapper to matlab search path
addpath(genpath('/home/asikth/Documents/S2P/stop/'))

sim = stop('fuelpinburn.spi');

sim.serpExe = 'sss1118';
sim.saveResPar = {'ANA_KEFF';'IMP_KEFF'};
sim.isTest  = false;
sim.isContinue = false;
sim.isEcho = true;

sim.displayParameters();

sim.name = 'ref';
sim.run('TITLE','"fuelpin reference"',...
    'FH',0,...
    'FDC',1,...
    'FT','09',...
    'CD',[0.86,663]);% sodium density at 663Ks

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

% calculate doppler constant and std.
K_dop = (rho_ref - rho_fthi)/(log(1800) - log(900))%pcm/K
std_K_dop = ( 1/( log(1800)-log(900) ) )*sqrt(...
    std_rho_ref^2 + std_rho_fthi^2 )

% calculate axial fuel expansion coefficient "afec" and std
temp_ref = 900; % Kelvin
temp_fhhi = 3000; % Kelvin

afec = ...
    (rho_ref - rho_fhhi)/(temp_ref - temp_fhhi) %pcm/K
std_afec = ( -1/(temp_ref - temp_fhhi) )*sqrt(...
    std_rho_ref^2 + std_rho_fhhi^2 )

% calculate coolant expansion coefficient and std
ctemp_ref = 663;
ctemp_cdlow = 1400;

cec = (rho_ref - rho_cdlow)/(ctemp_ref - ctemp_cdlow)%pcm/K
std_cec = ( -1/(ctemp_ref - ctemp_cdlow) )*sqrt(...
    std_rho_ref^2 + std_rho_cdlow^2 )



clc; clear all; close all;

calc.serpExe = 'sss1118';
calc.serpParInp.dir = pwd;
calc.serpParInp.name = 'fuelpinburn.spi';
calc.stopDir = '/home/asikth/Documents/S2P/stop/';
calc.saveDir = pwd;

calc.saveResPar = {'ANA_KEFF';'IMP_KEFF'};

calc.isTest  = false;
calc.isContinue = true;
calc.isEcho = false;


calc(1:3) = calc;

calc(1).name = '1';
calc(1).values = struct('TITLE','fuelpin1burn',...
    'HEXR',0.60,'FH',0, 'FDC',1.0,'VG',0.01);

calc(2).name = '2';
calc(2).values = struct('TITLE','fuelpin2burn',...
    'HEXR',0.62,'FH',10,'FDC',1.1,'VG',0.015);

calc(3).name = '3';
calc(3).values = struct('TITLE','fuelpin3burn',...
    'HEXR',0.63,'FH',20,'FDC',1.2,'VG',0.02);


% add all folders of the stop wrapper to matlab search path

addpath(genpath(calc(1).stopDir))

% perform simulation

for n = 1:length(calc)
    
    [simStatus, results(n)] = stom(calc(n));
    
end

% generate xsec card

if calc(1).isTest == false
    
    
    s1 = results(1).res(42);
    s2 = results(2).res(42);
    
    s1 = xsec.dataOptimizer(s1);
    s2 = xsec.dataOptimizer(s2);
    
    card = xsec();
    card.comp_num(1);
    card.base_macro(s1,1);
    card.dxs_dtf(s1,1);
    card.dxs_ddm(s1,1);
    card.dxs_axexp(s1,1);
    card.dxs_radexp(s1,1);
    
    card.comp_num(2);
    card.base_macro(s2,2);
    
    s3 = (s1 + s2)./10;
    card.comp_num(2);
    card.base_macro(s3,2);
    card.display();
    card.write();
    
end


