function [serpInput serpInpLog] = makeSerpInp(serpParInp, inpPar)

    [uniqPar equation expression] = getSerpInpPar(serpParInp);

    assert(sum(isfield(inpPar, uniqPar ))==length(uniqPar))

    evalEquation = evalSerpInpEquation(uniqPar, inpPar, equation);

    serpInput = serpParInp;
    for i = 1:length(expression)
        serpInput = strrep(serpInput,expression{i}, evalEquation{i});
    end

    serpInpLog = [expression', equation', evalEquation'];

%==========================================================================

function [uniqPar equation expression] = getSerpInpPar(serpParInp)

    exp = '<(?<equation>[^>]+)>';
    [match expression] = regexp(serpParInp, exp,'names','match');

    [equation{1:length(match)}] = match.equation;

    exp = '[A-Z]\w+';
    for i = 1:length(match)
        param(i) = regexp(equation{i}, exp,'match');
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


