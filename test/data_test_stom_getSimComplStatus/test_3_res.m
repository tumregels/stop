
% Increase counter:

if (exist('idx', 'var'));
  idx = idx + 1;
else;
  idx = 1;
end;

% Version, title and date:

VERSION                   (idx, [1: 14])  = 'Serpent 1.1.18' ;
TITLE                     (idx, [1: 51])  = 'FPburn    Sodium cooled pin cell with (U,Pu)O2 fuel' ;
DATE                      (idx, [1: 24])  = 'Tue Jul 16 18:52:02 2013' ;

% Run parameters:

POP                       (idx, 1)        = 1000 ;
CYCLES                    (idx, 1)        = 50 ;
SKIP                      (idx, 1)        = 20 ;
SRC_NORM_MODE             (idx, 1)        = 1 ;
SEED                      (idx, 1)        = 1373993522 ;
MPI_TASKS                 (idx, 1)        = 1 ;
MPI_MODE                  (idx, 1)        = 0 ;
DEBUG                     (idx, 1)        = 0 ;
CPU_TYPE                  (idx, [1: 39])  = 'Intel(R) Core(TM) i7-2600 CPU @ 3.40GHz' ;
CPU_MHZ                   (idx, 1)        = 1600.0 ;
AVAIL_MEM                 (idx, 1)        = 7985.4 ;

% File paths:

XS_DATA_FILE_PATH         (idx, [1: 54])  = '/home/asikth/Documents/xsdata/jeff31/sss_jeff31.xsdata' ;
DECAY_DATA_FILE_PATH      (idx, [1:  3])  = 'N/A' ;
NFY_DATA_FILE_PATH        (idx, [1:  3])  = 'N/A' ;

% Delta-tracking parameters:

DT_THRESH                 (idx, 1)        = 9.00000E-01 ;
DT_FRAC                   (idx, 1)        = 8.01780E-01 ;
DT_EFF                    (idx, 1)        = 4.27429E-01 ;
MIN_MACROXS               (idx, 1)        = 1.75948E-01 ;

% Run statistics:

TOT_CPU_TIME              (idx, 1)        = 4.12833E-01 ;
RUNNING_TIME              (idx, 1)        = 4.14317E-01 ;
CPU_USAGE                 (idx, 1)        = 0.99642 ;
INIT_TIME                 (idx, 1)        = 4.10000E-02 ;
TRANSPORT_CYCLE_TIME      (idx, 1)        = 3.72850E-01 ;
BURNUP_CYCLE_TIME         (idx, 1)        = 0.00000E+00 ;
PROCESS_TIME              (idx, 1)        = 4.66665E-04 ;
CYCLE_IDX                 (idx, 1)        = 50 ;
SOURCE_NEUTRONS           (idx, 1)        = 50000 ;
MEAN_POP_SIZE             (idx, [1:  2])  = [  1.00000E+03 0.00000 ];
MEMSIZE                   (idx, 1)        = 209.5;



