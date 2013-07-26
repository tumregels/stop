function results = getResults(staged)

serpInpFullName = staged.serpInpFullName;

resmDir = [ serpInpFullName '_res' ];
detmDir = [ serpInpFullName '_det0' ];

saveResPar = unique([staged.saveResPar; getDefaultResPar]);

resm = read_resm(resmDir, saveResPar);
detm = read_detm(detmDir);

results.resm = resm;
results.detm = detm;
results.serpInput = staged.serpInput;
results.inpPar = staged.inpPar;
results.serpInpName = staged.serpInpName;

%==========================================================================

function resm = read_resm(serpRes, saveResPar)

run(serpRes)

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

% return list of parameters necessary to create XSEC card

defaultRes = {...
    'ADFS';
    'ADFC';
    'BETA_EFF';
    'BETA_ZERO';
    'CHI';
    'CHID';
    'DECAY_CONSTANT';
    'FISSXS';
    'FISSE';
    'GC_UNI';
    'GC_NE';
    'GPRODXS';
    'NSF';
    'P1_TRANSPXS';
    'PRECURSOR_GROUPS';
    'RABSXS';
    'RECIPVEL';
    };

