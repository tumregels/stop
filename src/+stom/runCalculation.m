function [simStatus staged] = runCalculation(staged)

fullFileName = staged.serpInpFullName;

isSimComplete = stom.getSimComplStatus(fullFileName);

if isSimComplete == true && ~staged.isTest && staged.isContinue
    staged.simResults = 'Simulation exists and is complete';
    staged.isSimComplete = true;
    simStatus = true;
    
    warning('stom:runCalculation',...
        ['Simulation "%s" exists and is complete.\n',...
        'Retrieving results from the previous calculation.'],...
        [fullFileName '_res.m'])
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

[~, results] = system(command,'-echo');

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

if staged.isEcho == true
    [st, results] = system(command,'-echo');
else
    [st, results] = system(command);
end

if st == 0
    simStatus = true;
    ind = strfind(results,'Finished ');
    staged.simResults = results(ind(end):end);
    dispSerpentMessage(staged.simResults);
else
    ind = strfind(results,' error ');
    staged.simError = results(ind(end):end);
    simStatus = false;
    dispSerpentMessage(staged.simError);
    error('Wrong Serpent input file\n "%s".',input);
end

staged.isSimComplete = simStatus;

%==========================================================================

function dispSerpentMessage(simResults)

s1 = '====SERPENT MESSAGE====';
s2 = simResults;
s3 = repmat('=',1,23);

fprintf(1,'\n%s\n%s%s\n', s1,s2,s3);


