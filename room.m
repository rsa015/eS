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
            obSchedule = room.getSchedule(item.schedule, 1);
            obj.equipments(itemName) = {item.number, item.power, item.prange, item.category, obSchedule};
            obj.rObject(obj.name) = obj.equipments;
            
            
        end
        
        function dataRoom = getRoomInfo(obj)
            arguments
               obj room 
            end
            inRoom = keys(obj.equipments);
            inRoomLen = length(inRoom);
            roomData = {1, inRoomLen};
            for ii = 1:inRoomLen
                appName = inRoom{ii};
                props = obj.equipments(appName);
                p = props{1} * props{2};
                category = props{4};
                schedule = props{5};
                roomData{ii} = [{p}, {category}, schedule(:)'];
            end
%             schD = roomData{3}{3};
%             for i = 1:numel(schD)
%                 disp(class(schD{i}));
%             end
            dataRoom = roomData;
            return
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
        
        function roomDaily = getdailyRoom(obj)
            arguments
                obj room
            end
            
            roomProps = obj.getRoomInfo();
            nL = {1, length(roomProps)};
            for ii = 1:length(roomProps)
                el = roomProps{ii};
                n = length(el);
                inTel = el(3:n);
                dateVal = unique(sortrows(cat(1,inTel{:})));
                nL{ii} = {((el{1}-el{1}*0.95).*rand(length(dateVal),1)+el{1}*0.95), el{2}, dateVal};
            end
            roomDaily = nL;
        end
        
        function roomEqTbs = getEqTbs(obj)
            arguments
                obj room
            end
            nL = obj.getdailyRoom();
            lenN = length(nL);
            varNames = {1, lenN};
            values = {1, lenN};
            rowData = {1, lenN};
            tble = {1, lenN};
            for ii = 1:lenN
                tb = nL{ii};
                tb1 = tb(1);
%                 disp(class(tb1{1}));
                values{ii} = tb1{1};
                varNames{ii} = tb(2);  
                rowData{ii} = tb(3);
                tble{ii} = [values{ii}, varNames{ii}, rowData{ii}];
            end
            roomEqTbs = tble;
        end
        
        function roomTable = getRoomTable(obj)
            arguments
                obj room;
            end
            tble = obj.getEqTbs();
            tbles = {1, length(tble)};
            for ii = 1:length(tble)
                tb = tble{ii};
                tb1 = tb{1};
                tb3 = tb{3};
                tbles{ii} = table(tb3(:), tb1(:), 'VariableNames', {'Time', 'a'});
                tbles{ii} = renamevars(tbles{ii}, 'a', tb{2});
            end
            
            roomTable = tbles;
        end
        
        function yData = yearlyData(obj, year)
            arguments
               obj room
               year double
            end
            rProps = obj.getRoomInfo();
            ydata = {1, length(rProps)};
            for ii = 1:length(rProps)
                elts = rProps{ii};
                n = length(elts);
                inTel = elts(3:n);
                dateVal = unique(sortrows(cat(1,inTel{:})));
                lendateVal = length(dateVal);
                dateVals = repelem({dateVal}, 365);
%                 dateVals = unique(sortrows(cat(1, dateVals{:})));
                  
                ydata{ii} = {((elts{1}-elts{1}*0.95).*rand(length(dateVals)*lendateVal,1)+elts{1}*0.95), elts{2}, dateVals};
            end
            
            dArr = (datetime(year, 1, 1):days(1):datetime(year, 12, 31))';
            yD = {length(dArr), 1};
            for e = 1:length(ydata)
                dataInt = ydata{1, e};
                dataSub = dataInt{3}';
%                 disp(dataSub);
                for ei = 1:length(dArr)
                    yD{ei} = dArr(ei) + dataSub{ei};
%                     dataInt{3} = yD{ei};
                end
%                 disp(unique(sortrows(cat(1, yD{:}))));
%                 disp(yD);
                ydata{1, e}{1, 3} = sortrows(cat(1, yD{:}));
            end
            yData = ydata;
        end
        
        function rYearly = getEqpYeary(obj)
            arguments
              obj room 
            end
            ynL = obj.yearlyData(2018);
            lenN = length(ynL);
            varNames = {1, lenN};
            values = {1, lenN};
            rowData = {1, lenN};
            tble = {1, lenN};
            for ii = 1:lenN
                tb = ynL{ii};
                tb1 = tb(1);
            %                 disp(class(tb1{1}));
                values{ii} = tb1{1}';
%                 disp('lenValues', length(values{ii}));
                varNames{ii} = tb(2);
%                 disp('lenVarNames', length(varNames{ii}));
                rowData{ii} = tb(3);
%                 disp('lenRowData', length(rowData{ii}));
                tble{ii} = [values{ii}, varNames{ii}, rowData{ii}];
            end
            rYearly = tble;
        end
        
        function ytsTable = getYearlyTable(obj)
            arguments
                obj room
            end
            tble = obj.getEqpYeary();
            tbles = {1, length(tble)};
            for ii = 1:length(tble)
                tb = tble{ii};
                tb1 = tb{1};
    %                 fprintf('%d\n', size(tb1(:)));
                tb3 = tb{3};
    %                 fprintf('%d\n', size(tb3(:)));
                tbles{ii} = table(tb3(:), tb1(:), 'VariableNames', {'Time', 'a'});
                tbles{ii} = renamevars(tbles{ii}, 'a', tb{2});
            end

            ytsTable = tbles;

        end
    end
    
    methods (Static)
%         function genData()
%             
%         end
        function timeSeriesTable = timeDataTable()
%             arguments
%                roomObj room
%             end
            rData = (datetime(2018,1,1,0,0,0):hours(0.5):datetime(2019,12,31,0,0,0))';
            rowLength = length(rData);
            varName = {'cooling', 'heating', 'equipments', 'lighting'};
            empTable = table(rData, zeros(rowLength,1), zeros(rowLength,1), zeros(rowLength, 1), zeros(rowLength, 1), 'VariableNames', varName);
            timeSeriesTable = empTable;
        end
        function inUse = getSchedule(schedule, timestamp)
%             arguments
%                schedule string; 
%             end
            scheduleRange = schedule.split(";");
            if length(scheduleRange) > 1 || length(split(schedule, '-')) > 1
                usageTime = {1, length(scheduleRange)};
%                 dates = [datetime(2018,1,1,0,0):hours(0.5):datetime(2019,12,31,0,0)];
                for i = 1:length(scheduleRange)
                    indvTime = scheduleRange(i).split("-");
                    sStr = sprintf('%s', indvTime(1));
                    sTime = strcat(sStr(1:2), ":", sStr(3:4));
                    eStr = sprintf('%s', indvTime(2)); 
                    eTime = strcat(eStr(1:2), ":", eStr(3:4)); 
                    startT = duration(sTime, 'InputFormat', 'hh:mm');
                    endT = duration(eTime, 'InputFormat', 'hh:mm');
                    usageTime{i} = (startT:hours(timestamp):endT)';
                end
                inUse = usageTime;
            elseif length(scheduleRange) == 1
                if double(schedule)< 1
                    randT = randi([0 22], 1);
                    useTime = {};
                    randString = sprintf("%d", randT)+":"+"00";
                    if double(schedule) > 0.5
                        useTime{1} = (duration(randString, 'InputFormat','hh:mm'):hours(timestamp):duration(randString, 'InputFormat', "hh:mm")+hours(1))';
                    else
                        useTime{1} = (duration(randString, 'InputFormat', "hh:mm")+hours(timestamp))';
                    end
                    inUse = useTime;
                else
                    randT = randi([0 11], 1);
                    useTime = {1, length(randT)};
                    for iii = 1:length(randT)
                        th = sprintf('%d', randT(iii));
                        tString = th+":00";
                        useTime{iii} = (duration(tString, 'InputFormat', 'hh:mm'):hours(timestamp): duration(tString, 'InputFormat', 'hh:mm') + hours(double(timestamp)))';
                    end
                    inUse = useTime;
                end
            end
            return 
        end
    end
end

