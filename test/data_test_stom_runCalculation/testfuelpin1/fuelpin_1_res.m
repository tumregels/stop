
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
SIMULATION_COMPLETED      (idx, 1)        = 1 ;

% Energy grid parameters:

ERG_EMIN                  (idx, 1)        = 1.00000E-11 ;
ERG_EMAX                  (idx, 1)        = 2.00000E+01 ;
ERG_TOL                   (idx, 1)        = 1.00000E-05 ;
ERG_NE                    (idx, 1)        = 140218 ;
ERG_NE_INI                (idx, 1)        = 159443 ;
ERG_NE_IMP                (idx, 1)        = 25889 ;
ERG_DIX                   (idx, 1)        = 0 ;
USE_DBRC                  (idx, 1)        = 0 ;
URES_MODE                 (idx, 1)        = 1 ;
URES_DILU_CUT             (idx, 1)        = 0.00000E+00 ;
URES_EMIN                 (idx, 1)        = 1.00000E+37 ;
URES_EMAX                 (idx, 1)        = -1.00000E+37 ;
URES_AVAIL                (idx, 1)        = 0 ;
URES_USED                 (idx, 1)        = 0 ;

% Nuclides and reaction channels:

TOT_ISOTOPES              (idx, 1)        = 17 ;
TOT_TRANSPORT_ISOTOPES    (idx, 1)        = 17 ;
TOT_DECAY_ISOTOPES        (idx, 1)        = 0 ;
TOT_REA_CHANNELS          (idx, 1)        = 748 ;
TOT_TRANSMU_REA           (idx, 1)        = 0 ;

% Reaction mode counters:

COLLISIONS                (idx, 1)        = 2531617 ;
FISSION_FRACTION          (idx, 1)        = 8.99662E-03 ;
CAPTURE_FRACTION          (idx, 1)        = 9.96754E-03 ;
ELASTIC_FRACTION          (idx, 1)        = 9.50299E-01 ;
INELASTIC_FRACTION        (idx, 1)        = 3.06836E-02 ;
ALPHA_FRACTION            (idx, 1)        = 0.00000E+00 ;
BOUND_SCATTERING_FRACTION (idx, 1)        = 0.00000E+00 ;
NXN_FRACTION              (idx, 1)        = 5.37206E-05 ;
UNKNOWN_FRACTION          (idx, 1)        = 0.00000E+00 ;
VIRTUAL_FRACTION          (idx, 1)        = 5.72571E-01 ;

FREEGAS_FRACTION          (idx, 1)        = 2.67484E-02 ;
TOTAL_ELASTIC_FRACTION    (idx, 1)        = 9.50299E-01 ;
FISSILE_FISSION_FRACTION  (idx, 1)        = 7.79022E-01 ;
LEAKAGE_REACTIONS         (idx, 1)        = 2126 ;

REA_SAMPLING_EFF          (idx, 1)        = 3.40049E-01 ;

% Slowing-down and thermalization:

COL_SLOW                  (idx, [1:   2]) = [  1.85099E+02 0.02179 ];
COL_THERM                 (idx, [1:   2]) = [  1.56660E+01 0.04604 ];
COL_TOT                   (idx, [1:   2]) = [  4.80694E+01 0.00406 ];
SLOW_TIME                 (idx, [1:   2]) = [  2.83204E-04 0.02413 ];
THERM_TIME                (idx, [1:   2]) = [  2.51718E-04 0.05277 ];
SLOW_DIST                 (idx, [1:   2]) = [  1.81603E+02 0.02807 ];
THERM_DIST                (idx, [1:   2]) = [  5.68181E+01 0.04308 ];
THERM_FRAC                (idx, [1:   2]) = [  7.14000E-03 0.05156 ];

% Parameters for burnup calculation:

BURN_MODE                 (idx, 1)        = 2 ;
BURN_STEP                 (idx, 1)        = 1 ;
BURN_TOT_STEPS            (idx, 1)        = 1 ;
BURNUP                    (idx, 1)        = 0.00000E+00 ;
BURN_DAYS                 (idx, 1)        = 0.00000E+00 ;
ENERGY_OUTPUT             (idx, 1)        = 0.00000E+00 ;
DEP_TTA_CUTOFF            (idx, 1)        = 1.00000E-15 ;
DEP_STABILITY_CUTOFF      (idx, 1)        = 1.00000E-22 ;
DEP_FP_YIELD_CUTOFF       (idx, 1)        = 1.00000E-22 ;
DEP_XS_FRAC_CUTOFF        (idx, 1)        = 0.00000E+00 ;
DEP_XS_ENERGY_CUTOFF      (idx, 1)        = -1.00000E+00 ;
BURN_MATERIALS            (idx, 1)        = 0 ;
FP_NUCLIDES_INCLUDED      (idx, 1)        = 0 ;
FP_NUCLIDES_AVAILABLE     (idx, 1)        = 0 ;
TOT_ACTIVITY              (idx, 1)        = 0.00000E+00 ;
TOT_DECAY_HEAT            (idx, 1)        = 0.00000E+00 ;
TOT_SF_RATE               (idx, 1)        = 0.00000E+00 ;
ACTINIDE_ACTIVITY         (idx, 1)        = 0.00000E+00 ;
ACTINIDE_DECAY_HEAT       (idx, 1)        = 0.00000E+00 ;
FISSION_PRODUCT_ACTIVITY  (idx, 1)        = 0.00000E+00 ;
FISSION_PRODUCT_DECAY_HEAT(idx, 1)        = 0.00000E+00 ;

% Fission source entropies:

ENTROPY_X                 (idx, [1:   2]) = [  8.46810E-01 0.00258 ];
ENTROPY_Y                 (idx, [1:   2]) = [  7.17737E-01 0.00274 ];
ENTROPY_Z                 (idx, [1:   2]) = [  3.47807E-01 0.00804 ];
ENTROPY_TOT               (idx, [1:   2]) = [  6.19949E-01 0.00185 ];

% Fission source centre:

SOURCE_X0                 (idx, [1:   2]) = [  4.67314E-03 0.30226 ];
SOURCE_Y0                 (idx, [1:   2]) = [ -2.22805E-03 0.64794 ];
SOURCE_Z0                 (idx, [1:   2]) = [  4.21784E-01 0.55597 ];

% Criticality eigenvalues:

ANA_KEFF                  (idx, [1:   2]) = [  1.33980E+00 0.00457 ];
IMP_KEFF                  (idx, [1:   2]) = [  1.34352E+00 0.00210 ];
COL_KEFF                  (idx, [1:   2]) = [  1.34967E+00 0.00294 ];
ABS_KEFF                  (idx, [1:   2]) = [  1.34352E+00 0.00210 ];
ABS_KINF                  (idx, [1:   2]) = [  1.40290E+00 0.00207 ];
ABS_GC_KEFF               (idx, [1:   2]) = [  0.00000E+00 0.0E+00 ];
ABS_GC_KINF               (idx, [1:   2]) = [  0.00000E+00 0.0E+00 ];
IMPL_ALPHA_EIG            (idx, [1:   2]) = [  0.00000E+00 0.0E+00 ];
FIXED_ALPHA_EIG           (idx, [1:   2]) = [  0.00000E+00 0.0E+00 ];
GEOM_ALBEDO               (idx, [1:   2]) = [  1.00000E+00 0.0E+00 ];

% Normalized total reaction rates:

TOT_POWER                 (idx, [1:   2]) = [  4.00000E+02 0.0E+00 ];
TOT_GENRATE               (idx, [1:   2]) = [  3.52578E+13 0.00041 ];
TOT_FISSRATE              (idx, [1:   2]) = [  1.19749E+13 8.3E-06 ];
TOT_ABSRATE               (idx, [1:   2]) = [  2.52011E+13 0.00203 ];
TOT_LEAKRATE              (idx, [1:   2]) = [  1.11129E+12 0.02281 ];
TOT_LOSSRATE              (idx, [1:   2]) = [  2.63124E+13 0.00209 ];
TOT_SRCRATE               (idx, [1:   2]) = [ -3.37402E+10 5.11409 ];
TOT_FLUX                  (idx, [1:   2]) = [  7.00358E+15 0.00609 ];
TOT_RR                    (idx, [1:   2]) = [  1.32308E+15 0.00331 ];
TOT_SOLU_ABSRATE          (idx, [1:   2]) = [  0.00000E+00 0.0E+00 ];

TOT_FMASS                 (idx, 1)        = 5.36252E-03 ;
TOT_POWDENS               (idx, [1:   2]) = [  7.45918E-02 0.00000 ];


% Point-kinetic parameters:

ANA_PROMPT_LIFETIME       (idx, [1:   2]) = [  7.50294E-06 0.03095 ];
IMPL_PROMPT_LIFETIME      (idx, [1:   2]) = [  0.00000E+00 0.0E+00 ];
ANA_REPROD_TIME           (idx, [1:   2]) = [  5.60565E-06 0.03130 ];
IMPL_REPROD_TIME          (idx, [1:   2]) = [  0.00000E+00 0.0E+00 ];
DELAYED_EMTIME            (idx, [1:   2]) = [  1.12860E+01 0.16663 ];

% Six-factor formula:

SIX_FF_ETA                (idx, [1:   2]) = [  8.30277E-01 0.21523 ];
SIX_FF_F                  (idx, [1:   2]) = [  9.18341E-02 0.18364 ];
SIX_FF_P                  (idx, [1:   2]) = [  6.30382E-03 0.05296 ];
SIX_FF_EPSILON            (idx, [1:   2]) = [  1.42456E+02 0.21194 ];
SIX_FF_LF                 (idx, [1:   2]) = [  9.58060E-01 0.00101 ];
SIX_FF_LT                 (idx, [1:   2]) = [  9.99395E-01 0.00011 ];
SIX_FF_KINF               (idx, [1:   2]) = [  4.51636E-01 0.20839 ];
SIX_FF_KEFF               (idx, [1:   2]) = [  4.32187E-01 0.20840 ];

% Delayed neutron parameters:

