classdef thermalZone
    %
    %
    
    properties
        totalPower
        zoneItemList = containers.Map()
        zoneName
    end
    
    methods
        function obj = thermalZone(zoneName, zoneItemList, totalPower)
            if nargin == 3
                obj.zoneName = zoneName;
                obj.zoneItemList = zoneItemList;
                obj.totalPower = totalPower;
            end
        end
        
        function addmultiItem(obj, number, varargin)
            
            p = inputParser;
            validpars = @(x) isnumeric(x) && isscalar(x) && (x > 0);
            p.addParameter('power', validpars)
            p.addRequired('name', @isstring);
            p.addParameter('category', @isstring);
            p.addParameter('pw-range', @isstring);
            p.addParameter('schedule', @isstring);
            parse(p, varargin{:});
            
            
            itemStruct = struct('number', 1, 'category', p.Results.category, 'power range', p.Results.pw-range, 'schedule', p.Results.schedule);
            
            
            if ~ number
                obj.zoneItemList(p.Results.name) = itemStruct;
            else
                itemStruct.number = number;
                obj.zoneItemList(p.Results.name) = itemStruct;
            end
            
            return
        end
        
    end
end

