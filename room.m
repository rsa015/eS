classdef room 
    
    properties
        equipments containers.Map;
        rObject containers.Map;
        name char;
    end
    
    methods
        function obj = room(name)
            obj.name = name;
            obj.equipments = containers.Map();
            obj.rObject = containers.Map();
            return
        end
        
        function equips = addEquipments(obj, item)
            arguments
                obj
                item electricalGadget
            end
            itemName = item.getName();
            obj.equipments(itemName) = item.getProps();
            obj.rObject(obj.name) = obj.equipments;
            equips = obj.rObject;
            
            return
        end
        
        function roomData = dataAsTable(obj)
            arguments
                obj
            end
            roomData = obj.rObject.values;
            return
        end
    end
end

