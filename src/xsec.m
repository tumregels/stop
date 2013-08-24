classdef xsec < handle %< xsec.dataOptimizer
    
    properties(GetAccess = 'private', SetAccess = 'private')
        xsec_card = sprintf('XSEC\n%s',drawline())
        save_dir = pwd;
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
        
        function str = delcr_comp(self, uni)
            str = xsec.data2xsec('-delcr_comp',uni);
            self.xsec_card = [self.xsec_card, str, drawline()];
        end
        
        function str = delcr_base(self, data1, uni1, data2, uni2)
            str = xsec.data2xsec(...
                '-delcr_base',data1,uni1,data2,uni2);
            self.xsec_card = [self.xsec_card, str, drawline()];
        end
        
        function display(self)
            disp(self.xsec_card)
        end
        
        function status = write(self, dir)
            if nargin == 2
                self.save_dir = dir;
            end
            fname = fullfile(self.save_dir, 'xsecforparcs.txt');
            fid = fopen(fname, 'w');
            assert(fid ~= -1,...
                'Directory "%s" doesn''t exist.',self.save_dir)
            fwrite(fid, self.xsec_card);
            status = fclose(fid);
        end
    end
    
end

function commentstr = drawline()

commentstr =sprintf('!%s\n', repmat('=',1,20));

end

