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

[row col] = size(saveResPar);

for i = 1:row
    for j = 1:col
        resm.(saveResPar{i,j}) = eval(saveResPar{i,j});
    end
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

