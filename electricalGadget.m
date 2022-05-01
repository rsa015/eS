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
        
        function 
%         function repr = representItem(obj)
%             arguments
%                 obj
%             end
%             repr = struct('name', obj.name, 'power', obj.power, 'prange', obj.prange, 'category',obj.category, 'schedule', obj.schedule);
%             return
%         end
    end
end

