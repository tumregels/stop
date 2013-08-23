function [serpInput serpInpLog] = makeSerpInp(calc)

dir = fullfile(calc.serpParInp.dir, calc.serpParInp.name);

str = fileread(dir);

[uniqPar equation expression] = getSerpInpPar(str);

try
    assert( length(fieldnames(calc.values))==length(uniqPar) )
catch exception
    if (strcmp(exception.identifier, ...
            'MATLAB:assert:failed'))
        disp('List of parameters inside data file')
        disp(fieldnames(calc.values))
        disp(['List of parameters in "' calc.serpParInp.name '" file'])
        disp(uniqPar(:))
        error('stom:wrongSerpentInput',...
            ['Wrong input file "%s".\n',...
            'Check list of input parameters'],...
            calc.serpParInp.name)
    else
        % Unknown error.
        throw(exception);
    end
end

evalEquation = evalSerpInpEquation(uniqPar, calc.values, equation);

[serpInput serpInpLog] = cookSerpInput(str, ...
    expression, equation, evalEquation);



%==========================================================================

function [uniqPar equation expression] = getSerpInpPar(serpParInp)

% match = regexp(serpParInp, '[\n]', 'split');

exp = '<(?<equation>[^>]+)>';
[match expression] = regexp(serpParInp, exp,'names','match');
[equation{1:length(match)}] = match.equation;

exp = '[A-Za-z]+\w+';
for i = 1:length(match)
    try
        param(i) = regexp(equation{i}, exp,'match');
        
    catch exception
        
        if (strcmp(exception.identifier, ...
                'MATLAB:subsassignnumelmismatch'))
            disp(equation{i});
            s1 = 'Wrong input parameter.';
            s2 = ' Probably "<" or ">" is missing in *.spi file.\n';
            msg = [s1 s2 equation{i}];
            error('stom:makeSerpInp:WrongSerpentInput', msg);
        else
            % Unknown error.
            throw(exception);
        end
    end
end

uniqPar = unique(param);

%==========================================================================

function evalEquation = evalSerpInpEquation(uniqPar, inpPar, equation)

for i = 1:length(uniqPar)
    eval([uniqPar{i} '= inpPar.(uniqPar{i});'])
end

for i = 1:length(equation)
    value = eval(equation{i});
    if iscell(value)
        evalEquation{i} = num2str(value{1});
    else
        evalEquation{i} = num2str(value);
    end
end

%==========================================================================

function [serpInput serpInpLog] = cookSerpInput(str,...
    expression, equation, evalEquation)

serpInput = str;
for i = 1:length(expression)
    serpInput = strrep(serpInput, expression{i}, evalEquation{i});
end

serpInpLog = [expression', equation', evalEquation'];


