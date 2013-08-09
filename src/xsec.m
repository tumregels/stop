classdef xsec < handle %< xsec.dataOptimizer
    
    properties(GetAccess = 'private', SetAccess = 'private')
        xsec_card = sprintf('XSEC\n%s',drawline())
    end
    
    methods
        
        function str = comp_num(self, uni)
            str = xsec.data2xsec('-comp_num',uni);
            self.xsec_card = [self.xsec_card, str, drawline()];
        end
        
        function str = base_macro(self, data, uni)
            str = xsec.data2xsec('-base_macro',data, uni);
            self.xsec_card = [self.xsec_card, str, drawline()];
            
        end
        
        function str = dxs_dtf(self, data, uni)
            str = xsec.data2xsec(...
                '-dxs_dtf',data,uni);
            self.xsec_card = [self.xsec_card, str, drawline()];
        end
        
        function str = dxs_axexp(self, data, uni)
            str = xsec.data2xsec(...
                '-dxs_axexp',data,uni);
            self.xsec_card = [self.xsec_card, str, drawline()];
        end
        
        function str = dxs_radexp(self, data, uni)
            str = xsec.data2xsec(...
                '-dxs_radexp',data,uni);
            self.xsec_card = [self.xsec_card, str, drawline()];
        end
        
        function str = dxs_ddm(self, data, uni)
            str = xsec.data2xsec(...
                '-dxs_ddm',data,uni);
            self.xsec_card = [self.xsec_card, str, drawline()];
        end
        
        function str = delcr_comp(self, data, uni)
            str = xsec.data2xsec(...
                '-delcr_comp',data,uni);
            self.xsec_card = [self.xsec_card, str, drawline()];
        end
        
        function str = delcr_base(self, data, uni)
            str = xsec.data2xsec(...
                '-delcr_base',data,uni);
            self.xsec_card = [self.xsec_card, str, drawline()];
        end
        
        function display(self)
            disp(self.xsec_card)
        end
        
        function status = write(self)
            fname = fullfile(pwd, 'xsecforparcs.txt');
            fid = fopen(fname, 'w');
            assert(fid ~= -1)
            fwrite(fid, self.xsec_card);
            status = fclose(fid);
        end
    end
    
end

function commentstr = drawline()

commentstr =sprintf('!%s\n', repmat('=',1,20));

end

