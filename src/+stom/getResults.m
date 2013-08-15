function results = getResults(staged)

serpInpFullName = staged.serpInpFullName;

simStatus = stom.getSimComplStatus(serpInpFullName);

if simStatus == 0
    warning('MATLAB:simIncomplete',...
        'Simulation "%s_res.m" is not complete', serpInpFullName )
elseif simStatus == -1
    error('MATLAB:no_resmFile',...
        'Simulation "%s_res.m" does not exist', serpInpFullName )
end

resmFileName = [ serpInpFullName '_res.m' ];
detmFileName = [ serpInpFullName '_det0.m' ];

saveResPar = unique([staged.saveResPar; getDefaultResPar]);

resm = read_resm(resmFileName, saveResPar);

if exist(detmFileName,'file')==2
    detm = read_detm(detmFileName);
else
    detm = [];
end

results.resm = resm;
results.detm = detm;
results.serpInput = staged.serpInput;
results.inpPar = staged.inpPar;
results.serpInpName = staged.serpInpName;

%==========================================================================

function resm = read_resm(serpResFile, saveResPar)

[pathstr, name, ~] = fileparts(serpResFile);
run([pathstr filesep name])

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

[pathstr, name, ~] = fileparts(serpDet);
run([pathstr filesep name])

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

