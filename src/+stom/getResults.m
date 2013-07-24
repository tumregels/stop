function results = getResults(staged)

resmDir = [ staged.serpInpFullName '_res' ];

detmDir = [ staged.serpInpFullName '_det0' ];

saveResPar = [staged.saveResPar; getDefaultResPar];

resm = read_resm(resmDir, saveResPar);
detm = read_detm(detmDir);

results.resm = resm;
results.detm = detm;

%==========================================================================

function resm = read_resm(serpRes, saveResPar)

run(serpRes)

saveResPar = unique(saveResPar); % get unique cell array of parameters

[row col] = size(saveResPar);

for i = 1:row
    for j = 1:col
        p = saveResPar{i,j};
        if ~isempty(p)
            resm.(p) = eval(p);
        end
    end
end

%==========================================================================

function detm = read_detm(serpDet)

run(serpDet)

saveDetPar = who('DET*');

for i = 1:length(saveDetPar)
    detm.(saveDetPar{i}) = eval(saveDetPar{i});
end

%==========================================================================

function defaultRes = getDefaultResPar()

defaultRes = {...
    'GC_UNI';...
    'GC_NE';...
    };

