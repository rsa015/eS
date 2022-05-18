classdef electricalGadget
    
    properties
        name char
        power double {mustBeNumeric}
        category string {mustBeMember(category, {'cooling', 'heating', 'lighting', 'equipment'})}
        prange string
        number double {mustBeNumeric}
        schedule string
    end
    
    methods
        function obj = electricalGadget(name, power, prange,category, schedule)
            obj.name = upper(name);
            obj.prange = prange;
            obj.power = power;
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
    end
end

