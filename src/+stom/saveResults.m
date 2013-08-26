function saveResults(data, saveDir, varName)
%saveResults saves calculation results on the hard drive 
%
% saveResults(data, saveDir, varName)
% 
% saves results on the hard drive, given data, saveDir and varName, where
% data - the results structure to be saved,
% saveDir - directory to save data,
% varName - name of the data structure.

if(~exist(saveDir, 'dir'))
    mkdir(saveDir);
end

varName= genvarname(varName);
eval([varName '= data;']);
save(fullfile(saveDir, varName),varName);

fname = fullfile(saveDir,'allresults.mat');

if exist(fname,'file')==2
    save(fname,varName,'-append')
else
    save(fname,varName)
end