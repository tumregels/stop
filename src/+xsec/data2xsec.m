function str = data2xsec(data, gc_uni)

P1_TRANSPXS = data.P1_TRANSPXS(gc_uni,:)';
RABSXS  =  data.RABSXS(gc_uni,:)';
NSF  =  data.NSF(gc_uni,:)';
KFISS  =  data.KFISS(gc_uni,:)';
GPRODXS = data.GPRODXS(gc_uni,:);
CHI = data.CHI(gc_uni,:);
GC_NE = data.GC_NE;

base = [P1_TRANSPXS, RABSXS, NSF, KFISS];

str = comp_num(gc_uni);


%a{2} = sprintf('%s%s%s%s%s',BASE_MACRO,DXS_DTF,DXS_AXEXP,DXS_RADEXP,DXS_DDM);

%str = sprintf('%s%s%s%s',a,b,c);

%==========================================================================

function str = comp_num(gc_uni)

% create comp_num string using gc_uni universe number

str = sprintf(...
    ' comp_num    %d    !UNIVERSE %d\n',gc_uni*ones(1,2));

%==========================================================================

function str = delcr_comp(gc_uni)

% create delcr_comp string using gc_uni universe number

a = sprintf(' delcr_comp    !%d %d -%d    !UNIVERSE %d %d\n',...
    gc_uni(2)*ones(1,3),gc_uni(1),gc_uni(1)); 

% TODO: adjust the dataOptimizer object

%==========================================================================

function str = base_macro(base)

% create base_macro string using base.
% base is a matrix with dimensions of (GC_NE,4) and
% contains P1_TRANSPXS, RABSXS, NSF, KFISS

[row, col] = size(base);

a{1} = sprintf(...
    [' base_macro  ' repmat('%16.6E',1,col) '\n'],...
    base(1,:));

for j = 2:row
    
    a{j} = sprintf(...
        ['             ' repmat('%16.6E',1,col) '\n'],...
        base(j,:));
    
end

str = sprintf('%s',a{:});

%==========================================================================

function str = delcr_base(base)

% create delcr_base string using base

[row, col] = size(base);

b{1} = sprintf([' delcr_base ' repmat('%16.6E',1,col) '\n'],...
    base(1,:));

for j = 2:row
    
    b{j} = sprintf(['            '...
        repmat('%16.6E',1,length(A)) '\n'],base(j,:));
    
end

str = sprintf('%s',b{:});

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
    [' fiss_spec ' repmat('%16.6E',1,length(self.CHI)) '\n'],CHI);
