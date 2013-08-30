function [simStatus results] = stom(calc)

% make input template
[serpInput, serpInpLog] = stom.makeSerpInp(calc);

% write input template to file
results.serpInp.file = serpInput;
results.serpInp.log = serpInpLog;
results.serpInp.values = calc.values(1);

results = stom.writeSerpFile(results, calc);

[simStatus results] = stom.runCalculation(results, calc);

if calc.isTest == false
    % extract data from _res*.m _det*.m and _dep.m files
    results = stom.getResults(results, calc);
    % save results
    stom.saveResults(results, calc.serpParInp.dir, results.serpInp.name);
else
    results = NaN;
end



