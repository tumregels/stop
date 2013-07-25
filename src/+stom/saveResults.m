function saveResults(data, saveDir, name)

resultsDir = fullfile(saveDir,'FullResults');

if(~exist(resultsDir, 'dir'))
    mkdir(resultsDir);
end

var = genvarname(name);
eval([var '= data;']);
save([resultsDir filesep var]);