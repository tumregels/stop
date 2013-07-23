function results = getResults(staged)

resmDir = [ staged.serpInpFullName '_res' ];

detmDir = [ staged.serpInpFullName '_det0' ];

saveResPar = [staged.saveResPar; getDefaultResPar];

resm = read_resm(resmDir, saveResPar);
detm = read_detm(detmDir);

results.resm = resm;
results.detm = detm;


function resm = read_resm(serpRes, saveResPar)

run(serpRes)

for i = 1:length(saveResPar)
    resm.(saveResPar{i}) = eval(saveResPar{i});
end


function detm = read_detm(serpDet)

run(serpDet)

saveDetPar = who('DET*');

for i = 1:length(saveDetPar)
    detm.(saveDetPar{i}) = eval(saveDetPar{i});
end


function defaultRes = getDefaultResPar()

defaultRes = {...
    'GC_UNI';...
    'GC_NE';...
    };

