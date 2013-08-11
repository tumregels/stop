function test_suite = test_stom_runCalculation

initTestSuite;

%==========================================================================

function staged = setup
% setup data path for test

fullpath = mfilename('fullpath');
[path name ext ] = fileparts(fullpath);
testdatafullpath = fullfile(path, ['data_' name]);
load([testdatafullpath filesep 'test_data_staged'])
staged.testdatafullpath = testdatafullpath;

%==========================================================================

function teardown(staged)
% delete data

clearvars staged;

%==========================================================================

function test_runTestCalcExist(staged)
% test for SIMULATION exists and is complete

staged.isTest = 0;
staged.serpInpFullName = ...
    [staged.testdatafullpath filesep 'testfuelpin1/fuelpin_1'];
[simStatus, staged] = stom.runCalculation(staged);

warning('off','stom:runCalculation');

assertEqual(staged.simResults,'Simulation exists and is complete')
assert(simStatus == 1)

warning('on','stom:runCalculation');


%==========================================================================

function test_runTestCalcIsTest(staged)
% test for genData.isTest = true;

staged.isTest = 1;
staged.serpInpFullName = ...
    [staged.testdatafullpath filesep 'testfuelpin2/fuelpin_1'];

[simStatus, staged] = stom.runCalculation(staged);

assert(simStatus == 1)

%==========================================================================

function test_runTestCalcInpError(staged)
% test for wrong serpent input when genData.isTest = true;

staged.isTest = 1;
staged.serpInpFullName = ...
    [staged.testdatafullpath filesep 'testfuelpin3/fuelpin_1'];

[simStatus, staged] = stom.runCalculation(staged);

assert(simStatus == 0)
assert(isempty(strfind(...
    staged.simError,'error in parameter "pin" on line 19'))==0)

%==========================================================================

function test_runCalcNoInput(staged)
% test for absence of serpent input when genData.isTest = false;

staged.isTest = 0;
staged.serpInpFullName = ...
    [staged.testdatafullpath filesep 'testfuelpin1/fuelpin_2'];
f = @() stom.runCalculation(staged);
assertExceptionThrown(f ,'MATLAB:assert:failed')

%==========================================================================

function test_runCalcInpError(staged)
% test for wrong serpent input when genData.isTest = false;

staged.isTest = 0;
staged.serpInpFullName = ...
    [staged.testdatafullpath filesep 'testfuelpin3/fuelpin_1'];
[simStatus, staged] = stom.runCalculation(staged);

assert(simStatus == 0)
assert(isempty(strfind(...
    staged.simError,'error in parameter "pin" on line 19'))==0)


