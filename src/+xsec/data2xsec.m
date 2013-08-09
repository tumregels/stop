function string = data2xsec(varargin)

string = '';

if nargin < 1
    error('Not enough input arguments.');
else
    k = 1;
    while k <= numel(varargin)
        arg = varargin{k};
        if ~isempty(arg) && (arg(1) == '-')
            switch arg
                case '-base_macro'
                    data = varargin{k+1};
                    universe_number = varargin{k+2};
                    k = k + 2;
                    
                    uni_data = getData(data,universe_number);
                    
                    str1 = createBase( arg(2:end), uni_data.base);
                    str2 = scatMatrix(uni_data.GPRODXS,...
                        uni_data.GC_NE);
                    str3 = fiss_spec(uni_data.CHI);
                    
                    string = [string, str1, str2, str3];
                    
                case '-comp_num'
                    universe_number = varargin{k+1};
                    k = k + 1;
                    
                    str = comp_num(universe_number);
                    string = [string, str];
                    
                case '-delcr_comp'
                    universe_number = varargin{k+1};
                    k = k + 1;
                    
                    str = delcr_comp(universe_number);
                    string = [string, str];                 
                    
                case {'-delcr_base','-dxs_dtf',...
                        '-dxs_axexp','-dxs_radexp','-dxs_ddm'}
                    
                    data = varargin{k+1};
                    universe_number = varargin{k+2};
                    k = k + 2;
                    
                    uni_data = getData(data,universe_number);
                    
                    str1 = createBase( arg(2:end), uni_data.base);
                    str2 = scatMatrix(uni_data.GPRODXS,...
                        uni_data.GC_NE);
                    
                    string = [string, str1, str2];
                    
                otherwise
                    error('Unrecognized function name %s',arg)
                    
            end
        else
            error(['Wrong input %s.\n'...
                'First parameter always starts with "-" sign'],arg)
        end
        k = k + 1;
    end
end

%==========================================================================

function uni_data = getData(data, gc_uni)

ind = find(data.GC_UNI == gc_uni);

uni_data.P1_TRANSPXS = data.P1_TRANSPXS(ind,:)';
uni_data.RABSXS  =  data.RABSXS(ind,:)';
uni_data.NSF  =  data.NSF(ind,:)';
uni_data.KFISS  =  data.KFISS(ind,:)';
uni_data.GPRODXS = data.GPRODXS(ind,:);
uni_data.CHI = data.CHI(ind,:);
uni_data.GC_NE = data.GC_NE;

uni_data.base = [...
    uni_data.P1_TRANSPXS,...
    uni_data.RABSXS,...
    uni_data.NSF,...
    uni_data.KFISS...
    ];

%==========================================================================

function str = comp_num(gc_uni)

% create comp_num string using gc_uni universe number

str = sprintf(...
    ' comp_num    %d    !UNIVERSE %d\n',gc_uni*ones(1,2));

%==========================================================================

function str = delcr_comp(gc_uni)

% create delcr_comp string using gc_uni universe number

str = sprintf(' delcr_comp     !%d %d -%d    !UNIVERSE %d %d\n',...
    gc_uni(1)*ones(1,3),gc_uni(1),gc_uni(1)); 

%==========================================================================

function str = createBase(baseName, base)

% create (e.g. base_macro block) string using base.
% base is a matrix with dimensions of (GC_NE,4) and
% contains P1_TRANSPXS, RABSXS, NSF, KFISS

[row, col] = size(base);

name = sprintf([' ' baseName repmat(' ',1,12-length(baseName))]);

a{1} = sprintf(...
    [name repmat('%16.6E',1,col) '\n'],...
    base(1,:));

for j = 2:row
    
    a{j} = sprintf(...
        ['             ' repmat('%16.6E',1,col) '\n'],...
        base(j,:));
    
end

str = sprintf('%s',a{:});

%==========================================================================

function str = scatMatrix(GPRODXS, GC_NE)

% create scattering matrix using GPRODXS

scat = reshape(GPRODXS,GC_NE,[])';
scat = tril(scat,-1);
scat(1,:) = [];
scat(:,end)=[];

for m = 1:length(scat)
    
    b{m} = sprintf(...
        [ repmat('%16.6E',1,m) '\n'], scat(m,1:m));
    
end

str = sprintf('%s',b{:});

%==========================================================================

function str = fiss_spec(CHI)

% create fiss_spec string using CHI

str = sprintf(...
    [' fiss_spec   ' repmat('%16.6E',1,length(CHI)) '\n'],CHI);
