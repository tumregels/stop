clear all;close all;clc

load('allresults.mat')

name = who('pointsource_PS*');

for i = 1:length(name)
    
    data = eval(name{i});
    
    radius(i) = data.serpInp.values.RAD;
    diffarea(i) = data.res.('DIFFAREA')(1);
    diffcoef(i) = data.res.('DIFFCOEF')(1);
    p1_diffcoef(i) = data.res.('P1_DIFFCOEF')(1);
    absxs(i) = data.res.('ABSXS')(1);
    vel(i) = 1/data.res.('RECIPVEL')(1);
    tot_srcrate(i) = data.res.('TOT_SRCRATE')(1);
    tot_flux(i) = data.res.('TOT_FLUX')(1);
    
    rad_flux(i,:) = data.det.DET1(:,11)';
    rad_pos(i,:) = data.det.DET1Z(:,3)';
    spectr(i,:) = data.det.DET2(:,11);
    ene(i,:) = data.det.DET2E(:,3);
end

subplot(2,4,1)
plot(radius,diffcoef,'r*','LineWidth',2)
ylabel('DIFFCOEF, cm')
grid on

subplot(2,4,2)
plot(radius,diffarea,'g*','LineWidth',2)
ylabel('DIFFAREA, cm^2')
grid on

subplot(2,4,3)
plot(radius,absxs,'k*','LineWidth',2)
ylabel('ABSXS, cm^-^1')
grid on

subplot(2,4,4)
plot(radius,vel,'cd','LineWidth',2)
ylabel('VELOCITY, cm/s')
grid on

subplot(2,4,[5:6])
plot(rad_pos, rad_flux)
ylabel('flux, n/cm^2')
xlabel('radius, cm')
grid on

subplot(2,4,[7:8])
semilogx(ene,spectr,'LineWidth',1.5)
ylabel('flux per lethargy, n/(cm^2\cdot\Deltau\cdotsec)')
xlabel('energy, MeV')
grid on