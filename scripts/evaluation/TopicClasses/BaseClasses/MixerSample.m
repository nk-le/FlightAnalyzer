classdef MixerSample < Sample
    %ATTITUDESAMPLE Summary of this class goes here
    %   Detailed explanation goes here
    
    properties
        
    end
    
    methods
        function isValid = check_data_format(obj)
            flag = isfield(obj.data, ["Time", "Tx", "Ty", "Tz", "Fz"]);
            isValid = all(flag == 1);
        end
        
        function obj = set_data_format(obj)
           obj.dataFormat = MixerFormat;
        end
        
        function [out] = get_analyzed_fieldname(obj)
            out = obj.dataFormat;
        end
        
        function dataStruct = get_data_components(obj)
            dataStruct.Time = obj.data.Time;
            dataStruct.Tx = obj.data.Tx;
            dataStruct.Ty = obj.data.Ty;
            dataStruct.Tz = obj.data.Tz;
            dataStruct.Thurst = obj.data.Thrust;
        end
        
    end
end
