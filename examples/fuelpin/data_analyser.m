clear all;close all;clc

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
