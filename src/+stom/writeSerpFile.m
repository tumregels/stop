function staged = writeSerpFile(staged)

serpInput = staged.serpInput;
isContinue = staged.isContinue;

[calcDir serpInpName] = makeNames(staged.serpInpName, ...
                                staged.calcNum, ...
                                staged.saveDir);
                            
                         
serpInpFullName = fullfile(calcDir, serpInpName);

if exist(serpInpFullName, 'file') == 2 && isContinue
    created = false;
else
    mkdir(calcDir)
    writeFile(serpInpFullName, serpInput)
    created = true;
end

staged.serpInpName = serpInpName;
staged.calcDir = calcDir;
staged.serpInpFullName = serpInpFullName;
staged.created = created;

%==========================================================================

function writeFile(fullFileName, serpInput)

fid = fopen(fullFileName, 'w');
assert(fid ~= -1)

count = fwrite(fid, serpInput);
assert(count == length(serpInput));

status = fclose(fid);
assert(status == 0)

%==========================================================================

function [calcDir serpInpName] = makeNames(serpInpName, calcNum, saveDir)

[~, serpInpName, ~] = fileparts(serpInpName);

calcDir = [saveDir filesep serpInpName num2str(calcNum)];
serpInpName = [serpInpName '_' num2str(calcNum)];

end


