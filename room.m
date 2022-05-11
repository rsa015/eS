classdef room 
    
    properties
        equipments containers.Map;
        rObject containers.Map;
        name char;
    end
    
    methods
        function obj = room(name)
            obj.name = upper(name);
            obj.equipments = containers.Map();
            obj.rObject = containers.Map();
            return
        end
        function equips = addEquipments(obj, item, number, schedule)
            arguments
                obj
                item electricalGadget
                number double
                schedule string
            end
            itemName = item.getName();
            item.schedule = obj.getSchedule(schedule);
            item.number = number;
            obj.equipments(itemName) = item;
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
    
    methods (Static)
        function inUse = getSchedule(schedule)
            arguments
               schedule string; 
            end
            scheduleRange = schedule.split(";");
            usageTime = cell(1, length(scheduleRange));
            for i = 1:length(scheduleRange)
                indvTime = scheduleRange(i).split("-");
                sStr = sprintf('%s', indvTime(1));
                sTime = strcat(sStr(1:2), ":", sStr(3:4));
                eStr = sprintf('%s', indvTime(2)); 
                eTime = strcat(eStr(1:2), ":", eStr(3:4)); 
                startT = duration(sTime, 'InputFormat', 'hh:mm');
                endT = duration(eTime, 'InputFormat', 'hh:mm');
                usageTime{i} = [startT, endT];
            end
            
            inUse = usageTime;
            return 
        end
    end
end

