clear all;close all;clc

load('allresults.mat')

name = who('cf*');

for i = 1:length(name)
    
    data = eval(name{i});
    
    diffarea = data.res.('DIFFAREA')(1,5);
    diffcoef = data.res.('DIFFCOEF')(1,5);
    
    age = data.res.('DIFFAREA')(1,3);
    
    absxs = data.res.('ABSXS')(1,5);
    remxs = data.res.('REMXS')(1,3);
    
    vel = 1/data.res.('RECIPVEL')(1,5);
    tot_srcrate(i) = data.res.('TOT_SRCRATE')(1,1);
    tot_flux(i) = data.res.('TOT_FLUX')(1,1);
    
    rad_pos(:,i) = data.det.DET2X(:,3)';
    len = length(rad_pos);
    rad_ther_flux(:,i) = data.det.DET2(1:len,11)';
    rad_fast_flux(:,i) = data.det.DET2(len+1:end,11)';
    
    rad_total_flux(:,i) = data.det.DET3(:,11)';
    
    spectr(:,i) = data.det.DET4(:,11);
    ene(:,i) = data.det.DET4E(:,3);

    fprintf(1,...
        ['\n%s:\n diffcoef: %10.4f \n diffarea: %10.4f \n velocity: %10g \n',...
         ' absxs   : %10.4f \n remxs   : %10.4f \n age     : %10.4f\n'],...
         name{i},diffcoef, diffarea, vel, absxs, remxs, age);
    
    
end

name = who('kth*');

for i = 1:length(name)
    
    data = eval(name{i});
    
    diffarea = data.res.('DIFFAREA')(2,5);
    diffcoef = data.res.('DIFFCOEF')(2,5);
    
    age = data.res.('DIFFAREA')(2,3);
    
    absxs = data.res.('ABSXS')(2,5);
    remxs = data.res.('REMXS')(2,3);
    
    vel = 1/data.res.('RECIPVEL')(2,5);
    tot_srcrate(i) = data.res.('TOT_SRCRATE')(1,1);
    tot_flux(i) = data.res.('TOT_FLUX')(1,1);
    
    rad_pos(:,i) = data.det.DET2X(:,3);
    len = length(rad_pos);
    rad_ther_flux(:,i) = data.det.DET2(1:len,11);
    rad_fast_flux(:,i) = data.det.DET2(len+1:end,11);
    rad_total_flux(:,i) = data.det.DET3(:,11);
    
    spectr(:,i) = data.det.DET4(:,11);
    ene(:,i) = data.det.DET4E(:,3);

    fprintf(1,...
        ['\n%s:\n diffcoef: %10.4f \n diffarea: %10.4f \n velocity: %10g \n',...
         ' absxs   : %10.4f \n remxs   : %10.4f \n age     : %10.4f\n'],...
         name{i},diffcoef, diffarea, vel, absxs, remxs, age);
    
    
end

%-----------------------------------------------
%% Cf source spectra
%-----------------------------------------------

name = who('-regexp','(cfsource|kthlab)_(?!AGE$).*');
clear spectr ene

for i = 1:length(name)
    data = eval(name{i});
    spectr(:,i) = data.det.DET4(:,11);
    ene(:,i) = data.det.DET4E(:,3);
end

figure
loglog(ene,spectr,'LineWidth',2)
ylabel('flux per lethargy, n/(cm^2\cdot\Deltau\cdotsec)')
xlabel('energy, MeV')
legendnames = strrep(name,'_',' ');
legend(legendnames)
grid on

print('-dpsc','plot1','-r200')
%-----------------------------------------------
%% Cf source in spherical water medium
%% comparison with and without Cd sphere
%-----------------------------------------------

name = who('-regexp','cfsource_(?!AGE$).*');
%name = who('-regexp','(cfsource|kthlab)_(?!AGE$).*');
clear -regexp rad_.*


for i = 1:length(name)
    data = eval(name{i});
    if i == 1
        x(:,i) = data.det.DET2X(:,3);
    end

    len = length(x);
    
    rad_ther_flux(:,i) = data.det.DET2(1:len,11);
    rad_fast_flux(:,i) = data.det.DET2(len+1:end,11);
    rad_total_flux(:,i) = data.det.DET3(:,11);
