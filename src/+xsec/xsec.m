classdef xsec %< handle
    
    properties
        GC_UNI;
        P1_TRANSPXS;
        RABSXS;
        NSF;
        FISSE;
        FISSXS;
        KFISS;% KAPPA FISSION: FISSE * FISSXS * 1.60219E-13 J/MeV
        GPRODXS;
        CHI;
    end
    
    methods
        % methods, including the constructor
        
        function self = xsec(data)
            % class constructor
            
            if(nargin == 1)
                
                self.checkdata(data)

                self.GC_UNI = data.GC_UNI;
                self.P1_TRANSPXS = data.P1_TRANSPXS;
                self.RABSXS = data.RABSXS;
                self.NSF = data.NSF;
                self.FISSE = data.FISSE;
                self.FISSXS = data.FISSXS;
                self.KFISS = data.FISSE.*data.FISSXS*1.60219E-13;%J/MeV
                self.GPRODXS = data.GPRODXS;
                self.CHI = data.CHI;

            end
        end
        
        function self = plus(self,self2)
            
            s = properties(self);
            for i = 1:length(s)
                if ~strcmp(s{i},'GC_UNI')
                self.(s{i}) = self.(s{i}) + self2.(s{i});
                end
            end
        end
        
        function self = minus(self,self2)
            
            s = properties(self);
            for i = 1:length(s)
                if ~strcmp(s{i},'GC_UNI')
                self.(s{i}) = self.(s{i}) - self2.(s{i});
                end
            end
        end
        
        function self = times(self,const)
            
            s = properties(self);
            if ~isnumeric(const) || ~isscalar(const)
                error('xsec:times',...
                    ['xsec object can be multiplied with a number.\n'...
                    '"%s" is of type %s'], const, class(const))
            end
            
            for i = 1:length(s)
                if ~strcmp(s{i},'GC_UNI')
                self.(s{i}) = self.(s{i})*const;
                end
            end 
        end
        
        function self = rdivide(self,const)
            
            s = properties(self);
            if ~isnumeric(const) || ~isscalar(const)
                error('xsec:rdivide',...
                    ['xsec object can be divided only on a number.\n'...
                    '"%s" is of type %s'], const, class(const))
            end
            
            for i = 1:length(s)
                if ~strcmp(s{i},'GC_UNI')
                self.(s{i}) = self.(s{i})/const;
                end
            end
        end
        
    end
    
    methods(Access = 'private')
        % private methods
        
        function checkdata(self,data)
            %checkdata for consistency
            s = properties(self);
            for i = 1:length(s)
                if strcmp(s{i},'KFISS')
                    continue
                elseif isempty(data.(s{i}))
                    error('xsec:checkdata',...
                        'Variable %s is missing',s{i})
                end
            end
        end
        
    end
    
end