USE_DELNU                 (idx, 1)        = 1 ;
PRECURSOR_GROUPS          (idx, 1)        = 8 ;
BETA_EFF                  (idx, [1:  18]) = [  4.49657E-03 0.09913  3.18326E-05 0.95439  9.02290E-04 0.29013  2.90591E-04 0.33805  6.78973E-04 0.20034  1.40791E-03 0.17718  5.61981E-04 0.22072  4.75637E-04 0.26758  1.47355E-04 0.36214 ];
BETA_ZERO                 (idx, [1:  18]) = [  4.71903E-03 0.00494  8.02728E-05 0.03642  7.56602E-04 0.02245  2.86899E-04 0.02932  7.05501E-04 0.00787  1.45956E-03 0.00773  6.53847E-04 0.03992  5.34240E-04 0.01291  2.42103E-04 0.04796 ];
DECAY_CONSTANT            (idx, [1:  18]) = [  4.70437E-01 0.12315  1.24667E-02 0.0E+00  2.82917E-02 0.0E+00  4.25244E-02 0.0E+00  1.33042E-01 0.0E+00  2.92467E-01 0.0E+00  6.66488E-01 6.6E-09  1.63478E+00 0.0E+00  3.55460E+00 0.0E+00 ];

% Parameters for group constant generation

GC_UNI                    (idx, 1)        = 0 ;
GC_SYM                    (idx, 1)        = 0 ;
GC_NE                     (idx, 1)        = 2 ;
GC_BOUNDS                 (idx, [1:   3]) = [  2.00000E+01  6.25000E-07  1.00000E-11 ];
GC_REMXS_INCLUDE_MULT     (idx, 1)        = 1 ;

% Few-group cross sections:

FLUX                      (idx, [1:   6]) = [  0.00000E+00 0.0E+00  0.00000E+00 0.0E+00  0.00000E+00 0.0E+00 ];
LEAK                      (idx, [1:   6]) = [  0.00000E+00 0.0E+00  0.00000E+00 0.0E+00  0.00000E+00 0.0E+00 ];
TOTXS                     (idx, [1:   6]) = [  0.00000E+00 0.0E+00  0.00000E+00 0.0E+00  0.00000E+00 0.0E+00 ];
FISSXS                    (idx, [1:   6]) = [  0.00000E+00 0.0E+00  0.00000E+00 0.0E+00  0.00000E+00 0.0E+00 ];
CAPTXS                    (idx, [1:   6]) = [  0.00000E+00 0.0E+00  0.00000E+00 0.0E+00  0.00000E+00 0.0E+00 ];
ABSXS                     (idx, [1:   6]) = [  0.00000E+00 0.0E+00  0.00000E+00 0.0E+00  0.00000E+00 0.0E+00 ];
RABSXS                    (idx, [1:   6]) = [  0.00000E+00 0.0E+00  0.00000E+00 0.0E+00  0.00000E+00 0.0E+00 ];
ELAXS                     (idx, [1:   6]) = [  0.00000E+00 0.0E+00  0.00000E+00 0.0E+00  0.00000E+00 0.0E+00 ];
INELAXS                   (idx, [1:   6]) = [  0.00000E+00 0.0E+00  0.00000E+00 0.0E+00  0.00000E+00 0.0E+00 ];
SCATTXS                   (idx, [1:   6]) = [  0.00000E+00 0.0E+00  0.00000E+00 0.0E+00  0.00000E+00 0.0E+00 ];
SCATTPRODXS               (idx, [1:   6]) = [  0.00000E+00 0.0E+00  0.00000E+00 0.0E+00  0.00000E+00 0.0E+00 ];
N2NXS                     (idx, [1:   6]) = [  0.00000E+00 0.0E+00  0.00000E+00 0.0E+00  0.00000E+00 0.0E+00 ];
REMXS                     (idx, [1:   6]) = [  0.00000E+00 0.0E+00  0.00000E+00 0.0E+00  0.00000E+00 0.0E+00 ];
NUBAR                     (idx, [1:   6]) = [  0.00000E+00 0.0E+00  0.00000E+00 0.0E+00  0.00000E+00 0.0E+00 ];
NSF                       (idx, [1:   6]) = [  0.00000E+00 0.0E+00  0.00000E+00 0.0E+00  0.00000E+00 0.0E+00 ];
RECIPVEL                  (idx, [1:   6]) = [  0.00000E+00 0.0E+00  0.00000E+00 0.0E+00  0.00000E+00 0.0E+00 ];
FISSE                     (idx, [1:   6]) = [  0.00000E+00 0.0E+00  0.00000E+00 0.0E+00  0.00000E+00 0.0E+00 ];

% Fission spectra:

CHI                       (idx, [1:   4]) = [  0.00000E+00 0.0E+00  0.00000E+00 0.0E+00 ];
CHIP                      (idx, [1:   4]) = [  0.00000E+00 0.0E+00  0.00000E+00 0.0E+00 ];
CHID                      (idx, [1:   4]) = [  0.00000E+00 0.0E+00  0.00000E+00 0.0E+00 ];

% Group-transfer probabilities and cross sections:

GTRANSFP                  (idx, [1:   8]) = [  0.00000E+00 0.0E+00  0.00000E+00 0.0E+00  0.00000E+00 0.0E+00  0.00000E+00 0.0E+00 ];
GTRANSFXS                 (idx, [1:   8]) = [  0.00000E+00 0.0E+00  0.00000E+00 0.0E+00  0.00000E+00 0.0E+00  0.00000E+00 0.0E+00 ];

% Group-production probabilities and cross sections:

GPRODP                    (idx, [1:   8]) = [  0.00000E+00 0.0E+00  0.00000E+00 0.0E+00  0.00000E+00 0.0E+00  0.00000E+00 0.0E+00 ];
GPRODXS                   (idx, [1:   8]) = [  0.00000E+00 0.0E+00  0.00000E+00 0.0E+00  0.00000E+00 0.0E+00  0.00000E+00 0.0E+00 ];

% Diffusion parameters:

DIFFAREA                  (idx, [1:   6]) = [  0.00000E+00 0.0E+00  0.00000E+00 0.0E+00  0.00000E+00 0.0E+00 ];
DIFFCOEF                  (idx, [1:   6]) = [  0.00000E+00 0.0E+00  0.00000E+00 0.0E+00  0.00000E+00 0.0E+00 ];
TRANSPXS                  (idx, [1:   6]) = [  0.00000E+00 0.0E+00  0.00000E+00 0.0E+00  0.00000E+00 0.0E+00 ];
MUBAR                     (idx, [1:   6]) = [  0.00000E+00 0.0E+00  0.00000E+00 0.0E+00  0.00000E+00 0.0E+00 ];

% Material buckling:

MAT_BUCKLING              (idx, [1:   2]) = [  0.00000E+00 0.0E+00 ];

% Leakage estimate of diffusion coefficient:

LEAK_DIFFCOEF             (idx, [1:   6]) = [  0.00000E+00 0.0E+00  0.00000E+00 0.0E+00  0.00000E+00 0.0E+00 ];

% PN scattering cross sections:

SCATT0                    (idx, [1:   6]) = [  0.00000E+00 0.0E+00  0.00000E+00 0.0E+00  0.00000E+00 0.0E+00 ];
SCATT1                    (idx, [1:   6]) = [  0.00000E+00 0.0E+00  0.00000E+00 0.0E+00  0.00000E+00 0.0E+00 ];
SCATT2                    (idx, [1:   6]) = [  0.00000E+00 0.0E+00  0.00000E+00 0.0E+00  0.00000E+00 0.0E+00 ];
SCATT3                    (idx, [1:   6]) = [  0.00000E+00 0.0E+00  0.00000E+00 0.0E+00  0.00000E+00 0.0E+00 ];
SCATT4                    (idx, [1:   6]) = [  0.00000E+00 0.0E+00  0.00000E+00 0.0E+00  0.00000E+00 0.0E+00 ];
SCATT5                    (idx, [1:   6]) = [  0.00000E+00 0.0E+00  0.00000E+00 0.0E+00  0.00000E+00 0.0E+00 ];

% P1 diffusion parameters:

P1_TRANSPXS               (idx, [1:   6]) = [  0.00000E+00 0.0E+00  0.00000E+00 0.0E+00  0.00000E+00 0.0E+00 ];
P1_DIFFCOEF               (idx, [1:   6]) = [  0.00000E+00 0.0E+00  0.00000E+00 0.0E+00  0.00000E+00 0.0E+00 ];
P1_MUBAR                  (idx, [1:   6]) = [  0.00000E+00 0.0E+00  0.00000E+00 0.0E+00  0.00000E+00 0.0E+00 ];

% B1 critical spectrum calculation:

B1_KINF                   (idx, [1:   2]) = [  0.00000E+00 0.0E+00 ];
B1_BUCKLING               (idx, [1:   2]) = [  0.00000E+00 0.0E+00 ];
B1_FLUX                   (idx, [1:   6]) = [  0.00000E+00 0.0E+00  0.00000E+00 0.0E+00  0.00000E+00 0.0E+00 ];
B1_TOTXS                  (idx, [1:   6]) = [  0.00000E+00 0.0E+00  0.00000E+00 0.0E+00  0.00000E+00 0.0E+00 ];
B1_NSF                    (idx, [1:   6]) = [  0.00000E+00 0.0E+00  0.00000E+00 0.0E+00  0.00000E+00 0.0E+00 ];
B1_FISSXS                 (idx, [1:   6]) = [  0.00000E+00 0.0E+00  0.00000E+00 0.0E+00  0.00000E+00 0.0E+00 ];
B1_CHI                    (idx, [1:   4]) = [  0.00000E+00 0.0E+00  0.00000E+00 0.0E+00 ];
B1_ABSXS                  (idx, [1:   6]) = [  0.00000E+00 0.0E+00  0.00000E+00 0.0E+00  0.00000E+00 0.0E+00 ];
B1_RABSXS                 (idx, [1:   6]) = [  0.00000E+00 0.0E+00  0.00000E+00 0.0E+00  0.00000E+00 0.0E+00 ];
B1_REMXS                  (idx, [1:   6]) = [  0.00000E+00 0.0E+00  0.00000E+00 0.0E+00  0.00000E+00 0.0E+00 ];
B1_DIFFCOEF               (idx, [1:   6]) = [  0.00000E+00 0.0E+00  0.00000E+00 0.0E+00  0.00000E+00 0.0E+00 ];
B1_SCATTXS                (idx, [1:   8]) = [  0.00000E+00 0.0E+00  0.00000E+00 0.0E+00  0.00000E+00 0.0E+00  0.00000E+00 0.0E+00 ];
B1_SCATTPRODXS            (idx, [1:   8]) = [  0.00000E+00 0.0E+00  0.00000E+00 0.0E+00  0.00000E+00 0.0E+00  0.00000E+00 0.0E+00 ];

% Assembly discontinuity factors:

