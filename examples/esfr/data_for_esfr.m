clc; clear all; close all;

[path, name, ext] = fileparts(...
    '/home/asikth/Documents/S2P/stop/examples/esfr/esfr.spi');

genData.serpCallCommand = 'sss1118';
genData.serpParInpDir = path;
genData.serpParInpName = [name ext];
genData.stopDir = '/home/asikth/Documents/S2P/stop/';
genData.saveDir = genData.serpParInpDir;

genData.saveResPar = {'ANA_KEFF';'IMP_KEFF'};

genData.isTest  = true;
genData.isContinue = false;

% list of parameters to be used during simulation

TITLE = '"esfr"';
%FHE = [ 0    3.4174 0     0     0       0];
FUELHALFHEIGHT = ...
      [50     53.4174 50      50      50      50];
FUEL1DENSITY=...
      [9.7897  9.4667  9.7897  9.7897  9.7897  9.7897];
FUEL2DENSITY=...
      [9.8006  9.4772  9.8006  9.8006  9.8006  9.8006];

%FDC = [ 1    0.9670 1     1     1       1];
FTL = [03     03     18     03     03        03];

CD  = [ 0.95   0.95   0.95   0.681  0.95      0.95];% 0.681 

DGP = [21.08  21.08  21.08  21.08  22.23450  21.08];
HALFDGP = ...
      [10.54  10.54  10.54  10.54  11.11725  10.54];
  
CRP = [50    50    50    50    50     -50];

% prepare data structure for 'stop' wrapper

for n = 1:length(CRP)
    
    calc(n).genData = genData;
    calc(n).genData.calcNum = n;
    
    calc(n).inpPar.FUELHALFHEIGHT = FUELHALFHEIGHT(n);
    calc(n).inpPar.FUEL1DENSITY    = FUEL1DENSITY(n);
    calc(n).inpPar.FUEL2DENSITY    = FUEL2DENSITY(n);
    calc(n).inpPar.FTL              = FTL(n);
    calc(n).inpPar.CD               = CD(n);
    calc(n).inpPar.DGP              = DGP(n);    
    calc(n).inpPar.HALFDGP          = HALFDGP(n); 
    calc(n).inpPar.CRP              = CRP(n);
    calc(n).inpPar.TITLE            = TITLE;
    
end

% add all folders of the stop wrapper to matlab search path

addpath(genpath(genData.stopDir))

% perform simulation

for n = 1:length(CRP)
    
    [results(n), ~] = stom(calc(n));
    
end

% generate xsec card

if false

s1 = results(1).resm;
s2 = results(2).resm;
s3 = results(3).resm;

s1 = xsec.dataOptimizer(s1);
s2 = xsec.dataOptimizer(s2);
s3 = xsec.dataOptimizer(s3);

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
card.comp_num(3);
card.base_macro(s3,3);
card.display();
card.write();

end

%{
case reference REF 1
FHE  0          % fuel height expansion ,[cm]
FDC  1 			% fuel density coefficient, FDC and FHE reflect each other
FT   300 		%Fuel temperature, [K]
CD   0.95   	%Coolant density at 743K, [g/cm3]
CT   300 		% Coolant temperature, [K]
DGP  21.08 		% diagrid pitch, [cm]
CRP  50 		% control rod position, [cm]

case fhhi FHE 1
FHE  3.4174   
FDC  0.9670  
FT   300      
CT   300       
CD   0.95
DGP  21.08    
CRP  50

case fthi FT 1
FHE  0 
FDC  1 
FT   1800  
CT   300 
CD   0.95 
DGP  21.08 
CRP  50 

case cdlow CD 1
FHE  0 
FDC  1 
FT   300  
CT   300  
CD   0.681  % coolant density at 1400K
DGP  21.08 
CRP  50 

case dgphi DGP 1
FHE  0 
FDC  1 
FT   300  
CT   300  
CD   0.95  
DGP  22.2345  %DGP at 3000K
CRP  50 

case crin CRP 1
FHE  0 
FDC  1 
FT   300  
CT   300 
CD   0.95 
DGP  21.08 
CRP  -50 
%}
