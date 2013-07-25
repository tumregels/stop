function saveResults(data, saveDir, name)

resultsDir = fullfile(saveDir);

if(~exist(resultsDir, 'dir'))
    mkdir(resultsDir);
end

var = genvarname(name);
eval([var '= data;']);
save([resultsDir filesep var]);