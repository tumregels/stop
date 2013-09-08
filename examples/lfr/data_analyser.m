clear all; close all; clc

load('allresults.mat')

%%calculate rho and std for all burnup steps

rho = @(x)...
    10^5*(x(1,1) - 1)/x(1,1);
stdrho = @(x)...
    rho(x)*sqrt( (x(1,2)/(x(1,1)-1))^2 + (x(1,2)/x(1,1))^2 );


rho_ref = rho(lfr_ref.res(1).IMP_KEFF);
std_rho_ref = stdrho(lfr_ref.res(1).IMP_KEFF);

rho_fthi = rho(lfr_fthi.res(1).IMP_KEFF);
std_rho_fthi = stdrho(lfr_fthi.res(1).IMP_KEFF);

rho_ftlow = rho(lfr_ftlow.res(1).IMP_KEFF);
std_rho_ftlow = stdrho(lfr_ftlow.res(1).IMP_KEFF);

rho_crin = rho(lfr_crin.res(1).IMP_KEFF);
std_rho_crin = stdrho(lfr_crin.res(1).IMP_KEFF);


% calculate doppler constant and std.
K_dop = (rho_ftlow - rho_fthi)./(log(1800) - log(300))%pcm/K
std_K_dop = ( 1/( log(1800)-log(900) ) )*sqrt(...
    std_rho_ftlow.^2 + std_rho_fthi.^2 )

CR_worth = rho_ref- rho_crin
std_CR_worth = sqrt( std_rho_crin.^2+std_rho_ref.^2 )

% optimize calculation data for xsec class

ref   = xsec.dataOptimizer(lfr_ref.res(end));
fthi  = xsec.dataOptimizer(lfr_fthi.res(end));
ftlow  = xsec.dataOptimizer(lfr_ftlow.res(end));
crin = xsec.dataOptimizer(lfr_crin.res(end));

% generate XSEC cards for the following universes

universe = [
     96  97  98  99 100 101 102 103 104,... % inner fuel universes
    196 197 198 199 200 201 202 203 204 ,...% central fuel universes
    296 297 298 299 300 301 302 303 304 ,...% outer fuel universes
    50]; % radial reflector

xs = xsec();

% loop through all universes
for i = 1:length(universe)
    
    xs.comp_num(universe(i));
    xs.base_macro(ref,universe(i));
    xs.dxs_dtf( (fthi-ftlow)./(log(1800)-log(300)),universe(i));
    
end

% create control rod XS for XSEC

xs.delcr_comp(60);
xs.delcr_base(ref, 59, crin, 60);

xs.display();
xs.write('xsecforlfr.txt');