ADFS                      (idx, [1:  24]) = [  0.00000E+00 0.0E+00  0.00000E+00 0.0E+00  0.00000E+00 0.0E+00  0.00000E+00 0.0E+00  0.00000E+00 0.0E+00  0.00000E+00 0.0E+00  0.00000E+00 0.0E+00  0.00000E+00 0.0E+00  0.00000E+00 0.0E+00  0.00000E+00 0.0E+00  0.00000E+00 0.0E+00  0.00000E+00 0.0E+00 ];
ADFC                      (idx, [1:  24]) = [  0.00000E+00 0.0E+00  0.00000E+00 0.0E+00  0.00000E+00 0.0E+00  0.00000E+00 0.0E+00  0.00000E+00 0.0E+00  0.00000E+00 0.0E+00  0.00000E+00 0.0E+00  0.00000E+00 0.0E+00  0.00000E+00 0.0E+00  0.00000E+00 0.0E+00  0.00000E+00 0.0E+00  0.00000E+00 0.0E+00 ];


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
SIMULATION_COMPLETED      (idx, 1)        = 1 ;

% Energy grid parameters:

ERG_EMIN                  (idx, 1)        = 1.00000E-11 ;
ERG_EMAX                  (idx, 1)        = 2.00000E+01 ;
ERG_TOL                   (idx, 1)        = 1.00000E-05 ;
ERG_NE                    (idx, 1)        = 140218 ;
ERG_NE_INI                (idx, 1)        = 159443 ;
ERG_NE_IMP                (idx, 1)        = 25889 ;
ERG_DIX                   (idx, 1)        = 0 ;
USE_DBRC                  (idx, 1)        = 0 ;
URES_MODE                 (idx, 1)        = 1 ;
URES_DILU_CUT             (idx, 1)        = 0.00000E+00 ;
URES_EMIN                 (idx, 1)        = 1.00000E+37 ;
URES_EMAX                 (idx, 1)        = -1.00000E+37 ;
URES_AVAIL                (idx, 1)        = 0 ;
URES_USED                 (idx, 1)        = 0 ;

% Nuclides and reaction channels:

TOT_ISOTOPES              (idx, 1)        = 17 ;
TOT_TRANSPORT_ISOTOPES    (idx, 1)        = 17 ;
TOT_DECAY_ISOTOPES        (idx, 1)        = 0 ;
TOT_REA_CHANNELS          (idx, 1)        = 748 ;
TOT_TRANSMU_REA           (idx, 1)        = 0 ;

% Reaction mode counters:

COLLISIONS                (idx, 1)        = 2531617 ;
FISSION_FRACTION          (idx, 1)        = 8.99662E-03 ;
CAPTURE_FRACTION          (idx, 1)        = 9.96754E-03 ;
ELASTIC_FRACTION          (idx, 1)        = 9.50299E-01 ;
INELASTIC_FRACTION        (idx, 1)        = 3.06836E-02 ;
ALPHA_FRACTION            (idx, 1)        = 0.00000E+00 ;
BOUND_SCATTERING_FRACTION (idx, 1)        = 0.00000E+00 ;
NXN_FRACTION              (idx, 1)        = 5.37206E-05 ;
UNKNOWN_FRACTION          (idx, 1)        = 0.00000E+00 ;
VIRTUAL_FRACTION          (idx, 1)        = 5.72571E-01 ;

FREEGAS_FRACTION          (idx, 1)        = 2.67484E-02 ;
TOTAL_ELASTIC_FRACTION    (idx, 1)        = 9.50299E-01 ;
FISSILE_FISSION_FRACTION  (idx, 1)        = 7.79022E-01 ;
LEAKAGE_REACTIONS         (idx, 1)        = 2126 ;

REA_SAMPLING_EFF          (idx, 1)        = 3.40049E-01 ;

% Slowing-down and thermalization:

COL_SLOW                  (idx, [1:   2]) = [  1.85099E+02 0.02179 ];
COL_THERM                 (idx, [1:   2]) = [  1.56660E+01 0.04604 ];
COL_TOT                   (idx, [1:   2]) = [  4.80694E+01 0.00406 ];
SLOW_TIME                 (idx, [1:   2]) = [  2.83204E-04 0.02413 ];
THERM_TIME                (idx, [1:   2]) = [  2.51718E-04 0.05277 ];
SLOW_DIST                 (idx, [1:   2]) = [  1.81603E+02 0.02807 ];
THERM_DIST                (idx, [1:   2]) = [  5.68181E+01 0.04308 ];
THERM_FRAC                (idx, [1:   2]) = [  7.14000E-03 0.05156 ];

% Parameters for burnup calculation:

BURN_MODE                 (idx, 1)        = 2 ;
BURN_STEP                 (idx, 1)        = 1 ;
BURN_TOT_STEPS            (idx, 1)        = 1 ;
BURNUP                    (idx, 1)        = 0.00000E+00 ;
BURN_DAYS                 (idx, 1)        = 0.00000E+00 ;
ENERGY_OUTPUT             (idx, 1)        = 0.00000E+00 ;
DEP_TTA_CUTOFF            (idx, 1)        = 1.00000E-15 ;
DEP_STABILITY_CUTOFF      (idx, 1)        = 1.00000E-22 ;
DEP_FP_YIELD_CUTOFF       (idx, 1)        = 1.00000E-22 ;
DEP_XS_FRAC_CUTOFF        (idx, 1)        = 0.00000E+00 ;
DEP_XS_ENERGY_CUTOFF      (idx, 1)        = -1.00000E+00 ;
BURN_MATERIALS            (idx, 1)        = 0 ;
FP_NUCLIDES_INCLUDED      (idx, 1)        = 0 ;
FP_NUCLIDES_AVAILABLE     (idx, 1)        = 0 ;
TOT_ACTIVITY              (idx, 1)        = 0.00000E+00 ;
TOT_DECAY_HEAT            (idx, 1)        = 0.00000E+00 ;
TOT_SF_RATE               (idx, 1)        = 0.00000E+00 ;
ACTINIDE_ACTIVITY         (idx, 1)        = 0.00000E+00 ;
ACTINIDE_DECAY_HEAT       (idx, 1)        = 0.00000E+00 ;
FISSION_PRODUCT_ACTIVITY  (idx, 1)        = 0.00000E+00 ;
FISSION_PRODUCT_DECAY_HEAT(idx, 1)        = 0.00000E+00 ;

% Fission source entropies:

ENTROPY_X                 (idx, [1:   2]) = [  8.46810E-01 0.00258 ];
ENTROPY_Y                 (idx, [1:   2]) = [  7.17737E-01 0.00274 ];
ENTROPY_Z                 (idx, [1:   2]) = [  3.47807E-01 0.00804 ];
ENTROPY_TOT               (idx, [1:   2]) = [  6.19949E-01 0.00185 ];

% Fission source centre:

SOURCE_X0                 (idx, [1:   2]) = [  4.67314E-03 0.30226 ];
SOURCE_Y0                 (idx, [1:   2]) = [ -2.22805E-03 0.64794 ];
SOURCE_Z0                 (idx, [1:   2]) = [  4.21784E-01 0.55597 ];

% Criticality eigenvalues:

ANA_KEFF                  (idx, [1:   2]) = [  1.33980E+00 0.00457 ];
IMP_KEFF                  (idx, [1:   2]) = [  1.34352E+00 0.00210 ];
COL_KEFF                  (idx, [1:   2]) = [  1.34967E+00 0.00294 ];
ABS_KEFF                  (idx, [1:   2]) = [  1.34352E+00 0.00210 ];
ABS_KINF                  (idx, [1:   2]) = [  1.40290E+00 0.00207 ];
ABS_GC_KEFF               (idx, [1:   2]) = [  1.45726E+00 0.00181 ];
ABS_GC_KINF               (idx, [1:   2]) = [  1.45726E+00 0.00181 ];
IMPL_ALPHA_EIG            (idx, [1:   2]) = [  0.00000E+00 0.0E+00 ];
FIXED_ALPHA_EIG           (idx, [1:   2]) = [  0.00000E+00 0.0E+00 ];
GEOM_ALBEDO               (idx, [1:   2]) = [  1.00000E+00 0.0E+00 ];

% Normalized total reaction rates:

TOT_POWER                 (idx, [1:   2]) = [  4.00000E+02 0.0E+00 ];
TOT_GENRATE               (idx, [1:   2]) = [  3.52578E+13 0.00041 ];
TOT_FISSRATE              (idx, [1:   2]) = [  1.19749E+13 8.3E-06 ];
TOT_ABSRATE               (idx, [1:   2]) = [  2.52011E+13 0.00203 ];
TOT_LEAKRATE              (idx, [1:   2]) = [  1.11129E+12 0.02281 ];
TOT_LOSSRATE              (idx, [1:   2]) = [  2.63124E+13 0.00209 ];
TOT_SRCRATE               (idx, [1:   2]) = [ -3.37402E+10 5.11409 ];
TOT_FLUX                  (idx, [1:   2]) = [  7.00358E+15 0.00609 ];
TOT_RR                    (idx, [1:   2]) = [  1.32308E+15 0.00331 ];
TOT_SOLU_ABSRATE          (idx, [1:   2]) = [  0.00000E+00 0.0E+00 ];

TOT_FMASS                 (idx, 1)        = 5.36252E-03 ;
TOT_POWDENS               (idx, [1:   2]) = [  7.45918E-02 0.00000 ];


% Point-kinetic parameters:

ANA_PROMPT_LIFETIME       (idx, [1:   2]) = [  7.50294E-06 0.03095 ];
IMPL_PROMPT_LIFETIME      (idx, [1:   2]) = [  0.00000E+00 0.0E+00 ];
ANA_REPROD_TIME           (idx, [1:   2]) = [  5.60565E-06 0.03130 ];
IMPL_REPROD_TIME          (idx, [1:   2]) = [  0.00000E+00 0.0E+00 ];
DELAYED_EMTIME            (idx, [1:   2]) = [  1.12860E+01 0.16663 ];

% Six-factor formula:

SIX_FF_ETA                (idx, [1:   2]) = [  8.30277E-01 0.21523 ];
SIX_FF_F                  (idx, [1:   2]) = [  9.18341E-02 0.18364 ];
SIX_FF_P                  (idx, [1:   2]) = [  6.30382E-03 0.05296 ];
SIX_FF_EPSILON            (idx, [1:   2]) = [  1.42456E+02 0.21194 ];
SIX_FF_LF                 (idx, [1:   2]) = [  9.58060E-01 0.00101 ];
SIX_FF_LT                 (idx, [1:   2]) = [  9.99395E-01 0.00011 ];
SIX_FF_KINF               (idx, [1:   2]) = [  4.51636E-01 0.20839 ];
SIX_FF_KEFF               (idx, [1:   2]) = [  4.32187E-01 0.20840 ];

