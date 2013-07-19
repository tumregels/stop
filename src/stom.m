function stom(calc)

% vectorize the access to elements in a structure array
genData = [calc.genData];
inpPar = [calc.inpPar];

% read parametric input as text
fullFileName = fullfile(genData.serpParInpDir, genData.serpParInpName);
serpParInp = fileread(fullFileName);

% make input
[serpInput, serpInpLog] = stom.makeSerpInp(serpParInp, inpPar);

staged.serpInput   = serpInput;
staged.serpInpLog  = serpInpLog;
staged.serpInpName = genData.serpParInpName;
staged.calcNum     = genData.calcNum;
staged.saveDir     = genData.saveDir;
staged.isContinue  = genData.isContinue;
staged.isTest      = genData.isTest;

staged = stom.writeSerpFile(staged);

staged.serpCallCommand = genData.serpCallCommand;

[simStatus staged] = stom.runCalculation(staged);

% results = stom.readResults(staged)

% save results with append
