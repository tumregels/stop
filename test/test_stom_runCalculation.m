function test_suite = test_stom_runCalculation
initTestSuite;
end

function staged = setup

fullpath = mfilename('fullpath');
[path name ext ] = fileparts(fullpath);
testdatafullpath = fullfile(path, ['data_' name]);
load([testdatafullpath filesep 'test_data_staged'])
staged.testdatafullpath = testdatafullpath;

end

function teardown(staged)

%delete([staged.serpInpFullName '_res.m'])
clearvars staged;

end

function test_runTestCalcExist(staged)

staged.isTest = 0;
staged.serpInpFullName = ...
    [staged.testdatafullpath filesep 'testfuelpin1/fuelpin_1'];
[simStatus, staged] = stom.runCalculation(staged);

assertEqual(staged.simResults,'Calculation exists and is complete')
assert(simStatus == 1)

end

function test_runTestCalcIsTest(staged)

staged.isTest = 1;
staged.serpInpFullName = ...
    [staged.testdatafullpath filesep 'testfuelpin2/fuelpin_1'];
% delete([staged.serpInpFullName '_res.m'])
[simStatus, staged] = stom.runCalculation(staged);

assert(simStatus == 1)

end

function test_runTestCalcInpError(staged)

staged.isTest = 1;
staged.serpInpFullName = ...
    [staged.testdatafullpath filesep 'testfuelpin3/fuelpin_1'];
% delete([staged.serpInpFullName '_res.m'])
[simStatus, staged] = stom.runCalculation(staged);

assert(simStatus == 0)
assert(isempty(strfind(...
    staged.simError,'error in parameter "pin" on line 19'))==0)

end

function test_runCalcNoInput(staged)

staged.isTest = 0;
staged.serpInpFullName = ...
    [staged.testdatafullpath filesep 'testfuelpin1/fuelpin_2'];
f = @() stom.runCalculation(staged);
assertExceptionThrown(f ,'MATLAB:assert:failed')

end

function test_runCalcInpError(staged)

staged.isTest = 0;
staged.serpInpFullName = ...
    [staged.testdatafullpath filesep 'testfuelpin3/fuelpin_1'];
[simStatus, staged] = stom.runCalculation(staged);

assert(simStatus == 0)
assert(isempty(strfind(...
    staged.simError,'error in parameter "pin" on line 19'))==0)

end
