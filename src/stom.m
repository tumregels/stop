function [simStatus results] = stom(calc)

% get full path to *.spi file
% serpParInpFullName = fullfile(calc.serpParInp.dir, calc.serpParInp.name);

% make input template
[serpInput, serpInpLog] = stom.makeSerpInp(calc);

% write input template to file
results.serpInp.file = serpInput;
results.serpInp.log = serpInpLog;
results.serpInp.values = calc.values;

results = stom.writeSerpFile(results, calc);

[simStatus results] = stom.runCalculation(results, calc);

% extract data from res.m and det.m files

if calc.isTest == false
    results = stom.getResults(results, calc);
    
    % save results
    saveResDir = fullfile(calc.saveDir,'Results');
    stom.saveResults(results, saveResDir, results.serpInp.name);
    
else
    results = NaN;
end



