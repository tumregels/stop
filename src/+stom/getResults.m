function results = getResults(results, calc)

serpInpFullName = results.serpInp.fullname;

simStatus = stom.getSimComplStatus(serpInpFullName);

if simStatus == 0
    warning('MATLAB:simIncomplete',...
        'Simulation "%s_res.m" is not complete', serpInpFullName )
elseif simStatus == -1
    error('MATLAB:no_resmFile',...
        'Simulation "%s_res.m" does not exist', serpInpFullName )
end

saveResPar = unique([calc.saveResPar; getDefaultResPar]);

if exist([serpInpFullName '_res.m'],'file')==2
    results.res = read_res(serpInpFullName, saveResPar);
end

if exist([serpInpFullName '_det0.m'],'file')==2
    results.det = read_det(serpInpFullName);
end

if exist([serpInpFullName '_dep.m'],'file')==2
    results.dep = read_dep(serpInpFullName);
end

%==========================================================================

function res = read_res(serpInpFullName, saveResPar)

resFile = dir([serpInpFullName '_res.m']);

if numel(resFile) > 1
    error('stom:moreThanOneResFile',...
        'There must be only one _res.m file inside "%s" directory',path)
end

[row col] = size(saveResPar);

if col ~= 1
    error(['Wrong input in saveResPar',...
        'use ";" to separate variables',...
        'e.g. {''ANA_KEFF'';''IMP_KEFF''}']);
end

run([serpInpFullName '_res.m'])

gc_uni = unique(GC_UNI);
stepSize = length(gc_uni)-1;
ind = find(GC_UNI == 0);
burnupNum = length(ind);

for k = 1:burnupNum
    for i = 1:row
        par = saveResPar{i};
        value = eval(par);
        try
            res(k).(par) = value(ind(k):ind(k)+stepSize,:);
        catch exception
            [len_val,~] = size(value);
            len_uni = length(GC_UNI);
            if len_val~=len_uni
                warning(['Variable %s has length of %d.\n',...
                    'Expected length is %d. ',...
                    'Probably Serpent bug.'], par, len_val, len_uni)
            else
                throw(exception)
            end
        end
    end
end

%==========================================================================

function det = read_det(serpInpFullName)

% get _det*m file names
[path, name, ~] = fileparts(serpInpFullName);

det = dir([serpInpFullName '_det*.m']);
[detName{1:numel(det)}] = det.name;

for k = 1:numel(detName)
    fname = [name '_det' num2str(k-1) '.m'];
    idx = find(strcmp(detName, fname));
    detFullName{k} = fullfile(path,detName{idx}(1:end-2));% remove .m
end

% extract data from all _det*.m files which start with 'DET'
run(detFullName{1})
vars = who('DET*');


for i = 1:length(detFullName)
    
    run(detFullName{i});
    
    for j = 1:length(vars)
        
        det(i).FileName = name;
        det(i).(vars{j}) = eval(vars{j});

    end
    
    clear('-regexp', '^DET')
    
end
%==========================================================================

function dep = read_dep(serpInpFullName)

% get _dep.m file name

depName = dir([serpInpFullName '_dep.m']);

if numel(depName) > 1
    error('stom:moreThanOneDepFile',...
        'There must be only one _dep.m file inside "%s" directory',path)
end

run([serpInpFullName '_dep'])

var = whos('-regexp','^[BDTZNi]');
[varName{1:numel(var)}] = var.name;

for i = 1:length(varName)
    dep.(varName{i}) = eval(varName{i});
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
