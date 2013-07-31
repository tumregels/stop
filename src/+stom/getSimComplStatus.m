function status = getSimComplStatus(fullFileName)

resFile = [fullFileName '_res.m'];

if exist(resFile,'file')==2
    
    simStatus = false;
    ts = 1; % time step
    
    while simStatus == false && ts <= 5
        
        status = getStatus(resFile);
        
        if status == 1
            break
        else
            pause(12)
            ts = ts + 1;
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

while counter < nlines
    
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