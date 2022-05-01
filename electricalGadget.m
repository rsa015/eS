classdef electricalGadget
    
    properties
        name string
        power double {mustBeNumeric}
        category string {mustBeMember(category, {'cooling', 'heating', 'lighting', 'equipment'})}
        prange string
        schedule string
    end
    
    methods
        function obj = electricalGadget(name, power, prange, category, schedule)
            obj.name = name;
            obj.power = power;
            obj.prange = prange;
            obj.category = category;
            obj.schedule = schedule;
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
        
        function schedule = getSchedule(obj)
            arguments
               obj electricalGadget 
            end
            schedule = obj.schedule;
            scheduleRange = schedule.split(";");
            for i = 1:length(scheduleRange)
                indvTime = scheduleRange(i).split("-");
                sTime = indvTime(1);
                eTime =  indvTime(2); 
            end
            
        end
        
%         function repr = representItem(obj)
%             arguments
%                 obj
%             end
%             repr = struct('name', obj.name, 'power', obj.power, 'prange', obj.prange, 'category',obj.category, 'schedule', obj.schedule);
%             return
%         end
    end
end

