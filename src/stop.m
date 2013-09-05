classdef stop < handle
    
    properties
        serpExe = 'sss';
        saveResPar = {'ANA_KEFF';'IMP_KEFF'};
        
        name = ''; % calculation name
        values = struct();
        
        isTest     = false;
        isContinue = false;
        isEcho     = true;
        isXSEC     = false;
    end
    
    properties (SetAccess = private, GetAccess = public)
        serpParInp;
        saveDir; % save directory
    end
    
    methods
        function self = stop(filename)
            
            if nargin == 1 && exist(filename,'file')==2
                
                self.serpParInp.file = fileread(filename);
                [path, fname, ext] = fileparts(filename);
                
                if ~isempty(path)
                    self.serpParInp.dir = path;
                else
                    self.serpParInp.dir = pwd;
                end
                
                self.saveDir = self.serpParInp.dir;
                self.serpParInp.name = [fname, ext];
                self.serpParInp.fullname = ...
                    fullfile(self.serpParInp.dir,[fname ext]);
                
            else
                error('File "%s" doesn''t exist.',filename)
            end
            
        end
        
        function [simStatus results] = run(self, varargin)
            if nargin > 1
                for k=1:2:length(varargin)
                    self.values.(varargin{k}) = varargin{k+1};
                end
                [simStatus results] = stom(self);
            else
                [simStatus results] = stom(self);
            end
            self.values = struct();% clear all values
            self.name = '';% clear name
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