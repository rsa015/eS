classdef thermalZone
    properties
        totalPower (1,1) double
        zoneItemList
        zoneName (1,1) string
        thermalzones (1,:) cell
    end
    
    methods
        function obj = thermalZone(name, items, totalPower)
            if nargin == 3
                obj.zoneName = string(name);
                obj.zoneItemList = items;
                obj.totalPower = totalPower;
                obj.thermalzones{end+1} = name;
            end
            return 
        end
        
        function itemsMap = addItems(obj, itemName, itemProps)
            arguments
                obj
                itemName string
                itemProps.number (1, 1) {mustBeNumeric} = 0.0
                itemProps.power (1, 1) {mustBeNumeric} = 0.0
                itemProps.prange string = ""
                itemProps.category string {mustBeMember(itemProps.category, {'cooling', 'heating', 'lighting', 'equipment'})}
                itemProps.schedule string = ""
            end
            obj.zoneItemList(itemName) = struct('number',itemProps.number, 'power', itemProps.power, 'prange', itemProps.prange, 'category', itemProps.category, 'schedule', itemProps.schedule);
            itemsMap = obj.zoneItemList;
            return
        end
        
        
        
    end
end

