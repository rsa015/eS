classdef thermalZone
    %
    %
    
    properties
        totalPower
        itemList = containers.Map()
        zoneName
    end
    
    methods
        function obj = thermalZone(zoneName, itemList, totalPower)
            if nargin == 3
                obj.zoneName = zoneName;
                obj.itemList = itemList;
                obj.totalPower = totalPower;
            end
        end
        
        function addmultiItem(number, varargin)
            if ~ number
                
            end
        end
        
    end
end