end

figure
subplot(1,2,1)
title('Cf source in spherical water medium')
hold on
plot(x,rad_ther_flux,'LineWidth',2)
plot(x,rad_fast_flux,'LineWidth',2)
plot(x,rad_total_flux,'LineWidth',2)
hold off
ylabel('Radial Flux, n/cm^2')
xlabel('radius, cm')
legendnames = strrep(name,'_',' ');
legend(legendnames)
grid on

%-----------------------------------------------
%% Cf source at the lab geometry
%% comparison with and without Cd sphere
%-----------------------------------------------

%name = who('-regexp','cfsource_(?!AGE$).*');
name = who('-regexp','kthlab_(?!AGE$).*');
clear -regexp rad_.*


for i = 1:length(name)
    data = eval(name{i});
    
    len = length(x);
    
    rad_ther_flux(:,i) = data.det.DET2(1:len,11);
    rad_fast_flux(:,i) = data.det.DET2(len+1:end,11);
    rad_total_flux(:,i) = data.det.DET3(:,11);
end

subplot(1,2,2)
title('Cf source inside lab geometry')
hold on
plot(x,rad_ther_flux,'LineWidth',2)
plot(x,rad_fast_flux,'LineWidth',2)
plot(x,rad_total_flux,'LineWidth',2)
hold off
ylabel('Radial Flux, n/cm^2')
xlabel('radius, cm')
legendnames = strrep(name,'_',' ');
legend(legendnames)
grid on

print('-dpsc','plot2','-r200')
%-----------------------------------------------
%% Cf source in spherical medium and at the lab geometry
%-----------------------------------------------
figure
subplot(2,2,1)
hold on
title('Cf source in spherical water medium')
data = eval('cfsource_H2O');
plot(x(:,1), data.det.DET2(1:len,11),'g-','LineWidth',2);
plot(x(:,1), data.det.DET2(len+1:end,11),'r-','LineWidth',2);
plot(x(:,1), data.det.DET3(:,11),'k-','LineWidth',2);
hold off
legend('thermal','fast','total')
ylabel('Radial Flux, n/cm^2')
xlabel('radius, cm')
grid on

subplot(2,2,3)
hold on
title('Cf source inside lab geometry')
data = eval('kthlab_H2OSS');
plot(x(:,1), data.det.DET2(1:len,11),'g-','LineWidth',2);
plot(x(:,1), data.det.DET2(len+1:end,11),'r-','LineWidth',2);
plot(x(:,1), data.det.DET3(:,11),'k-','LineWidth',2);
hold off
legend('thermal','fast','total')
ylabel('Radial Flux, n/cm^2')
xlabel('radius, cm')
grid on
%-----------------------------------------------

%-----------------------------------------------
%% Cf source in spherical medium and at the lab geometry
%-----------------------------------------------

subplot(2,2,2)
hold on
title('Cf source in spherical water medium with Cd')
data = eval('cfsource_H2OCd');
plot(x(:,1), data.det.DET2(1:len,11),'g-','LineWidth',2);
plot(x(:,1), data.det.DET2(len+1:end,11),'r-','LineWidth',2);
plot(x(:,1), data.det.DET3(:,11),'k-','LineWidth',2);
hold off
legend('thermal','fast','total')
ylabel('Radial Flux, n/cm^2')
xlabel('radius, cm')
grid on

subplot(2,2,4)
hold on
title('Cf source inside lab geometry with Cd')
data = eval('kthlab_H2OCdSS');
plot(x(:,1), data.det.DET2(1:len,11),'g-','LineWidth',2);
plot(x(:,1), data.det.DET2(len+1:end,11),'r-','LineWidth',2);
plot(x(:,1), data.det.DET3(:,11),'k-','LineWidth',2);
hold off
legend('thermal','fast','total')
ylabel('Radial Flux, n/cm^2')
xlabel('radius, cm')
grid on

print('-dpsc','plot3','-r200')
%-----------------------------------------------

