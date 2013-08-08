classdef xsec < xsec.dataOptimizer
    
    properties(GetAccess = 'private', SetAccess = 'private')
        s_comp_num
        s_base_macro_str
        s_fiss_spec
        s_dxs_dtf
        s_dxs_axexp
        s_dxs_radexp
        s_dxs_ddm
    end
    
    methods
        function self = xsec(data)
            %converter Constructor
            if nargin ~= 1
                error('xsec:xsec',...
                    'Not enough input arguments.')
            end
            
            self = self@xsec.dataOptimizer(data);
            %self.base_macro = self.convert2xsec(2);
        end
        
        function s_base_macro_str = base_macro(self, un)
            ind = find(self.GC_UNI == un);
            s_base_macro_str = xsec.data2xsec(self, 'base_macro', ind);
            self.s_base_macro_str = s_base_macro_str;
        end
        
        function display(self)
            disp(self.properties)
        end
        
    end
    
end

