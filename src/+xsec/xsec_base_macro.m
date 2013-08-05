classdef xsec_base_macro < xsec
    methods
        function self = xsec_base_macro(data)
            %xsec_base_macro Constructor
            self = self@xsec(data);
        end
    
        function printme(self)
            display(self);
        end
    end
    
end