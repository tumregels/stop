function [simStatus results] = runCalculation(results, calc)

fullFileName = results.serpInp.fullname;

isSimComplete = stom.getSimComplStatus(fullFileName);

if isSimComplete == true && ~calc.isTest && calc.isContinue
    results.stdout = 'Simulation exists and is complete';
    results.isSimComplete = true;
    simStatus = true;
    
    warning('stom:runCalculation',...
        ['Simulation "%s" exists and is complete.\n',...
        'Retrieving results from the previous calculation.'],...
        [fullFileName '_res.m'])
    return
else
    if calc.isTest
        [simStatus results] = runTestCalc(results, calc);
    else
        [simStatus results] = runCalc(results, calc);
    end
end

%==========================================================================

function [simStatus results] = runTestCalc(results, calc)

input = results.serpInp.fullname;
assert(exist(input,'file')==2,'MATLAB:assert:failed','File %s not found.', input)

command = [calc.serpExe ' ' input ' -testgeom 10000 -plot '...
    ' 2>&1 | tee -a ' input '.serplog ;'];

[~, stdout] = system(command,'-echo');

ind = strfind(stdout,' error ');

if isempty(ind)
    simStatus = true;    
    results.stdout = stdout;
else
    simStatus = false;
    results.stdout = stdout(ind(1):end);
end

results.isSimComplete = simStatus;

%==========================================================================

function [simStatus results] = runCalc(results, calc)

input = results.serpInp.fullname;

assert(exist(input,'file')==2, 'MATLAB:assert:failed',...
    'File %s not found.', input)

command = [calc.serpExe ' ' input ...
    ' 2>&1 | tee -a ' input '.serplog ; ( exit ${PIPESTATUS} )'];

if calc.isEcho == true
    [st, stdout] = system(command,'-echo');
else
    [st, stdout] = system(command);
end

if st == 0
    simStatus = true;
    ind = strfind(stdout,'Finished ');
    results.stdout = stdout(ind(end):end);
    dispSerpentMessage(results.stdout);
else
    ind = strfind(stdout,' error ');
    if isempty(ind)
        ind = 1;
    end
    results.stdout = stdout(ind(end):end);
    simStatus = false;
    dispSerpentMessage(results.stdout);
    error('Wrong Serpent input file\n "%s".',input);
end

results.isSimComplete = simStatus;

%==========================================================================

function dispSerpentMessage(simResults)

s1 = '====SERPENT MESSAGE====';
s2 = simResults;
s3 = repmat('=',1,23);

fprintf(1,'\n%s\n%s%s\n', s1,s2,s3);


