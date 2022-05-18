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
        function addEquipments(obj, item, number, power, schedule)
            arguments
                obj
                item electricalGadget
                number double
                power double
                schedule string
            end
            
            itemName = item.getName();
            item.schedule = schedule;
            item.number = number;
            item.power = power;
            obSchedule = room.getSchedule(item.schedule);
            obj.equipments(itemName) = {item.number, item.power, item.prange, item.category, obSchedule};
            obj.rObject(obj.name) = obj.equipments;
            
        end
        
        function roomTable = dataAsTable(obj)
            arguments
                obj
            end
%             roomTable = sprintf(obj.name);
            data = obj.equipments.values;
            names = obj.equipments.keys;
            roomTable = cell2table(data', 'RowNames', names);
            roomTable = splitvars(roomTable, 'Var1');
            roomTable.Properties.VariableNames = {'Number', 'Power', 'Power Range', 'Category', 'Schedule'};
%             roomTable.Category = categorical(roomTable.Category);
            roomTable = table(roomTable);
            roomTable = renamevars(roomTable, 'roomTable', obj.name);
            return
        end
    end
    
    methods (Static)
        function inUse = getSchedule(schedule)
%             arguments
%                schedule string; 
%             end
            scheduleRange = schedule.split(";");
            usageTime = {1, length(scheduleRange)};
            if length(scheduleRange) > 1
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
            else
%                 inUse = schedule;
            end
            inUse = usageTime;
            return 
        end
    end
end

