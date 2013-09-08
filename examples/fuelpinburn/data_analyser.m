clear all; close all; clc

load('allresults.mat')

%%calculate rho and std for all burnup steps

rho = @(x)...
    10^5*(x(1,1) - 1)/x(1,1);
stdrho = @(x)...
    rho(x)*sqrt( (x(1,2)/(x(1,1)-1))^2 + (x(1,2)/x(1,1))^2 );

for i = 1:length(fuelpinburn_ref.res)
    
    rho_ref(i) = rho(fuelpinburn_ref.res(i).IMP_KEFF);
    std_rho_ref(i) = stdrho(fuelpinburn_ref.res(i).IMP_KEFF);
    
    rho_fthi(i) = rho(fuelpinburn_fthi.res(i).IMP_KEFF);
    std_rho_fthi(i) = stdrho(fuelpinburn_fthi.res(i).IMP_KEFF);
    
    rho_fhhi(i) = rho(fuelpinburn_fhhi.res(i).IMP_KEFF);
    std_rho_fhhi(i) = stdrho(fuelpinburn_fhhi.res(i).IMP_KEFF);
    
    rho_cdlow(i) = rho(fuelpinburn_cdlow.res(i).IMP_KEFF);
    std_rho_cdlow(i) = stdrho(fuelpinburn_cdlow.res(i).IMP_KEFF);
    
end

% calculate doppler constant and std.
K_dop = (rho_ref - rho_fthi)./(log(1800) - log(900))%pcm/K
std_K_dop = ( 1/( log(1800)-log(900) ) )*sqrt(...
    std_rho_ref.^2 + std_rho_fthi.^2 )

% calculate axial fuel expansion coefficient "afec" and std
temp_ref = 900; % Kelvin
temp_fhhi = 3000; % Kelvin

afec = ...
    (rho_ref - rho_fhhi)./(temp_ref - temp_fhhi) %pcm/K
std_afec = ( -1/(temp_ref - temp_fhhi) )*sqrt(...
    std_rho_ref.^2 + std_rho_fhhi.^2 )

% calculate coolant expansion coefficient and std
ctemp_ref = 663;
ctemp_cdlow = 1400;

cec = (rho_ref - rho_cdlow)./(ctemp_ref - ctemp_cdlow)%pcm/K
std_cec = ( -1/(ctemp_ref - ctemp_cdlow) )*sqrt(...
    std_rho_ref.^2 + std_rho_cdlow.^2 )

% generate xsec card for universe 1 and 2, use only last burnup

% optimize calculation data for xsec class
ref   = xsec.dataOptimizer(fuelpinburn_ref.res(end));
fhhi  = xsec.dataOptimizer(fuelpinburn_fhhi.res(end));
fthi  = xsec.dataOptimizer(fuelpinburn_fthi.res(end));
cdlow = xsec.dataOptimizer(fuelpinburn_cdlow.res(end));

xs = xsec();

xs.comp_num(1);
xs.base_macro(ref,1);
xs.dxs_dtf( (fthi-ref)/(log(1800)-log(300)),1);
xs.dxs_ddm( (cdlow-ref)./1100,1);
xs.dxs_axexp( (fhhi-ref)./2700,1);

xs.comp_num(2);
xs.base_macro(ref,2);
xs.dxs_dtf( (fthi-ref)./(log(1800)-log(300)),2);
xs.dxs_ddm( (cdlow-ref)./1100,2);
xs.dxs_axexp( (fhhi-ref)./2700,2);

xs.display();
xs.write();

clear xs;

% generate xsec cards for all burnups for universe 1.

for i = 1:length(fuelpinburn_ref.res)
    
    ref   = xsec.dataOptimizer(fuelpinburn_ref.res(i));
    fhhi  = xsec.dataOptimizer(fuelpinburn_fhhi.res(i));
    fthi  = xsec.dataOptimizer(fuelpinburn_fthi.res(i));
    cdlow = xsec.dataOptimizer(fuelpinburn_cdlow.res(i));
    
    xs = xsec();
    
    xs.comp_num(1);
    xs.base_macro(ref,1);
    xs.dxs_dtf( (fthi-ref)./(log(1800)-log(300)),1);
    xs.dxs_ddm( (cdlow-ref)./1100,1);
    xs.dxs_axexp( (fhhi-ref)./2700,1);
    
    
    xs.display();
    xs.write(['xsecburn_' num2str(i) '.txt']);% save with unique name
    
    clear xs; % delete xs instance of xsec class.
    
end

