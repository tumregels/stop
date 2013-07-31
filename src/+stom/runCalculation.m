function [simStatus staged] = runCalculation(staged)

fullFileName = staged.serpInpFullName;

isSimComplete = stom.getSimComplStatus(fullFileName);

if isSimComplete == true
    staged.simResults = 'Simulation exists and is complete';
    staged.isSimComplete = true;
    simStatus = true;
    
    warning('MATLAB:simExist',...
        'Simulation "%s" exists and is complete', [fullFileName '_res.m'])
    return
else
    if staged.isTest
        [simStatus staged] = runTestCalc(staged);
    else
        [simStatus staged] = runCalc(staged);
    end
end

%==========================================================================

function [simStatus staged] = runTestCalc(staged)

input = staged.serpInpFullName;
assert(exist(input,'file')==2,'MATLAB:assert:failed','File %s not found.', input)

command = [staged.serpCallCommand ' ' input ' -testgeom 10000 -plot '...
    ' 2>&1 | tee -a ' input '.serplog ;'];

[~, results] = system(command);

ind = strfind(results,' error ');

if isempty(ind)
    simStatus = true;    
    staged.simResults = results;
else
    simStatus = false;
    staged.simError = results(ind(1):end);
end

staged.isSimComplete = simStatus;

%==========================================================================

function [simStatus staged] = runCalc(staged)

input = staged.serpInpFullName;

assert(exist(input,'file')==2, 'MATLAB:assert:failed',...
    'File %s not found.', input)

command = [staged.serpCallCommand ' ' input ...
    ' 2>&1 | tee -a ' input '.serplog ; ( exit ${PIPESTATUS} )'];

[st, results] = system(command);

if st == 0
    ind = strfind(results,'Finished ');
    staged.simResults = results(ind(1):end);
    simStatus = true;
else
    ind = strfind(results,' error ');
    staged.simError = results(ind(1):end);
    simStatus = false;
end

staged.isSimComplete = simStatus;

