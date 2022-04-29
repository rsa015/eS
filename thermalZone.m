classdef thermalZone
    properties
        totalPower = 0.0
        zoneItemList = containers.Map()
        zoneName = ''
    end
    
    methods
        function obj = thermalZone(zoneName, zoneItemList, totalPower)
            if nargin == 3
                obj.zoneName = zoneName;
                obj.zoneItemList = zoneItemList;
                obj.totalPower = totalPower;
            end
        end
        
        function zoneItem = addmultiItem(varargin)
            
            itemMap = containers.Map();
            p = inputParser;
            validpars = @(x) isnumeric(x) && isscalar(x) && (x > 0);
            addParameter(p, 'power', 0.0, validpars);
            addOptional(p, 'number', 1, validpars);
            addParameter(p, 'name', '.', @ischar);
            addParameter(p, 'category', 'default', @ischar);
            addParameter(p, 'prange', '.', @ischar);
            addParameter(p, 'schedule', '.', @ischar);
            parse(p, varargin{:});
            
            
            itemStruct = struct('number', p.Results.number, 'category', p.Results.category, 'prange', p.Results.prange, 'schedule', p.Results.schedule);
            if p.Results.number
                itemMap(p.Results.name) = itemStruct;
                zoneItem = itemMap;
            end
            return
        end
        
        
        
    end
end

