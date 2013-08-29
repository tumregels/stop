function [serpInput serpInpLog] = makeSerpInp(calc)

dir = fullfile(calc.serpParInp.dir, calc.serpParInp.name);

str = fileread(dir);

[uniqPar equation expression] = stom.getSerpInpPar(str);

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

solvedEquation = evalSerpInpEquation(uniqPar, calc.values, equation);

[serpInput serpInpLog] = cookSerpInput(str, ...
    expression, equation, solvedEquation);

%==========================================================================

function solvedEquation = evalSerpInpEquation(uniqPar, inpPar, equation)

for i = 1:length(uniqPar)
    paramValue = inpPar(1).(uniqPar{i});
    if ischar(paramValue)
        eval([uniqPar{i} '= paramValue;'])
    else
        eval([uniqPar{i} '= paramValue(1);'])
    end
end

for i = 1:length(equation)
    equationValue = eval(equation{i});
    solvedEquation{i} = num2str(equationValue);
end

%==========================================================================

function [serpInput serpInpLog] = cookSerpInput(str,...
    expression, equation, evalEquation)

serpInput = str;
for i = 1:length(expression)
    serpInput = strrep(serpInput, expression{i}, evalEquation{i});
end

serpInpLog = [expression', equation', evalEquation'];


