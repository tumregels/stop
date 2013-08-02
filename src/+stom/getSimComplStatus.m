function status = getSimComplStatus(fullFileName)

resFile = [fullFileName '_res.m'];

if exist(resFile,'file')==2
    
    simStatus = false;
    ts = 1; % time step
    
    while simStatus == false && ts <= 5
        
        status = getStatus(resFile);
        
        if status == 1 % simulation ready
            break
        elseif status == 0 % not ready
            % pause(12)
            ts = ts + 1;
        elseif status == -2
            error('STOM:noExprSIMULATION_COMPLETED',...
                ['Counldn''t find string: SIMULATION_COMPLETED \n'
                ' inside "%s_res.m" file'], serpInpFullName )
        end
        
    end
else
    status = -1; % resFile doesn't exist
end

%==========================================================================

function status = getStatus(fileName)

fid=fopen(fileName);

assert(fid >= 3,['Could not open file: ' fileName])

counter = 1;
nlines = 100; % number of lines to check inside file

while counter < nlines && ~feof(fid)
    
    line = fgetl(fid);
    expr = 'SIMULATION_COMPLETED.*=\s*(?<tf>[01])';
    [names match] = regexp(line,expr,'names','match');
    
    if ~cellfun(@isempty, match);
        status = logical(str2double(names.tf));
        break
    end
    
    counter=counter+1;
    
end

fclose(fid);

if ~exist('status','var')
    status = -2; % SIMULATION_COMPLETED string not found
end

