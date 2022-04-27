classdef thermalZone
    %
    %
    
    properties
        totalPower
        zoneItemList = containers.Map()
        zoneName
    end
    
    methods
        function obj = thermalZone(zoneName, itemList, totalPower)
            if nargin == 3
                obj.zoneName = zoneName;
                obj.zoneItemList = zoneItemList;
                obj.totalPower = totalPower;
            end
        end
        
        function addmultiItem(number, varargin)
            p = inputParser;
            validpars = @(x) isnumeric(x) && isscalar(x) && (x > 0);
            p.addParameter('power', validpars)
            p.addRequired('name', @isstring);
            p.addParameter('category', @isstring);
            p.addParameter('pw-range', @isstring);
            p.addParameter('schedule', @isstring);
            parse(p, varargin{:});
            if ~ number
                
            end
        end
        
    end
end

