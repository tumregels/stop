function test_suite = test_stom_runCalculation

initTestSuite;

%==========================================================================

function calc = setup
% setup data path for test
serp_exe_path = 'sss1118';
sss_jeff31_path = '/home/asikth/Documents/xsdata/jeff31/sss_jeff31.xsdata';
stop_path = '/home/asikth/Documents/S2P/stop/';

fullpath = mfilename('fullpath');
[path name ~] = fileparts(fullpath);
testdatafullpath = fullfile(path, ['data_' name]);
str = fileread(fullfile(testdatafullpath, 'fuelpin.spi'));
str = strrep(str,'sss_jeff31.xsdata',sss_jeff31_path);

fname = fullfile(testdatafullpath, 'test_fuelpin.spi');
fid = fopen(fname, 'w');
fwrite(fid, str);
fclose(fid);

calc.serpExe = serp_exe_path;
calc.serpParInp.dir = testdatafullpath;
calc.serpParInp.name = 'test_fuelpin.spi';
calc.serpParInp.file = str;
calc.stopDir = stop_path;
addpath(genpath(calc(1).stopDir));

calc.isTest  = false;
calc.isContinue = false;
calc.isEcho = true;

calc.values = struct('TITLE','fuelpin1',...
    'HEXR',0.60,'FH',0, 'FDC',1.0,'VG',0.01);
calc.name = 'ref';

%==========================================================================

function teardown(calc)
% delete data
delete([calc.serpParInp.dir filesep calc.serpParInp.name])
clearvars calc;

%==========================================================================

function test1(calc)

[~, serpInpLog] = stom.makeSerpInp(calc);
assertEqual(size(serpInpLog),[10 3])

%==========================================================================

function test2(calc)

calc.values = struct('TITLE','fuelpin1',...
    'HEXR',0.60,'FH',0, 'FDC',1.0);% 'VG' deleted
f = @() stom.makeSerpInp(calc);
assertExceptionThrown(f ,'stom:wrongSerpentInput')

%==========================================================================

function test3(calc)

str = calc.serpParInp.file;
str = strrep(str, 'VG>','VG');

fname = fullfile(calc.serpParInp.dir,calc.serpParInp.name);
fid = fopen(fname, 'w');
fwrite(fid, str);
fclose(fid);

f = @() stom.makeSerpInp(calc);
assertExceptionThrown(f ,'stom:makeSerpInp:WrongSerpentInput')