% Delayed neutron parameters:

USE_DELNU                 (idx, 1)        = 1 ;
PRECURSOR_GROUPS          (idx, 1)        = 8 ;
BETA_EFF                  (idx, [1:  18]) = [  4.49657E-03 0.09913  3.18326E-05 0.95439  9.02290E-04 0.29013  2.90591E-04 0.33805  6.78973E-04 0.20034  1.40791E-03 0.17718  5.61981E-04 0.22072  4.75637E-04 0.26758  1.47355E-04 0.36214 ];
BETA_ZERO                 (idx, [1:  18]) = [  4.71903E-03 0.00494  8.02728E-05 0.03642  7.56602E-04 0.02245  2.86899E-04 0.02932  7.05501E-04 0.00787  1.45956E-03 0.00773  6.53847E-04 0.03992  5.34240E-04 0.01291  2.42103E-04 0.04796 ];
DECAY_CONSTANT            (idx, [1:  18]) = [  4.70437E-01 0.12315  1.24667E-02 0.0E+00  2.82917E-02 0.0E+00  4.25244E-02 0.0E+00  1.33042E-01 0.0E+00  2.92467E-01 0.0E+00  6.66488E-01 6.6E-09  1.63478E+00 0.0E+00  3.55460E+00 0.0E+00 ];

% Parameters for group constant generation

GC_UNI                    (idx, 1)        = 1 ;
GC_SYM                    (idx, 1)        = 0 ;
GC_NE                     (idx, 1)        = 2 ;
GC_BOUNDS                 (idx, [1:   3]) = [  2.00000E+01  6.25000E-07  1.00000E-11 ];
GC_REMXS_INCLUDE_MULT     (idx, 1)        = 1 ;

% Few-group cross sections:

FLUX                      (idx, [1:   6]) = [  3.44319E+15 0.00167  3.44316E+15 0.00167  2.43821E+10 0.36863 ];
LEAK                      (idx, [1:   6]) = [  0.00000E+00 0.0E+00  0.00000E+00 0.0E+00  0.00000E+00 0.0E+00 ];
TOTXS                     (idx, [1:   6]) = [  2.86636E-01 0.00092  2.86632E-01 0.00092  3.11318E+00 0.23923 ];
FISSXS                    (idx, [1:   6]) = [  3.47834E-03 0.00167  3.47622E-03 0.00168  1.59930E+00 0.27812 ];
CAPTXS                    (idx, [1:   6]) = [  3.56916E-03 0.00406  3.56731E-03 0.00406  1.17019E+00 0.25139 ];
ABSXS                     (idx, [1:   6]) = [  7.04750E-03 0.00259  7.04353E-03 0.00260  2.76950E+00 0.26664 ];
RABSXS                    (idx, [1:   6]) = [  7.02747E-03 0.00261  7.02290E-03 0.00262  1.45391E+00 0.28749 ];
ELAXS                     (idx, [1:   6]) = [  2.68363E-01 0.00101  2.68363E-01 0.00101  3.43683E-01 0.05344 ];
INELAXS                   (idx, [1:   6]) = [  1.12253E-02 0.00296  1.12254E-02 0.00296  4.24948E-16 0.41692 ];
SCATTXS                   (idx, [1:   6]) = [  2.79588E-01 0.00089  2.79588E-01 0.00089  3.43683E-01 0.05344 ];
SCATTPRODXS               (idx, [1:   6]) = [  2.79608E-01 0.00089  2.79609E-01 0.00089  4.04175E-02 0.38340 ];
N2NXS                     (idx, [1:   6]) = [  1.85547E-05 0.04635  1.85548E-05 0.04635  0.00000E+00 0.0E+00 ];
REMXS                     (idx, [1:   6]) = [  7.02747E-03 0.00261  7.02366E-03 0.00262  1.46149E+00 0.28585 ];
NUBAR                     (idx, [1:   6]) = [  2.94430E+00 0.00041  2.94437E+00 0.00042  2.86300E+00 0.00040 ];
NSF                       (idx, [1:   6]) = [  1.02413E-02 0.00175  1.02353E-02 0.00176  4.61702E+00 0.32612 ];
RECIPVEL                  (idx, [1:   6]) = [  3.37608E-09 0.00528  3.36656E-09 0.00518  1.31684E-06 0.07641 ];
FISSE                     (idx, [1:   6]) = [  2.08486E+02 8.3E-06  2.08486E+02 8.3E-06  2.08204E+02 0.00021 ];

% Fission spectra:

CHI                       (idx, [1:   4]) = [  1.00000E+00 0.0E+00  0.00000E+00 0.0E+00 ];
CHIP                      (idx, [1:   4]) = [  1.00000E+00 0.0E+00  0.00000E+00 0.0E+00 ];
CHID                      (idx, [1:   4]) = [  1.00000E+00 0.0E+00  0.00000E+00 0.0E+00 ];

% Group-transfer probabilities and cross sections:

GTRANSFP                  (idx, [1:   8]) = [  9.99997E-01 1.2E-06  1.42857E-01 1.00000  2.71258E-06 0.42879  8.57143E-01 0.16667 ];
GTRANSFXS                 (idx, [1:   8]) = [  2.79588E-01 0.00089  5.41620E-02 1.00000  7.59392E-07 0.42876  2.34535E-01 0.24723 ];

% Group-production probabilities and cross sections:

GPRODP                    (idx, [1:   8]) = [  1.00007E+00 6.3E-06  1.42857E-01 1.00000  2.71258E-06 0.42879  8.57143E-01 0.16667 ];
GPRODXS                   (idx, [1:   8]) = [  2.79608E-01 0.00089  5.41620E-02 1.00000  7.59392E-07 0.42876  2.34535E-01 0.24723 ];

% Diffusion parameters:

DIFFAREA                  (idx, [1:   6]) = [  3.59274E+02 0.01188  3.56073E+02 0.01272  8.12341E+02 0.47933 ];
DIFFCOEF                  (idx, [1:   6]) = [  2.52540E+00 0.01257  2.50165E+00 0.01344  3.41785E+03 0.59812 ];
TRANSPXS                  (idx, [1:   6]) = [  1.33070E-01 0.01323  1.34479E-01 0.01400  1.65158E-01 0.63421 ];
MUBAR                     (idx, [1:   6]) = [  5.49177E-01 0.01168  5.44111E-01 0.01263  5.99007E+00 0.55198 ];

% Material buckling:

MAT_BUCKLING              (idx, [1:   2]) = [  1.28295E-03 0.01489 ];

% Leakage estimate of diffusion coefficient:

LEAK_DIFFCOEF             (idx, [1:   6]) = [  0.00000E+00 0.0E+00  0.00000E+00 0.0E+00  0.00000E+00 0.0E+00 ];

% PN scattering cross sections:

SCATT0                    (idx, [1:   6]) = [  2.79597E-01 0.00099  2.79597E-01 0.00099  2.45839E-01 0.52915 ];
SCATT1                    (idx, [1:   6]) = [  2.66945E-02 0.00489  2.66949E-02 0.00489 -6.94762E-03 7.31007 ];
SCATT2                    (idx, [1:   6]) = [  1.20032E-02 0.00696  1.20033E-02 0.00696 -2.30314E-02 2.67773 ];
SCATT3                    (idx, [1:   6]) = [  3.61722E-03 0.02214  3.61723E-03 0.02213  2.31697E-02 1.23946 ];
SCATT4                    (idx, [1:   6]) = [  2.11689E-03 0.03121  2.11672E-03 0.03120  1.15260E-02 3.66302 ];
SCATT5                    (idx, [1:   6]) = [  7.89211E-04 0.08649  7.89591E-04 0.08646 -5.21538E-02 0.77162 ];

% P1 diffusion parameters:

P1_TRANSPXS               (idx, [1:   6]) = [  2.59941E-01 0.00129  2.59937E-01 0.00129  3.12013E+00 0.23978 ];
P1_DIFFCOEF               (idx, [1:   6]) = [  1.28245E+00 0.00129  1.28247E+00 0.00129  3.49114E-01 0.24567 ];
P1_MUBAR                  (idx, [1:   6]) = [  9.54884E-02 0.00534  9.54894E-02 0.00534 -1.49574E-02 4.15059 ];

% B1 critical spectrum calculation:

B1_KINF                   (idx, [1:   2]) = [  0.00000E+00 0.0E+00 ];
B1_BUCKLING               (idx, [1:   2]) = [  0.00000E+00 0.0E+00 ];
B1_FLUX                   (idx, [1:   6]) = [  0.00000E+00 0.0E+00  0.00000E+00 0.0E+00  0.00000E+00 0.0E+00 ];
B1_TOTXS                  (idx, [1:   6]) = [  0.00000E+00 0.0E+00  0.00000E+00 0.0E+00  0.00000E+00 0.0E+00 ];
B1_NSF                    (idx, [1:   6]) = [  0.00000E+00 0.0E+00  0.00000E+00 0.0E+00  0.00000E+00 0.0E+00 ];
B1_FISSXS                 (idx, [1:   6]) = [  0.00000E+00 0.0E+00  0.00000E+00 0.0E+00  0.00000E+00 0.0E+00 ];
B1_CHI                    (idx, [1:   4]) = [  0.00000E+00 0.0E+00  0.00000E+00 0.0E+00 ];
B1_ABSXS                  (idx, [1:   6]) = [  0.00000E+00 0.0E+00  0.00000E+00 0.0E+00  0.00000E+00 0.0E+00 ];
B1_RABSXS                 (idx, [1:   6]) = [  0.00000E+00 0.0E+00  0.00000E+00 0.0E+00  0.00000E+00 0.0E+00 ];
B1_REMXS                  (idx, [1:   6]) = [  0.00000E+00 0.0E+00  0.00000E+00 0.0E+00  0.00000E+00 0.0E+00 ];
B1_DIFFCOEF               (idx, [1:   6]) = [  0.00000E+00 0.0E+00  0.00000E+00 0.0E+00  0.00000E+00 0.0E+00 ];
B1_SCATTXS                (idx, [1:   8]) = [  0.00000E+00 0.0E+00  0.00000E+00 0.0E+00  0.00000E+00 0.0E+00  0.00000E+00 0.0E+00 ];
B1_SCATTPRODXS            (idx, [1:   8]) = [  0.00000E+00 0.0E+00  0.00000E+00 0.0E+00  0.00000E+00 0.0E+00  0.00000E+00 0.0E+00 ];


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
RUNNING_TIME              (idx, 1)        = 4.14333E-01 ;
CPU_USAGE                 (idx, 1)        = 0.99638 ;
INIT_TIME                 (idx, 1)        = 4.10000E-02 ;
TRANSPORT_CYCLE_TIME      (idx, 1)        = 3.72867E-01 ;
BURNUP_CYCLE_TIME         (idx, 1)        = 0.00000E+00 ;
PROCESS_TIME              (idx, 1)        = 4.66665E-04 ;
CYCLE_IDX                 (idx, 1)        = 50 ;
SOURCE_NEUTRONS           (idx, 1)        = 50000 ;
MEAN_POP_SIZE             (idx, [1:  2])  = [  1.00000E+03 0.00000 ];
MEMSIZE                   (idx, 1)        = 209.5;
SIMULATION_COMPLETED      (idx, 1)        = 1 ;

