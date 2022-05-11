classdef thermalZone
    properties
        totalPower (1,1) double
        zoneItemList containers.Map
        zoneName (1,1) string
        thermalzones (1,:) cell
    end
    
    methods
        function obj = thermalZone(name)
            obj.zoneName = string(name);
            obj.zoneItemList = containers.Map();
            obj.totalPower = 0.0;
            obj.thermalzones{end+1} = name;
        end
    end
end

