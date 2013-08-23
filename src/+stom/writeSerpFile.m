function results = writeSerpFile(results, calc)

serpInput = results.serpInp.file;
isContinue = calc.isContinue;

[calcDir serpInpName] = makeNames(calc.serpParInp.name, ...
                                calc.name, ...
                                calc.saveDir);
                            
                         
serpInpFullName = fullfile(calcDir, serpInpName);

if exist(serpInpFullName, 'file') == 2 && isContinue
    created = false;
else
    if(~exist(calcDir, 'dir')) % make dir if it doesn't exist
        mkdir(calcDir);
    end
    writeFile(serpInpFullName, serpInput)
    created = true;
end

results.serpInp.name = serpInpName;
results.serpInp.dir = calcDir;
results.serpInp.fullname = serpInpFullName;

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



