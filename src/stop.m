classdef stop
    
    properties
        serpExe = 'sss'
        saveResPar = {'ANA_KEFF';'IMP_KEFF'};
        saveDir = pwd; % save directory
        name; % calculation name
        
        isTest     = false;
        isContinue = true;
        isEcho     = true;
    end
    
    properties (SetAccess = private, GetAccess = public)
        serpParInp
        values
    end

    methods
        function self = stop(filename)
            
            if nargin == 1 && exist(filename,'file')==2
                
                self.serpParInp.file = fileread(filename);
                [path, fname, ext] = fileparts(filename);
                
                if ~isempty(path)
                    self.serpParInp.dir = path;
                    self.saveDir = path;
                end
                
                if ~isempty(fname)
                    self.serpParInp.name = [fname, ext];
                    self.serpParInp.fullname = fullfile(path,[fname ext]);
                end
                
            end
            
        end
        
        function [simStatus results] = run(self, varargin)
            if nargin > 0
                for k=1:2:length(varargin)
                    self.values.(varargin{k}) = varargin{k+1};
                end
            end
            [simStatus results] = stom(self);
        end
        
        function displayParameters(self)
            string = self.serpParInp.file;
            [uniqPar equation ~] = stom.getSerpInpPar(string);
            fprintf('List of unique Parameters in file "%s"\n',...
                self.serpParInp.fullname)
            disp(uniqPar');
            disp('List of unique equations')
            disp(unique(equation'));
        end

    end
end