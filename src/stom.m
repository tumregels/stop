function [results calc] = stom(calc)

% vectorize the access to elements in a structure array
genData = [calc.genData];
inpPar = [calc.inpPar];

% get full path to *.spi file
serpParInpFullName = fullfile(genData.serpParInpDir, genData.serpParInpName);

% make input template
[serpInput, serpInpLog] = stom.makeSerpInp(serpParInpFullName, inpPar);

% write input template to file
staged.serpInput   = serpInput;
staged.serpInpLog  = serpInpLog;
staged.serpInpName = genData.serpParInpName;
staged.calcNum     = genData.calcNum;
staged.saveDir     = genData.saveDir;
staged.isContinue  = genData.isContinue;
staged.isTest      = genData.isTest;
staged.isEcho      = genData.isEcho;

staged = stom.writeSerpFile(staged);

% run calculations
staged.serpCallCommand = genData.serpCallCommand;

[simStatus staged] = stom.runCalculation(staged);

% extract data from res.m and det.m files

staged.saveResPar = genData.saveResPar;
staged.inpPar = inpPar;

if staged.isTest == false
    results = stom.getResults(staged);
    
    % save results
    staged.saveResDir = fullfile(staged.saveDir,'Results');
    stom.saveResults(results, staged.saveResDir, staged.serpInpName);
    
    % save all results
    calc.results = results;
    calc.staged = staged;
    
    staged.saveFullResDir = fullfile(staged.saveDir,'FullResults');
    stom.saveResults(calc, staged.saveFullResDir, staged.serpInpName);
else
    results = NaN;
    calc = NaN;
end



