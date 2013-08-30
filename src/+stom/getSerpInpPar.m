function [uniqPar equation expression] = getSerpInpPar(serpParInp)

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
