function test_suite = test_stom_getSimComplStatus

initTestSuite;

%==========================================================================

function testpath = setup
% setup data path for test

fullpath = mfilename('fullpath');
[path name ~ ] = fileparts(fullpath);
testpath = fullfile(path, ['data_' name]);

%==========================================================================

function test_simComplete_resm(testpath)
% test for SIMULATION_COMPLETED = 1

path = fullfile(testpath, 'test_1');
simStatus = stom.getSimComplStatus(path);
assertTrue(simStatus)

%==========================================================================

function test_simIncomplete_resm(testpath)
% test for SIMULATION_COMPLETED = 0

path = fullfile(testpath, 'test_2');
simStatus = stom.getSimComplStatus(path);
assertFalse(simStatus)

%==========================================================================

function test_noFile(testpath)
% test for no _res.m file

path = fullfile(testpath, 'test_N');
simStatus = stom.getSimComplStatus(path);
assertEqual(simStatus, -1)

%==========================================================================

function test_noSimComplExpression(testpath)
% test for SIMULATION_COMPLETED string not found

path = fullfile(testpath, 'test_3');
f = @() stom.getSimComplStatus(path);
assertExceptionThrown(f ,'MATLAB:catenate:dimensionMismatch')