% Energy grid parameters:

ERG_EMIN                  (idx, 1)        = 1.00000E-11 ;
ERG_EMAX                  (idx, 1)        = 2.00000E+01 ;
ERG_TOL                   (idx, 1)        = 1.00000E-05 ;
ERG_NE                    (idx, 1)        = 140218 ;
ERG_NE_INI                (idx, 1)        = 159443 ;
ERG_NE_IMP                (idx, 1)        = 25889 ;
ERG_DIX                   (idx, 1)        = 0 ;
USE_DBRC                  (idx, 1)        = 0 ;
URES_MODE                 (idx, 1)        = 1 ;
URES_DILU_CUT             (idx, 1)        = 0.00000E+00 ;
URES_EMIN                 (idx, 1)        = 1.00000E+37 ;
URES_EMAX                 (idx, 1)        = -1.00000E+37 ;
URES_AVAIL                (idx, 1)        = 0 ;
URES_USED                 (idx, 1)        = 0 ;

% Nuclides and reaction channels:

TOT_ISOTOPES              (idx, 1)        = 17 ;
TOT_TRANSPORT_ISOTOPES    (idx, 1)        = 17 ;
TOT_DECAY_ISOTOPES        (idx, 1)        = 0 ;
TOT_REA_CHANNELS          (idx, 1)        = 748 ;
TOT_TRANSMU_REA           (idx, 1)        = 0 ;

% Reaction mode counters:

COLLISIONS                (idx, 1)        = 2531617 ;
FISSION_FRACTION          (idx, 1)        = 8.99662E-03 ;
CAPTURE_FRACTION          (idx, 1)        = 9.96754E-03 ;
ELASTIC_FRACTION          (idx, 1)        = 9.50299E-01 ;
INELASTIC_FRACTION        (idx, 1)        = 3.06836E-02 ;
ALPHA_FRACTION            (idx, 1)        = 0.00000E+00 ;
BOUND_SCATTERING_FRACTION (idx, 1)        = 0.00000E+00 ;
NXN_FRACTION              (idx, 1)        = 5.37206E-05 ;
UNKNOWN_FRACTION          (idx, 1)        = 0.00000E+00 ;
VIRTUAL_FRACTION          (idx, 1)        = 5.72571E-01 ;

FREEGAS_FRACTION          (idx, 1)        = 2.67484E-02 ;
TOTAL_ELASTIC_FRACTION    (idx, 1)        = 9.50299E-01 ;
FISSILE_FISSION_FRACTION  (idx, 1)        = 7.79022E-01 ;
LEAKAGE_REACTIONS         (idx, 1)        = 2126 ;

REA_SAMPLING_EFF          (idx, 1)        = 3.40049E-01 ;

% Slowing-down and thermalization:

COL_SLOW                  (idx, [1:   2]) = [  1.85099E+02 0.02179 ];
COL_THERM                 (idx, [1:   2]) = [  1.56660E+01 0.04604 ];
COL_TOT                   (idx, [1:   2]) = [  4.80694E+01 0.00406 ];
SLOW_TIME                 (idx, [1:   2]) = [  2.83204E-04 0.02413 ];
THERM_TIME                (idx, [1:   2]) = [  2.51718E-04 0.05277 ];
SLOW_DIST                 (idx, [1:   2]) = [  1.81603E+02 0.02807 ];
THERM_DIST                (idx, [1:   2]) = [  5.68181E+01 0.04308 ];
THERM_FRAC                (idx, [1:   2]) = [  7.14000E-03 0.05156 ];

% Parameters for burnup calculation:

BURN_MODE                 (idx, 1)        = 2 ;
BURN_STEP                 (idx, 1)        = 1 ;
BURN_TOT_STEPS            (idx, 1)        = 1 ;
BURNUP                    (idx, 1)        = 0.00000E+00 ;
BURN_DAYS                 (idx, 1)        = 0.00000E+00 ;
ENERGY_OUTPUT             (idx, 1)        = 0.00000E+00 ;
DEP_TTA_CUTOFF            (idx, 1)        = 1.00000E-15 ;
DEP_STABILITY_CUTOFF      (idx, 1)        = 1.00000E-22 ;
DEP_FP_YIELD_CUTOFF       (idx, 1)        = 1.00000E-22 ;
DEP_XS_FRAC_CUTOFF        (idx, 1)        = 0.00000E+00 ;
DEP_XS_ENERGY_CUTOFF      (idx, 1)        = -1.00000E+00 ;
BURN_MATERIALS            (idx, 1)        = 0 ;
FP_NUCLIDES_INCLUDED      (idx, 1)        = 0 ;
FP_NUCLIDES_AVAILABLE     (idx, 1)        = 0 ;
TOT_ACTIVITY              (idx, 1)        = 0.00000E+00 ;
TOT_DECAY_HEAT            (idx, 1)        = 0.00000E+00 ;
TOT_SF_RATE               (idx, 1)        = 0.00000E+00 ;
ACTINIDE_ACTIVITY         (idx, 1)        = 0.00000E+00 ;
ACTINIDE_DECAY_HEAT       (idx, 1)        = 0.00000E+00 ;
FISSION_PRODUCT_ACTIVITY  (idx, 1)        = 0.00000E+00 ;
FISSION_PRODUCT_DECAY_HEAT(idx, 1)        = 0.00000E+00 ;

% Fission source entropies:

ENTROPY_X                 (idx, [1:   2]) = [  8.46810E-01 0.00258 ];
ENTROPY_Y                 (idx, [1:   2]) = [  7.17737E-01 0.00274 ];
ENTROPY_Z                 (idx, [1:   2]) = [  3.47807E-01 0.00804 ];
ENTROPY_TOT               (idx, [1:   2]) = [  6.19949E-01 0.00185 ];

% Fission source centre:

SOURCE_X0                 (idx, [1:   2]) = [  4.67314E-03 0.30226 ];
SOURCE_Y0                 (idx, [1:   2]) = [ -2.22805E-03 0.64794 ];
SOURCE_Z0                 (idx, [1:   2]) = [  4.21784E-01 0.55597 ];

% Criticality eigenvalues:

ANA_KEFF                  (idx, [1:   2]) = [  1.33980E+00 0.00457 ];
IMP_KEFF                  (idx, [1:   2]) = [  1.34352E+00 0.00210 ];
COL_KEFF                  (idx, [1:   2]) = [  1.34967E+00 0.00294 ];
ABS_KEFF                  (idx, [1:   2]) = [  1.34352E+00 0.00210 ];
ABS_KINF                  (idx, [1:   2]) = [  1.40290E+00 0.00207 ];
ABS_GC_KEFF               (idx, [1:   2]) = [  0.00000E+00 0.0E+00 ];
ABS_GC_KINF               (idx, [1:   2]) = [  0.00000E+00 0.0E+00 ];
IMPL_ALPHA_EIG            (idx, [1:   2]) = [  0.00000E+00 0.0E+00 ];
FIXED_ALPHA_EIG           (idx, [1:   2]) = [  0.00000E+00 0.0E+00 ];
GEOM_ALBEDO               (idx, [1:   2]) = [  1.00000E+00 0.0E+00 ];

% Normalized total reaction rates:

TOT_POWER                 (idx, [1:   2]) = [  4.00000E+02 0.0E+00 ];
TOT_GENRATE               (idx, [1:   2]) = [  3.52578E+13 0.00041 ];
TOT_FISSRATE              (idx, [1:   2]) = [  1.19749E+13 8.3E-06 ];
TOT_ABSRATE               (idx, [1:   2]) = [  2.52011E+13 0.00203 ];
TOT_LEAKRATE              (idx, [1:   2]) = [  1.11129E+12 0.02281 ];
TOT_LOSSRATE              (idx, [1:   2]) = [  2.63124E+13 0.00209 ];
TOT_SRCRATE               (idx, [1:   2]) = [ -3.37402E+10 5.11409 ];
TOT_FLUX                  (idx, [1:   2]) = [  7.00358E+15 0.00609 ];
TOT_RR                    (idx, [1:   2]) = [  1.32308E+15 0.00331 ];
TOT_SOLU_ABSRATE          (idx, [1:   2]) = [  0.00000E+00 0.0E+00 ];

TOT_FMASS                 (idx, 1)        = 5.36252E-03 ;
TOT_POWDENS               (idx, [1:   2]) = [  7.45918E-02 0.00000 ];


% Point-kinetic parameters:

ANA_PROMPT_LIFETIME       (idx, [1:   2]) = [  7.50294E-06 0.03095 ];
IMPL_PROMPT_LIFETIME      (idx, [1:   2]) = [  0.00000E+00 0.0E+00 ];
ANA_REPROD_TIME           (idx, [1:   2]) = [  5.60565E-06 0.03130 ];
IMPL_REPROD_TIME          (idx, [1:   2]) = [  0.00000E+00 0.0E+00 ];
DELAYED_EMTIME            (idx, [1:   2]) = [  1.12860E+01 0.16663 ];

% Six-factor formula:

SIX_FF_ETA                (idx, [1:   2]) = [  8.30277E-01 0.21523 ];
SIX_FF_F                  (idx, [1:   2]) = [  9.18341E-02 0.18364 ];
SIX_FF_P                  (idx, [1:   2]) = [  6.30382E-03 0.05296 ];
SIX_FF_EPSILON            (idx, [1:   2]) = [  1.42456E+02 0.21194 ];
SIX_FF_LF                 (idx, [1:   2]) = [  9.58060E-01 0.00101 ];
SIX_FF_LT                 (idx, [1:   2]) = [  9.99395E-01 0.00011 ];
SIX_FF_KINF               (idx, [1:   2]) = [  4.51636E-01 0.20839 ];
SIX_FF_KEFF               (idx, [1:   2]) = [  4.32187E-01 0.20840 ];

