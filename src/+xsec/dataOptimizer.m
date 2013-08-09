classdef dataOptimizer %< handle
    
    properties
        GC_NE;
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
        
        function self = dataOptimizer(data)
            % class constructor
            
            if(nargin == 1)
                
                self.checkdata(data)
                
                self.GC_NE = data.GC_NE(1);
                self.GC_UNI = data.GC_UNI;
                
                self.P1_TRANSPXS = data.P1_TRANSPXS(:,3:2:end);
                self.RABSXS = data.RABSXS(:,3:2:end);
                self.NSF = data.NSF(:,3:2:end);
                self.FISSE = data.FISSE(:,3:2:end);
                self.FISSXS = data.FISSXS(:,3:2:end);
                self.KFISS = ...
                    self.FISSE.*self.FISSXS*1.60219E-13;
                self.GPRODXS = data.GPRODXS(:,1:2:end);
                self.CHI = data.CHI(:,1:2:end);

            end
        end
        
        function self = plus(self,self2)
            
            s = self.getxsecnames();
            for i = 1:length(s)
                self.(s{i}) = self.(s{i}) + self2.(s{i});
            end
        end
        
        function self = minus(self,self2)
            
            s = self.getxsecnames();
            for i = 1:length(s)
                self.(s{i}) = self.(s{i}) - self2.(s{i});
            end
        end
        
        function self = times(self,const)
            
            if ~isnumeric(const) || ~isscalar(const)
                error('xsec:times',...
                    ['xsec object can be multiplied with a number.\n'...
                    '"%s" is of type %s'], const, class(const))
            end
            
            s = self.getxsecnames();            
            for i = 1:length(s)
                self.(s{i}) = self.(s{i})*const;
            end 
        end
        
        function self = rdivide(self,const)
            
            if ~isnumeric(const) || ~isscalar(const)
                error('xsec:rdivide',...
                    ['xsec object can be divided only on a number.\n'...
                    '"%s" is of type %s'], const, class(const))
            end
            
            s = self.getxsecnames();
            for i = 1:length(s)
                self.(s{i}) = self.(s{i})/const;
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
        
        function s = getxsecnames(self)
            s = properties(self);
            s = s(~ismember(s,{'GC_UNI';'GC_NE'}));% remove GC_UNI & GC_NE            
        end
        
    end
    
end
