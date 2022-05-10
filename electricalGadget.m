classdef electricalGadget
    
    properties
        name string
        number double {mustBeNumeric}
        power double {mustBeNumeric}
        category string {mustBeMember(category, {'cooling', 'heating', 'lighting', 'equipment'})}
        prange string
        schedule string
    end
    
    methods
%         function this = electricalGadget(name, number, power, prange, category, schedule)
%             
%         end
        function obj = electricalGadget(name, number, power, prange, category, schedule)
            obj.name = name;
            obj.number = number;
            obj.power = power;
            obj.prange = prange;
            obj.category = category;
            obj.schedule = schedule;
%             obj = containers.Map(obj.name, struct('name', obj.name, 'number', obj.number, 'prange', obj.prange, 'caetgory', obj.category, 'schedule', obj.schedule));
            
            return
        end
        
        function power = getPower(obj)
            arguments
               obj electricalGadget 
            end
            power = obj.power;
            return
        end
        
        function name = getName(obj)
           arguments
              obj electricalGadget 
           end
           name = obj.name;
           return
        end
        
        function schedule = getSchedule(obj, schHolder)
            arguments
               obj electricalGadget
               schHolder cell;
            end
            schedules = obj.schedule;
            scheduleRange = schedules.split(";");
            for i = 1:length(scheduleRange)
                indvTime = scheduleRange(i).split("-");
                
                sStr = sprintf('%s', indvTime(1));
%                 disp(sStr);
                sTime = strcat(sStr(1:2), ":", sStr(3:4));
                eStr = sprintf('%s', indvTime(2)); 
                eTime = strcat(eStr(1:2), ":", eStr(3:4));
%                 sTime = 
                startT = duration(sTime, 'InputFormat', 'hh:mm');
                endT = duration(eTime, 'InputFormat', 'hh:mm');
                schHolder{i} = [startT, endT];
            end
            schedule = schHolder;
            return 
            
        end
        function properties = getProps(obj)
            arguments
               obj electricalGadget 
            end
            properties = struct('number', obj.number, 'power', obj.power, 'prange', obj.prange, 'category', obj.category, 'schedule', obj.schedule);
            
            return
        end
        function repr = representItem(obj)
            arguments
                obj electricalGadget
            end
            repr = struct('name', obj.name, 'power', obj.power, 'prange', obj.prange, 'category',obj.category, 'schedule', obj.schedule);
            return
        end
    end
end