% Delayed neutron parameters:

USE_DELNU                 (idx, 1)        = 1 ;
PRECURSOR_GROUPS          (idx, 1)        = 8 ;
BETA_EFF                  (idx, [1:  18]) = [  4.49657E-03 0.09913  3.18326E-05 0.95439  9.02290E-04 0.29013  2.90591E-04 0.33805  6.78973E-04 0.20034  1.40791E-03 0.17718  5.61981E-04 0.22072  4.75637E-04 0.26758  1.47355E-04 0.36214 ];
BETA_ZERO                 (idx, [1:  18]) = [  4.71903E-03 0.00494  8.02728E-05 0.03642  7.56602E-04 0.02245  2.86899E-04 0.02932  7.05501E-04 0.00787  1.45956E-03 0.00773  6.53847E-04 0.03992  5.34240E-04 0.01291  2.42103E-04 0.04796 ];
DECAY_CONSTANT            (idx, [1:  18]) = [  4.70437E-01 0.12315  1.24667E-02 0.0E+00  2.82917E-02 0.0E+00  4.25244E-02 0.0E+00  1.33042E-01 0.0E+00  2.92467E-01 0.0E+00  6.66488E-01 6.6E-09  1.63478E+00 0.0E+00  3.55460E+00 0.0E+00 ];

% Parameters for group constant generation

GC_UNI                    (idx, 1)        = 2 ;
GC_SYM                    (idx, 1)        = 0 ;
GC_NE                     (idx, 1)        = 2 ;
GC_BOUNDS                 (idx, [1:   3]) = [  2.00000E+01  6.25000E-07  1.00000E-11 ];
GC_REMXS_INCLUDE_MULT     (idx, 1)        = 1 ;

% Few-group cross sections:

FLUX                      (idx, [1:   6]) = [  1.37416E+15 0.01245  1.36971E+15 0.01254  4.44936E+12 0.12526 ];
LEAK                      (idx, [1:   6]) = [  0.00000E+00 0.0E+00  0.00000E+00 0.0E+00  0.00000E+00 0.0E+00 ];
TOTXS                     (idx, [1:   6]) = [  9.47769E-02 0.00313  9.45965E-02 0.00314  1.68787E-01 0.12572 ];
FISSXS                    (idx, [1:   6]) = [  0.00000E+00 0.0E+00  0.00000E+00 0.0E+00  0.00000E+00 0.0E+00 ];
CAPTXS                    (idx, [1:   6]) = [  2.86412E-04 0.02638  2.57468E-04 0.02230  9.81108E-03 0.09851 ];
ABSXS                     (idx, [1:   6]) = [  2.86412E-04 0.02638  2.57468E-04 0.02230  9.81108E-03 0.09851 ];
RABSXS                    (idx, [1:   6]) = [  2.86412E-04 0.02638  2.57468E-04 0.02230  8.24131E-03 0.11642 ];
ELAXS                     (idx, [1:   6]) = [  9.35561E-02 0.00317  9.34016E-02 0.00319  1.58976E-01 0.12762 ];
INELAXS                   (idx, [1:   6]) = [  9.34303E-04 0.01801  9.37463E-04 0.01809  2.41744E-17 0.21413 ];
SCATTXS                   (idx, [1:   6]) = [  9.44904E-02 0.00311  9.43390E-02 0.00313  1.58976E-01 0.12762 ];
SCATTPRODXS               (idx, [1:   6]) = [  9.44904E-02 0.00311  9.43390E-02 0.00313  1.33540E-01 0.14181 ];
N2NXS                     (idx, [1:   6]) = [  8.25234E-08 0.59824  8.28486E-08 0.59866  0.00000E+00 0.0E+00 ];
REMXS                     (idx, [1:   6]) = [  2.86412E-04 0.02638  2.93130E-04 0.03050  1.30018E-02 0.12471 ];
NUBAR                     (idx, [1:   6]) = [  0.00000E+00 0.0E+00  0.00000E+00 0.0E+00  0.00000E+00 0.0E+00 ];
NSF                       (idx, [1:   6]) = [  0.00000E+00 0.0E+00  0.00000E+00 0.0E+00  0.00000E+00 0.0E+00 ];
RECIPVEL                  (idx, [1:   6]) = [  3.09987E-08 0.03422  2.66122E-08 0.02778  1.34424E-06 0.03493 ];
FISSE                     (idx, [1:   6]) = [  0.00000E+00 0.0E+00  0.00000E+00 0.0E+00  0.00000E+00 0.0E+00 ];

% Fission spectra:

CHI                       (idx, [1:   4]) = [  0.00000E+00 0.0E+00  0.00000E+00 0.0E+00 ];
CHIP                      (idx, [1:   4]) = [  0.00000E+00 0.0E+00  0.00000E+00 0.0E+00 ];
CHID                      (idx, [1:   4]) = [  0.00000E+00 0.0E+00  0.00000E+00 0.0E+00 ];

% Group-transfer probabilities and cross sections:

GTRANSFP                  (idx, [1:   8]) = [  9.99623E-01 6.0E-05  4.06389E-02 0.24725  3.76920E-04 0.15822  9.59361E-01 0.01047 ];
GTRANSFXS                 (idx, [1:   8]) = [  9.43034E-02 0.00312  5.80547E-03 0.25636  3.56624E-05 0.15824  1.57048E-01 0.13080 ];

% Group-production probabilities and cross sections:

GPRODP                    (idx, [1:   8]) = [  9.99623E-01 6.0E-05  4.06389E-02 0.24725  3.76920E-04 0.15822  9.59361E-01 0.01047 ];
GPRODXS                   (idx, [1:   8]) = [  9.43034E-02 0.00312  5.80547E-03 0.25636  3.56624E-05 0.15824  1.57048E-01 0.13080 ];

% Diffusion parameters:

DIFFAREA                  (idx, [1:   6]) = [  3.06465E+03 0.04458  2.82121E+03 0.05025  4.46723E+02 0.17067 ];
DIFFCOEF                  (idx, [1:   6]) = [  8.73960E-01 0.05056  8.08431E-01 0.05010  5.73237E+00 0.15293 ];
TRANSPXS                  (idx, [1:   6]) = [  4.31809E-01 0.05107  4.64123E-01 0.04862  2.16939E-01 0.29530 ];
MUBAR                     (idx, [1:   6]) = [ -3.56975E+00 0.06577 -3.91729E+00 0.06109 -4.08379E-01 0.87394 ];

% Material buckling:

MAT_BUCKLING              (idx, [1:   2]) = [ -3.60385E-04 0.04691 ];

% Leakage estimate of diffusion coefficient:

LEAK_DIFFCOEF             (idx, [1:   6]) = [  0.00000E+00 0.0E+00  0.00000E+00 0.0E+00  0.00000E+00 0.0E+00 ];

% PN scattering cross sections:

SCATT0                    (idx, [1:   6]) = [  9.44160E-02 0.00328  9.42665E-02 0.00331  1.55928E-01 0.13831 ];
SCATT1                    (idx, [1:   6]) = [  4.84358E-03 0.02360  4.84392E-03 0.02383  2.18886E-02 0.88406 ];
SCATT2                    (idx, [1:   6]) = [  2.59261E-03 0.03623  2.60947E-03 0.03520  8.00898E-03 1.47181 ];
SCATT3                    (idx, [1:   6]) = [  2.78848E-04 0.28408  2.84502E-04 0.28035  1.99765E-03 1.62214 ];
SCATT4                    (idx, [1:   6]) = [  2.24539E-04 0.36460  2.26961E-04 0.36111 -4.46638E-03 1.12999 ];
SCATT5                    (idx, [1:   6]) = [  5.93008E-05 1.00143  5.65461E-05 1.04320 -9.04657E-03 1.03385 ];

% P1 diffusion parameters:

P1_TRANSPXS               (idx, [1:   6]) = [  8.99333E-02 0.00377  8.97526E-02 0.00381  1.46899E-01 0.05186 ];
P1_DIFFCOEF               (idx, [1:   6]) = [  3.70903E+00 0.00377  3.71656E+00 0.00381  2.41964E+00 0.05150 ];
P1_MUBAR                  (idx, [1:   6]) = [  5.13605E-02 0.02443  5.14506E-02 0.02473  5.02634E-02 0.56781 ];

% B1 critical spectrum calculation:

B1_KINF                   (idx, [1:   2]) = [  0.00000E+00 0.0E+00 ];
B1_BUCKLING               (idx, [1:   2]) = [  0.00000E+00 0.0E+00 ];
B1_FLUX                   (idx, [1:   6]) = [  0.00000E+00 0.0E+00  0.00000E+00 0.0E+00  0.00000E+00 0.0E+00 ];
B1_TOTXS                  (idx, [1:   6]) = [  0.00000E+00 0.0E+00  0.00000E+00 0.0E+00  0.00000E+00 0.0E+00 ];
B1_NSF                    (idx, [1:   6]) = [  0.00000E+00 0.0E+00  0.00000E+00 0.0E+00  0.00000E+00 0.0E+00 ];
B1_FISSXS                 (idx, [1:   6]) = [  0.00000E+00 0.0E+00  0.00000E+00 0.0E+00  0.00000E+00 0.0E+00 ];
B1_CHI                    (idx, [1:   4]) = [  0.00000E+00 0.0E+00  0.00000E+00 0.0E+00 ];
B1_ABSXS                  (idx, [1:   6]) = [  0.00000E+00 0.0E+00  0.00000E+00 0.0E+00  0.00000E+00 0.0E+00 ];
B1_RABSXS                 (idx, [1:   6]) = [  0.00000E+00 0.0E+00  0.00000E+00 0.0E+00  0.00000E+00 0.0E+00 ];
B1_REMXS                  (idx, [1:   6]) = [  0.00000E+00 0.0E+00  0.00000E+00 0.0E+00  0.00000E+00 0.0E+00 ];
B1_DIFFCOEF               (idx, [1:   6]) = [  0.00000E+00 0.0E+00  0.00000E+00 0.0E+00  0.00000E+00 0.0E+00 ];
B1_SCATTXS                (idx, [1:   8]) = [  0.00000E+00 0.0E+00  0.00000E+00 0.0E+00  0.00000E+00 0.0E+00  0.00000E+00 0.0E+00 ];
B1_SCATTPRODXS            (idx, [1:   8]) = [  0.00000E+00 0.0E+00  0.00000E+00 0.0E+00  0.00000E+00 0.0E+00  0.00000E+00 0.0E+00 ];


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
RUNNING_TIME              (idx, 1)        = 4.14333E-01 ;
CPU_USAGE                 (idx, 1)        = 0.99638 ;
INIT_TIME                 (idx, 1)        = 4.10000E-02 ;
TRANSPORT_CYCLE_TIME      (idx, 1)        = 3.72867E-01 ;
BURNUP_CYCLE_TIME         (idx, 1)        = 0.00000E+00 ;
PROCESS_TIME              (idx, 1)        = 4.66665E-04 ;
CYCLE_IDX                 (idx, 1)        = 50 ;
SOURCE_NEUTRONS           (idx, 1)        = 50000 ;
MEAN_POP_SIZE             (idx, [1:  2])  = [  1.00000E+03 0.00000 ];
MEMSIZE                   (idx, 1)        = 209.5;
SIMULATION_COMPLETED      (idx, 1)        = 1 ;

