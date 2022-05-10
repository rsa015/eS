classdef room < containers.Map
    %UNTITLED3 Summary of this class goes here
    %   Detailed explanation goes here
    
    properties
       equipments containers.Map;
       name string;
    end
    
    methods
        function obj = room(name, equipments)
            obj.name = name;
            obj.equipments = equipments;
            
            obj(obj.name) = obj.equipments;
            
            return
        end
        
        function addEquipments(obj, item)
            arguments
                obj
                item electricalGadget
            end
            obj.equipments(item.name) = item.getProps();
        end
    end
end

