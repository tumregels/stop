function [simStatus staged] = runCalculation(staged)

fullFileName = staged.serpInpFullName;

isSimComplete = getSimComplStatus(fullFileName);

if isSimComplete
    staged.simResults = 'Calculation exists and is complete';
    staged.isSimComplete = true;
    simStatus = true;
    return
else
    if staged.isTest
        [simStatus staged] = runTestCalc(staged);
    else
        [simStatus staged] = runCalc(staged);
    end
end

end
%==========================================================================
function status = getSimComplStatus(fullFileName)

resFile = [fullFileName '_res.m'];

if exist(resFile,'file')==2
    
    fid=fopen(resFile);
    assert(fid >= 3,['Could not open file: ' resFile])
    
    counter=1;
    while counter < 200
        line = fgetl(fid);
        expr = 'SIMULATION_COMPLETED.*=\s*(?<tf>[01])';
        [names match] = regexp(line,expr,'names','match');
        
        if ~cellfun(@isempty, match);
            status = str2num(names.tf);
            break
        end
        counter=counter+1;
    end
    
else
    status = 0; % file doesn't exist
end

end
%==========================================================================
function [simStatus staged] = runTestCalc(staged)

input = staged.serpInpFullName;
assert(exist(input,'file')==2,'MATLAB:assert:failed','File %s not found.', input)

% command = [staged.serpCallCommand ' ' input ' -testgeom 10000 -plot ;' ];
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

end
%==========================================================================
function [simStatus staged] = runCalc(staged)

input = staged.serpInpFullName;

assert(exist(input,'file')==2, 'MATLAB:assert:failed',...
    'File %s not found.', input)

% command = [staged.serpCallCommand ' ' input ' >' input '.serplog' ];
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

end