% Energy grid parameters:

ERG_EMIN                  (idx, 1)        = 1.00000E-11 ;
ERG_EMAX                  (idx, 1)        = 2.00000E+01 ;
ERG_TOL                   (idx, 1)        = 1.00000E-05 ;
ERG_NE                    (idx, 1)        = 140218 ;
ERG_NE_INI                (idx, 1)        = 159443 ;
ERG_NE_IMP                (idx, 1)        = 25889 ;
ERG_DIX                   (idx, 1)        = 0 ;
USE_DBRC                  (idx, 1)        = 0 ;
URES_MODE                 (idx, 1)        = 1 ;
URES_DILU_CUT             (idx, 1)        = 0.00000E+00 ;
URES_EMIN                 (idx, 1)        = 1.00000E+37 ;
URES_EMAX                 (idx, 1)        = -1.00000E+37 ;
URES_AVAIL                (idx, 1)        = 0 ;
URES_USED                 (idx, 1)        = 0 ;

% Nuclides and reaction channels:

TOT_ISOTOPES              (idx, 1)        = 17 ;
TOT_TRANSPORT_ISOTOPES    (idx, 1)        = 17 ;
TOT_DECAY_ISOTOPES        (idx, 1)        = 0 ;
TOT_REA_CHANNELS          (idx, 1)        = 748 ;
TOT_TRANSMU_REA           (idx, 1)        = 0 ;

% Reaction mode counters:

COLLISIONS                (idx, 1)        = 2531617 ;
FISSION_FRACTION          (idx, 1)        = 8.99662E-03 ;
CAPTURE_FRACTION          (idx, 1)        = 9.96754E-03 ;
ELASTIC_FRACTION          (idx, 1)        = 9.50299E-01 ;
INELASTIC_FRACTION        (idx, 1)        = 3.06836E-02 ;
ALPHA_FRACTION            (idx, 1)        = 0.00000E+00 ;
BOUND_SCATTERING_FRACTION (idx, 1)        = 0.00000E+00 ;
NXN_FRACTION              (idx, 1)        = 5.37206E-05 ;
UNKNOWN_FRACTION          (idx, 1)        = 0.00000E+00 ;
VIRTUAL_FRACTION          (idx, 1)        = 5.72571E-01 ;

FREEGAS_FRACTION          (idx, 1)        = 2.67484E-02 ;
TOTAL_ELASTIC_FRACTION    (idx, 1)        = 9.50299E-01 ;
FISSILE_FISSION_FRACTION  (idx, 1)        = 7.79022E-01 ;
LEAKAGE_REACTIONS         (idx, 1)        = 2126 ;

REA_SAMPLING_EFF          (idx, 1)        = 3.40049E-01 ;

% Slowing-down and thermalization:

COL_SLOW                  (idx, [1:   2]) = [  1.85099E+02 0.02179 ];
COL_THERM                 (idx, [1:   2]) = [  1.56660E+01 0.04604 ];
COL_TOT                   (idx, [1:   2]) = [  4.80694E+01 0.00406 ];
SLOW_TIME                 (idx, [1:   2]) = [  2.83204E-04 0.02413 ];
THERM_TIME                (idx, [1:   2]) = [  2.51718E-04 0.05277 ];
SLOW_DIST                 (idx, [1:   2]) = [  1.81603E+02 0.02807 ];
THERM_DIST                (idx, [1:   2]) = [  5.68181E+01 0.04308 ];
THERM_FRAC                (idx, [1:   2]) = [  7.14000E-03 0.05156 ];

% Parameters for burnup calculation:

BURN_MODE                 (idx, 1)        = 2 ;
BURN_STEP                 (idx, 1)        = 1 ;
BURN_TOT_STEPS            (idx, 1)        = 1 ;
BURNUP                    (idx, 1)        = 0.00000E+00 ;
BURN_DAYS                 (idx, 1)        = 0.00000E+00 ;
ENERGY_OUTPUT             (idx, 1)        = 0.00000E+00 ;
DEP_TTA_CUTOFF            (idx, 1)        = 1.00000E-15 ;
DEP_STABILITY_CUTOFF      (idx, 1)        = 1.00000E-22 ;
DEP_FP_YIELD_CUTOFF       (idx, 1)        = 1.00000E-22 ;
DEP_XS_FRAC_CUTOFF        (idx, 1)        = 0.00000E+00 ;
DEP_XS_ENERGY_CUTOFF      (idx, 1)        = -1.00000E+00 ;
BURN_MATERIALS            (idx, 1)        = 0 ;
FP_NUCLIDES_INCLUDED      (idx, 1)        = 0 ;
FP_NUCLIDES_AVAILABLE     (idx, 1)        = 0 ;
TOT_ACTIVITY              (idx, 1)        = 0.00000E+00 ;
TOT_DECAY_HEAT            (idx, 1)        = 0.00000E+00 ;
TOT_SF_RATE               (idx, 1)        = 0.00000E+00 ;
ACTINIDE_ACTIVITY         (idx, 1)        = 0.00000E+00 ;
ACTINIDE_DECAY_HEAT       (idx, 1)        = 0.00000E+00 ;
FISSION_PRODUCT_ACTIVITY  (idx, 1)        = 0.00000E+00 ;
FISSION_PRODUCT_DECAY_HEAT(idx, 1)        = 0.00000E+00 ;

% Fission source entropies:

ENTROPY_X                 (idx, [1:   2]) = [  8.46810E-01 0.00258 ];
ENTROPY_Y                 (idx, [1:   2]) = [  7.17737E-01 0.00274 ];
ENTROPY_Z                 (idx, [1:   2]) = [  3.47807E-01 0.00804 ];
ENTROPY_TOT               (idx, [1:   2]) = [  6.19949E-01 0.00185 ];

% Fission source centre:

SOURCE_X0                 (idx, [1:   2]) = [  4.67314E-03 0.30226 ];
SOURCE_Y0                 (idx, [1:   2]) = [ -2.22805E-03 0.64794 ];
SOURCE_Z0                 (idx, [1:   2]) = [  4.21784E-01 0.55597 ];

% Criticality eigenvalues:

ANA_KEFF                  (idx, [1:   2]) = [  1.33980E+00 0.00457 ];
IMP_KEFF                  (idx, [1:   2]) = [  1.34352E+00 0.00210 ];
COL_KEFF                  (idx, [1:   2]) = [  1.34967E+00 0.00294 ];
ABS_KEFF                  (idx, [1:   2]) = [  1.34352E+00 0.00210 ];
ABS_KINF                  (idx, [1:   2]) = [  1.40290E+00 0.00207 ];
ABS_GC_KEFF               (idx, [1:   2]) = [  0.00000E+00 0.0E+00 ];
ABS_GC_KINF               (idx, [1:   2]) = [  0.00000E+00 0.0E+00 ];
IMPL_ALPHA_EIG            (idx, [1:   2]) = [  0.00000E+00 0.0E+00 ];
FIXED_ALPHA_EIG           (idx, [1:   2]) = [  0.00000E+00 0.0E+00 ];
GEOM_ALBEDO               (idx, [1:   2]) = [  1.00000E+00 0.0E+00 ];

% Normalized total reaction rates:

TOT_POWER                 (idx, [1:   2]) = [  4.00000E+02 0.0E+00 ];
TOT_GENRATE               (idx, [1:   2]) = [  3.52578E+13 0.00041 ];
TOT_FISSRATE              (idx, [1:   2]) = [  1.19749E+13 8.3E-06 ];
TOT_ABSRATE               (idx, [1:   2]) = [  2.52011E+13 0.00203 ];
TOT_LEAKRATE              (idx, [1:   2]) = [  1.11129E+12 0.02281 ];
TOT_LOSSRATE              (idx, [1:   2]) = [  2.63124E+13 0.00209 ];
TOT_SRCRATE               (idx, [1:   2]) = [ -3.37402E+10 5.11409 ];
TOT_FLUX                  (idx, [1:   2]) = [  7.00358E+15 0.00609 ];
TOT_RR                    (idx, [1:   2]) = [  1.32308E+15 0.00331 ];
TOT_SOLU_ABSRATE          (idx, [1:   2]) = [  0.00000E+00 0.0E+00 ];

TOT_FMASS                 (idx, 1)        = 5.36252E-03 ;
TOT_POWDENS               (idx, [1:   2]) = [  7.45918E-02 0.00000 ];


% Point-kinetic parameters:

ANA_PROMPT_LIFETIME       (idx, [1:   2]) = [  7.50294E-06 0.03095 ];
IMPL_PROMPT_LIFETIME      (idx, [1:   2]) = [  0.00000E+00 0.0E+00 ];
ANA_REPROD_TIME           (idx, [1:   2]) = [  5.60565E-06 0.03130 ];
IMPL_REPROD_TIME          (idx, [1:   2]) = [  0.00000E+00 0.0E+00 ];
DELAYED_EMTIME            (idx, [1:   2]) = [  1.12860E+01 0.16663 ];

% Six-factor formula:

SIX_FF_ETA                (idx, [1:   2]) = [  8.30277E-01 0.21523 ];
SIX_FF_F                  (idx, [1:   2]) = [  9.18341E-02 0.18364 ];
SIX_FF_P                  (idx, [1:   2]) = [  6.30382E-03 0.05296 ];
SIX_FF_EPSILON            (idx, [1:   2]) = [  1.42456E+02 0.21194 ];
SIX_FF_LF                 (idx, [1:   2]) = [  9.58060E-01 0.00101 ];
SIX_FF_LT                 (idx, [1:   2]) = [  9.99395E-01 0.00011 ];
SIX_FF_KINF               (idx, [1:   2]) = [  4.51636E-01 0.20839 ];
SIX_FF_KEFF               (idx, [1:   2]) = [  4.32187E-01 0.20840 ];

