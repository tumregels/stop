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

saveResPar = unique([staged.saveResPar; getDefaultResPar]);

[resFullName detFullNames depFullName] = getFileNames(serpInpFullName);

results.res = read_res(resFullName, saveResPar);
results.det = read_det(detFullNames);
results.dep = read_dep(depFullName);

results.serpInput = staged.serpInput;
results.inpPar = staged.inpPar;
results.serpInpName = staged.serpInpName;

%==========================================================================

function res = read_res(serpResFile, saveResPar)

[pathstr, name, ~] = fileparts(serpResFile);
run([pathstr filesep name])

uniMat = reshape(GC_UNI,length(unique(GC_UNI)),[]);
[uniNum, burnupNum] = size(uniMat);
ind = find(GC_UNI == 0);
[row col] = size(saveResPar);

if col ~= 1
    error(['Wrong input in saveResPar',...
        'use ";" to separate variables',...
        'e.g. {''ANA_KEFF'';''IMP_KEFF''}']);
end

for k = 1:burnupNum
    for i = 1:row
        par = saveResPar{i};
        value = eval(par);
        try
            res(k).(par) = value(ind(k):ind(k)+uniNum-1,:);
        catch exception
            len_val = length(value);
            len_uni = length(GC_UNI);
            if len_val~=len_uni
                warning(['Variable %s has length of %d.\n',...
                    'Expected length is %d. ',...
                    'Probably a Serpent Bug'], par, len_val, len_uni)
            else
                throw(exception)
            end
        end
    end
end

%==========================================================================

function det = read_det(detFullNames)

[path, name, ~] = fileparts(detFullNames{1});
run([path filesep name])
vars = who('DET*');


for i = 1:length(detFullNames)
    
    [path, name, ~] = fileparts(detFullNames{i});
    run([path filesep name]);
    
    for j = 1:length(vars)
        
        det(i).FileName = name;
        det(i).(vars{j}) = eval(vars{j});

    end
    
    clear('-regexp', '^DET')
end
%==========================================================================

function dep = read_dep(depFullName)

[path, name, ~] = fileparts(depFullName);
run([path filesep name])

dep.FileName = name;
var = whos('-regexp','^[BDTZNi]');
[varName{1:numel(var)}] = var.name;

for i = 1:length(varName)
    dep.(varName{i}) = eval(varName{i});
end


%==========================================================================

function [resFullName detFullName depFullName] = getFileNames(serpInpFullName)

[path, name, ~] = fileparts(serpInpFullName);

% get _det*m file names
det = dir(fullfile(path, [name '_det*.m']));
[detName{1:numel(det)}] = det.name;

for k = 1:numel(detName)
    fname = [name '_det' num2str(k-1) '.m'];
    idx = find(strcmp(detName, fname));
    detFullName{k} = fullfile(path,detName{idx});
end

% get _res.m file name
resName = dir(fullfile(path, [name '_res.m']));

if numel(resName) == 1
    resFullName = fullfile(path, resName.name);
elseif numel(resName) > 1
    error('stom:moreThanOneResFile',...
        'There must be only one _res.m file inside "%s" directory',path)
end


% get _dep.m file name
depName = dir(fullfile(path, [name '_dep.m']));

if numel(depName) == 1
    depFullName = fullfile(path, depName.name);
elseif numel(depName) > 1
    error('stom:moreThanOneDepFile',...
        'There must be only one _dep.m file inside "%s" directory',path)
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
