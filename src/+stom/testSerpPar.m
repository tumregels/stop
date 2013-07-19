function testSerpPar(serpParInpFileDir)



end

function [uniqPar, equation] = getSerpPar(serpParInpFileDir)

exp = '<(?<equation>[^>]+)>';
match = regexp(serpParInpFile,exp,'names');

[equation{1:length(match)}] = match.equation;

uniqPar = unique(param);

end

function isField = compareSerpPar(match, inpPar)

exp = '[A-Z]+';    
for i = 1:length(match)
    param(i) = regexp(equations{i}, exp,'match');
end

param = unique(param);

isField = isfield(inpPar,param );

end