% Delayed neutron parameters:

USE_DELNU                 (idx, 1)        = 1 ;
PRECURSOR_GROUPS          (idx, 1)        = 8 ;
BETA_EFF                  (idx, [1:  18]) = [  4.49657E-03 0.09913  3.18326E-05 0.95439  9.02290E-04 0.29013  2.90591E-04 0.33805  6.78973E-04 0.20034  1.40791E-03 0.17718  5.61981E-04 0.22072  4.75637E-04 0.26758  1.47355E-04 0.36214 ];
BETA_ZERO                 (idx, [1:  18]) = [  4.71903E-03 0.00494  8.02728E-05 0.03642  7.56602E-04 0.02245  2.86899E-04 0.02932  7.05501E-04 0.00787  1.45956E-03 0.00773  6.53847E-04 0.03992  5.34240E-04 0.01291  2.42103E-04 0.04796 ];
DECAY_CONSTANT            (idx, [1:  18]) = [  4.70437E-01 0.12315  1.24667E-02 0.0E+00  2.82917E-02 0.0E+00  4.25244E-02 0.0E+00  1.33042E-01 0.0E+00  2.92467E-01 0.0E+00  6.66488E-01 6.6E-09  1.63478E+00 0.0E+00  3.55460E+00 0.0E+00 ];

% Parameters for group constant generation

GC_UNI                    (idx, 1)        = 3 ;
GC_SYM                    (idx, 1)        = 0 ;
GC_NE                     (idx, 1)        = 2 ;
GC_BOUNDS                 (idx, [1:   3]) = [  2.00000E+01  6.25000E-07  1.00000E-11 ];
GC_REMXS_INCLUDE_MULT     (idx, 1)        = 1 ;

% Few-group cross sections:

FLUX                      (idx, [1:   6]) = [  2.18623E+15 0.01524  2.15816E+15 0.01510  2.80699E+13 0.06320 ];
LEAK                      (idx, [1:   6]) = [  0.00000E+00 0.0E+00  0.00000E+00 0.0E+00  0.00000E+00 0.0E+00 ];
TOTXS                     (idx, [1:   6]) = [  9.42195E-02 0.00188  9.44991E-02 0.00184  7.22766E-02 0.00143 ];
FISSXS                    (idx, [1:   6]) = [  0.00000E+00 0.0E+00  0.00000E+00 0.0E+00  0.00000E+00 0.0E+00 ];
CAPTXS                    (idx, [1:   6]) = [  2.48727E-04 0.02018  2.03843E-04 0.01415  3.65120E-03 0.02057 ];
ABSXS                     (idx, [1:   6]) = [  2.48727E-04 0.02018  2.03843E-04 0.01415  3.65120E-03 0.02057 ];
RABSXS                    (idx, [1:   6]) = [  2.48727E-04 0.02018  2.03843E-04 0.01415  3.57817E-03 0.02897 ];
ELAXS                     (idx, [1:   6]) = [  9.36943E-02 0.00195  9.40152E-02 0.00191  6.86254E-02 0.00043 ];
INELAXS                   (idx, [1:   6]) = [  2.76530E-04 0.03009  2.80069E-04 0.02999  6.02676E-17 0.16107 ];
SCATTXS                   (idx, [1:   6]) = [  9.39708E-02 0.00192  9.42952E-02 0.00187  6.86254E-02 0.00043 ];
SCATTPRODXS               (idx, [1:   6]) = [  9.39708E-02 0.00192  9.42952E-02 0.00187  6.72529E-02 0.02041 ];
N2NXS                     (idx, [1:   6]) = [  0.00000E+00 0.0E+00  0.00000E+00 0.0E+00  0.00000E+00 0.0E+00 ];
REMXS                     (idx, [1:   6]) = [  2.48727E-04 0.02018  2.96910E-04 0.02387  5.78022E-03 0.04734 ];
NUBAR                     (idx, [1:   6]) = [  0.00000E+00 0.0E+00  0.00000E+00 0.0E+00  0.00000E+00 0.0E+00 ];
NSF                       (idx, [1:   6]) = [  0.00000E+00 0.0E+00  0.00000E+00 0.0E+00  0.00000E+00 0.0E+00 ];
RECIPVEL                  (idx, [1:   6]) = [  8.39647E-08 0.02295  6.68252E-08 0.01714  1.38336E-06 0.02062 ];
FISSE                     (idx, [1:   6]) = [  0.00000E+00 0.0E+00  0.00000E+00 0.0E+00  0.00000E+00 0.0E+00 ];

% Fission spectra:

CHI                       (idx, [1:   4]) = [  0.00000E+00 0.0E+00  0.00000E+00 0.0E+00 ];
CHIP                      (idx, [1:   4]) = [  0.00000E+00 0.0E+00  0.00000E+00 0.0E+00 ];
CHID                      (idx, [1:   4]) = [  0.00000E+00 0.0E+00  0.00000E+00 0.0E+00 ];

% Group-transfer probabilities and cross sections:

GTRANSFP                  (idx, [1:   8]) = [  9.99011E-01 5.4E-05  3.27727E-02 0.12314  9.88974E-04 0.05446  9.67227E-01 0.00417 ];
GTRANSFXS                 (idx, [1:   8]) = [  9.42022E-02 0.00189  2.24699E-03 0.12291  9.30663E-05 0.05376  6.63784E-02 0.00434 ];

% Group-production probabilities and cross sections:

GPRODP                    (idx, [1:   8]) = [  9.99011E-01 5.4E-05  3.27727E-02 0.12314  9.88974E-04 0.05446  9.67227E-01 0.00417 ];
GPRODXS                   (idx, [1:   8]) = [  9.42022E-02 0.00189  2.24699E-03 0.12291  9.30663E-05 0.05376  6.63784E-02 0.00434 ];

% Diffusion parameters:

DIFFAREA                  (idx, [1:   6]) = [  5.82208E+03 0.02593  5.38464E+03 0.02650  6.13202E+02 0.09227 ];
DIFFCOEF                  (idx, [1:   6]) = [  1.45138E+00 0.03368  1.59143E+00 0.03152  3.49835E+00 0.08227 ];
TRANSPXS                  (idx, [1:   6]) = [  2.42448E-01 0.03328  2.20260E-01 0.03304  1.40858E-01 0.11852 ];
MUBAR                     (idx, [1:   6]) = [ -1.57344E+00 0.05280 -1.33049E+00 0.05619 -1.00070E+00 0.24398 ];

% Material buckling:

MAT_BUCKLING              (idx, [1:   2]) = [ -1.76795E-04 0.02316 ];

% Leakage estimate of diffusion coefficient:

LEAK_DIFFCOEF             (idx, [1:   6]) = [  0.00000E+00 0.0E+00  0.00000E+00 0.0E+00  0.00000E+00 0.0E+00 ];

% PN scattering cross sections:

SCATT0                    (idx, [1:   6]) = [  9.39410E-02 0.00204  9.42747E-02 0.00200  6.75967E-02 0.01497 ];
SCATT1                    (idx, [1:   6]) = [  3.69007E-03 0.02082  3.71342E-03 0.02119  1.84186E-03 0.33583 ];
SCATT2                    (idx, [1:   6]) = [  5.28967E-04 0.14932  5.32605E-04 0.14880  3.32912E-04 1.49322 ];
SCATT3                    (idx, [1:   6]) = [  6.52876E-05 0.79098  6.79084E-05 0.77034 -5.90935E-04 0.95271 ];
SCATT4                    (idx, [1:   6]) = [ -4.80757E-05 1.07167 -5.60206E-05 0.95237  5.56041E-04 0.73628 ];
SCATT5                    (idx, [1:   6]) = [ -2.89788E-05 1.69727 -3.10918E-05 1.60589  2.66143E-04 1.35357 ];

% P1 diffusion parameters:

P1_TRANSPXS               (idx, [1:   6]) = [  9.05294E-02 0.00204  9.07857E-02 0.00205  7.04347E-02 0.00909 ];
P1_DIFFCOEF               (idx, [1:   6]) = [  3.68279E+00 0.00203  3.67241E+00 0.00205  4.75141E+00 0.00914 ];
P1_MUBAR                  (idx, [1:   6]) = [  3.92814E-02 0.02068  3.93939E-02 0.02114  2.78980E-02 0.32412 ];

% B1 critical spectrum calculation:

B1_KINF                   (idx, [1:   2]) = [  0.00000E+00 0.0E+00 ];
B1_BUCKLING               (idx, [1:   2]) = [  0.00000E+00 0.0E+00 ];
B1_FLUX                   (idx, [1:   6]) = [  0.00000E+00 0.0E+00  0.00000E+00 0.0E+00  0.00000E+00 0.0E+00 ];
B1_TOTXS                  (idx, [1:   6]) = [  0.00000E+00 0.0E+00  0.00000E+00 0.0E+00  0.00000E+00 0.0E+00 ];
B1_NSF                    (idx, [1:   6]) = [  0.00000E+00 0.0E+00  0.00000E+00 0.0E+00  0.00000E+00 0.0E+00 ];
B1_FISSXS                 (idx, [1:   6]) = [  0.00000E+00 0.0E+00  0.00000E+00 0.0E+00  0.00000E+00 0.0E+00 ];
B1_CHI                    (idx, [1:   4]) = [  0.00000E+00 0.0E+00  0.00000E+00 0.0E+00 ];
B1_ABSXS                  (idx, [1:   6]) = [  0.00000E+00 0.0E+00  0.00000E+00 0.0E+00  0.00000E+00 0.0E+00 ];
B1_RABSXS                 (idx, [1:   6]) = [  0.00000E+00 0.0E+00  0.00000E+00 0.0E+00  0.00000E+00 0.0E+00 ];
B1_REMXS                  (idx, [1:   6]) = [  0.00000E+00 0.0E+00  0.00000E+00 0.0E+00  0.00000E+00 0.0E+00 ];
B1_DIFFCOEF               (idx, [1:   6]) = [  0.00000E+00 0.0E+00  0.00000E+00 0.0E+00  0.00000E+00 0.0E+00 ];
B1_SCATTXS                (idx, [1:   8]) = [  0.00000E+00 0.0E+00  0.00000E+00 0.0E+00  0.00000E+00 0.0E+00  0.00000E+00 0.0E+00 ];
B1_SCATTPRODXS            (idx, [1:   8]) = [  0.00000E+00 0.0E+00  0.00000E+00 0.0E+00  0.00000E+00 0.0E+00  0.00000E+00 0.0E+00 ];

