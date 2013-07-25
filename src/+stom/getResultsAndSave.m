function results = getResultsAndSave(staged)

serpInpFullName = staged.serpInpFullName;

resmDir = [ serpInpFullName '_res' ];
detmDir = [ serpInpFullName '_det0' ];

saveResPar = [staged.saveResPar; getDefaultResPar];

resm = read_resm(resmDir, saveResPar);
detm = read_detm(detmDir);

results.resm = resm;
results.detm = detm;
results.serpInput = staged.serpInput;
results.inpPar = staged.inpPar;
results.serpInpName = staged.serpInpName;

saveResults(results, staged.saveDir)

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

function saveResults(results, saveDir)

resultsDir = fullfile(saveDir,'Results');

if(~exist(resultsDir, 'dir'))
    mkdir(resultsDir);
end

var = genvarname(results.serpInpName);
eval([var '= results']);
save([resultsDir filesep var]);


%==========================================================================

function defaultRes = getDefaultResPar()

defaultRes = {...
    'GC_UNI';...
    'GC_NE';...
    };

