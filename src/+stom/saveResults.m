function saveResults(data, saveDir, varName)
%saveResults saves calculation results on the hard drive 
%
% saveResults(data, saveDir, varName)
% 
% saves results on the hard drive, given data, saveDir and varName, where
% data - the results structure to be saved,
% saveDir - directory to save data,
% varName - file name of the data.
%
% Example
%
% saveResults( data,'~/stop/examples/fuelpin','fuelpin_1' )
% 
% it will create file: '~/stop/examples/fuelpin/fuelpin_1.mat'
% which contains fuelpin_1 structure

resultsDir = fullfile(saveDir);

if(~exist(resultsDir, 'dir'))
    mkdir(resultsDir);
end

varName= genvarname(varName);
eval([varName '= data;']);
save([resultsDir filesep varName],varName);