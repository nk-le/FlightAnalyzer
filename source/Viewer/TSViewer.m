classdef TSViewer
    
    properties
        TSArr        
    end
    
    methods
        function obj = TSViewer(TSArr)
            obj.TSArr = TSArr;
        end
        
        function obj = plot(obj, varargin)
            nTs = numel(obj.TSArr);
            
            param = Parser.parse(varargin{:});
            
            figure 
            for i = 1 : nTs
               tFilter =  (obj.TSArr(i).Time <= param.tMax) & (obj.TSArr(i).Time >= param.tMin);  
               ax(i) = plot(obj.TSArr(i).Time(tFilter), obj.TSArr(i).Value(tFilter), "-o", "Color", ColorTable.colormat(i,:));
               hold on;                
            end            
            FormatFigure(gcf, 8, 4/3, 'MarkerSize', 3);
        end
        
        
        function obj = plot_expample_multi(obj)
%             x = 0:.1:4*pi;
%             plot(x,sin(x));
%             addaxis(x,sin(x-pi/3));
%             addaxis(x,sin(x-pi/2),[-2 5],'linewidth',2);
%             addaxis(x,sin(x-pi/1.5),[-2 2],'v-','linewidth',2);
%             addaxis(x,5.3*sin(x-pi/1.3),':','linewidth',2);
% 
%             addaxislabel(1,'one');
%             addaxislabel(2,'two');
%             addaxislabel(3,'three');
%             addaxislabel(4,'four');
%             addaxislabel(5,'five');
% 
%             addaxisplot(x,sin(x-pi/2.3)+2,3,'--','linewidth',2);
%             addaxisplot(x,sin(x-pi/1),5,'--','linewidth',2);
% 
%             legend('one','two','three','four','five','three-2','five-2');
%             
            %FormatFigure(gcf, 12, 12/8, 'MarkerSize', 2.5);
            
            N = 10;
            time = linspace(1,24,N);
            D = rand(7,N);
            ylimits = [0 2];
            plot(time,D(1,:));
            hold on;
            ylim(ylimits)
            for k = 2:size(D,1)
                if(mod(k,2) == 0)
                    addaxis(time,D(k,:) * k^2);
                else 
                   plot(time,D(k,:)); 
                end
            end
            ylabels = {'A','B','C','D','E','F','G'};
            xlabel('Time (hours)');
            
            hax = getaddaxisdata(gca,'axisdata');
            hax = [hax{:}];
            hax = [gca hax(1,:)];
            
            x0 = 0.1; % spacing between outermost rulers and figure edge
            xgap = 0.08; % spacing between rulers
            fontsize = 12; % base font size for all rulers/labels
            
            
            % get info about ruler locations
            nlr = nnz(strcmp({hax.YAxisLocation},'left'));
            nrr = numel(hax) - nlr;
            % calculate x-offsets for rulers, reorder to match axes order
            xposl = x0+(0:nlr-1)*xgap;
            xposr = 1-(x0+(nrr-1:-1:0)*xgap);
            xpos = zeros(1,numel(hax));
            xpos(1:2:nlr*2) = fliplr(xposl);
            xpos(2:2:nrr*2) = xposr;
            % width of primary axes
            wax = 1 - ((nlr-1)+(nrr-1))*xgap - 2*x0;
            % apply properties
            for k = 1:numel(hax)
                hax(k).Position(1) = xpos(k);
                hax(k).YLabel.String = ylabels{k};
                hax(k).FontSize = fontsize;
            end
            hax(1).Position(3) = wax;
            legend(ylabels)
            
            FormatFigure(gcf, 12, 12/8, 'MarkerSize', 2.5);
        end
        
        
    end
end
