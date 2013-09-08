clear all; close all; clc

load('allresults.mat')

%%calculate rho and std for all burnup steps

rho = @(x)...
    10^5*(x(1,1) - 1)/x(1,1);
stdrho = @(x)...
    rho(x)*sqrt( (x(1,2)/(x(1,1)-1))^2 + (x(1,2)/x(1,1))^2 );


rho_ref = rho(gfr_ref.res(1).IMP_KEFF);
std_rho_ref = stdrho(gfr_ref.res(1).IMP_KEFF);

rho_fthi = rho(gfr_fthi.res(1).IMP_KEFF);
std_rho_fthi = stdrho(gfr_fthi.res(1).IMP_KEFF);

rho_ftlow = rho(gfr_ftlow.res(1).IMP_KEFF);
std_rho_ftlow = stdrho(gfr_ftlow.res(1).IMP_KEFF);

rho_crin = rho(gfr_crin.res(1).IMP_KEFF);
std_rho_crin = stdrho(gfr_crin.res(1).IMP_KEFF);


% calculate doppler constant and std.
K_dop = (rho_ftlow - rho_fthi)./(log(1800) - log(300))%pcm/K
std_K_dop = ( 1/( log(1800)-log(900) ) )*sqrt(...
    std_rho_ftlow.^2 + std_rho_fthi.^2 )

CR_worth = rho_ref- rho_crin
std_CR_worth = sqrt( std_rho_crin.^2+std_rho_ref.^2 )

% optimize calculation data for xsec class

ref   = xsec.dataOptimizer(gfr_ref.res(end));
fthi  = xsec.dataOptimizer(gfr_fthi.res(end));
ftlow  = xsec.dataOptimizer(gfr_ftlow.res(end));
crin = xsec.dataOptimizer(gfr_crin.res(end));

% generate XSEC cards for the following universes

universe = [
    98 99 100 101 102,... % inner fuel universes
    198 199 200 201 202,...% outer fuel universes
    50]; % radial reflector

xs = xsec();

% loop through all universes
for i = 1:length(universe)
    
    xs.comp_num(universe(i));
    xs.base_macro(ref,universe(i));
    xs.dxs_dtf( (fthi-ftlow)./(log(1800)-log(300)),universe(i));
    
end

% create control rod XS for XSEC

xs.delcr_comp(61);
xs.delcr_base(ref, 60, crin, 61);
xs.delcr_comp(71);
xs.delcr_base(ref, 70, crin, 71);

xs.display();
xs.write('xsecforgfr.txt');

