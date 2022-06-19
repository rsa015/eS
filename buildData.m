clear

%% Rooms

laundry = room('laundry');
common_areas = room('common areas');
kitchen = room('kitchen');
cinema = room('cinema');
reception = room('reception');
three_broom = room('three bedroom');
two_broom = room('two bedroom');
std_room = room('Standard rooms');


%% ElectricalGadget definition

light_bulb = electricalGadget('light bulb', 15, '8-20', 'lighting', "");
tv = electricalGadget('tv', 80, '45-120', 'equipment', "");
ac = electricalGadget('air conditioner', 1190, '1200-2200', 'cooling', "");
fan = electricalGadget('fan', 50, '45-60', 'equipment', "");
phone = electricalGadget('phone', 5, '2-5', 'equipment', "");
fridge = electricalGadget('fridge', 85, '85-120', 'cooling', "");
computer = electricalGadget('computer', 60, '45-200', 'equipment', "");
water_heater = electricalGadget('water heater', 3000, '2500-4500', 'heating', "");
pressing_iron = electricalGadget('pressing iron', 1500, '1000-2000', 'heating', "");
microwave = electricalGadget('microwave', 600, '', 'heating', "");
freezer = electricalGadget('freezer', 100, '100', 'cooling', "");
electric_oven = electricalGadget('electric oven', 2000, '', 'heating', "");
blender = electricalGadget('blender', 300, '', 'equipment', "");
printer = electricalGadget('printer', 45, '', 'equipment', "");
borehole_pump = electricalGadget('borehole pump', 1000, '1000-2000', 'equipment', "");
pool_pump = electricalGadget('pool pump', 750, '', 'equipment', "");
water_pump = electricalGadget('water pump', 1500, '1400-2200', 'equipment', "");
pool_heater = electricalGadget('pool heater', 25, '', 'heating', "");
audio_equipment = electricalGadget('audio equipment', 2500, '', 'equipment', "");
projector = electricalGadget('projector', 600, '', 'equipment', "");
washer = electricalGadget('washer', 0.0, '', 'equipment', '');
steam_iron = electricalGadget('steam iron', 2000, '', 'heating', "");
dryer = electricalGadget('dryer', 5, '', 'heating', "");
radio = electricalGadget('radio', 1 , '', "equipment", "")

%% Adding Gadgets to rooms
allEquips = {light_bulb.name, tv.name, ac.name, fan.name, phone.name, fridge.name, computer.name, water_heater.name, pressing_iron.name, microwave.name, freezer.name, electric_oven.name, blender.name, printer.name, borehole_pump.name, pool_pump.name, water_pump.name, pool_heater.name, audio_equipment.name, projector.name, washer.name, steam_iron.name, dryer.name};

% helperTable = table({zeros(23, 1), zeros(23, 1), zeros(23, 1), zeros(23, 1), zeros(23, 1)}  , 'VariableNames', {'gadgets','Number', 'Power', 'Power Range', 'category', 'Schedule'}, 'RowNames', allEquips');
%% Standard Room

std_room.addEquipments(light_bulb, 2, 7.5, "0530-0700;1830-2200");
std_room.addEquipments(ac, 1, 1190, "0600-1000;1400-1800;2000-0000;0000-0200");
std_room.addEquipments(phone, 2, 5, "");
std_room.addEquipments(tv, 1, 80, "0600-0800;2000-2300");
std_room.addEquipments(fan, 1, 50, "1400-1800;2000-0000");
std_room.addEquipments(fridge, 1, 85, "0000-0000");
std_room.addEquipments(computer, 2, 60, "");
std_room.addEquipments(water_heater, 1, 3000, "");
std_room.addEquipments(pressing_iron, 1, 1500, "");

std_roomTable = std_room.dataAsTable();
%% Two BedRoom

two_broom.addEquipments(light_bulb, 3, 15, "0530-0700;1830-2200");
two_broom.addEquipments(ac, 1, 1120, "0600-1000;1400-1800;2000-0000;0000-0200");
two_broom.addEquipments(phone, 2, 5, "");
two_broom.addEquipments(tv, 1, 80, "0600-0800;2000-2300");
two_broom.addEquipments(fan, 1, 50, "1400-1800;2000-0000");
two_broom.addEquipments(fridge, 1, 85, "0000-0000");
two_broom.addEquipments(computer, 2, 60, "");
two_broom.addEquipments(water_heater, 1, 3000, "");
two_broom.addEquipments(pressing_iron, 1, 1500, "");
two_broom.addEquipments(microwave, 1, 600, "");

two_broomTable = two_broom.dataAsTable();
%% Three BedRoom

three_broom.addEquipments(light_bulb, 3, 15, "0530-0700;1830-2200");
three_broom.addEquipments(ac, 1, 1120, "0600-1000;1400-1800;2000-0000;0000-0200");
three_broom.addEquipments(phone, 2, 5, "");
three_broom.addEquipments(tv, 1, 80, "0600-0800;2000-2300");
three_broom.addEquipments(fan, 1, 50, "1400-1800;2000-0000");
three_broom.addEquipments(fridge, 1, 85, "0000-0000");
three_broom.addEquipments(computer, 2, 60, "");
three_broom.addEquipments(water_heater, 1, 3000, "");
three_broom.addEquipments(pressing_iron, 1, 1500, "");
three_broom.addEquipments(microwave, 1, 600, "");

three_broomTable = three_broom.dataAsTable();
%% Kitchen

kitchen.addEquipments(light_bulb, 20, 20, "0430-0800;1600-2300");
kitchen.addEquipments(tv, 1, 80, "0600-0800;2000-2300");
kitchen.addEquipments(freezer, 8, 100, "0000-0000");
kitchen.addEquipments(phone, 2, 5, "");
kitchen.addEquipments(fridge, 2, 150, "0000-0000");
kitchen.addEquipments(fan, 8, 50, "1400-1800;2000-0000");
kitchen.addEquipments(computer, 2, 60, "");
kitchen.addEquipments(ac, 1, 1190, "1100-1900")
kitchen.addEquipments(electric_oven, 2, 2000, "");
kitchen.addEquipments(water_heater, 1, 3000, "1100-1400");
kitchen.addEquipments(blender, 2, 300, "");
kitchen.addEquipments(microwave, 2, 600, "");
kitchen.addEquipments(water_pump, 2, 1500, "");
kitchen.addEquipments(water_heater, 1, 3000, "");
kitchen.addEquipments(pool_pump, 2, 750, "");
kitchen.addEquipments(pool_heater, 1, 25, "0000-0000");
kitchen.addEquipments(borehole_pump, 2, 1000, "");
kitchen.addEquipments(pressing_iron, 2, 1500, "");

kitchenTable = kitchen.dataAsTable();
%% Common Areas

common_areas.addEquipments(light_bulb, 40, 20, "1800-0600");
% common_areas.addEquipments(tv, 1, 80, "0600-0800;2000-2300");
% common_areas.addEquipments(chiller, 1, 2000, "");
common_areas.addEquipments(fan, 4, 50, "1000-2000");
% common_areas.addEquipments(phone, 2, 5, "");
% common_areas.addEquipments(water_heater, 1, 3000, "");
% common_areas.addEquipments(fridge, 2, 85, "");
% common_areas.addEquipments(computer, 2, 100, "");

commonAreasTable = common_areas.dataAsTable();
%% Reception

reception.addEquipments(light_bulb, 6, 20, "1800-0600");
reception.addEquipments(tv, 1, 100, "0000-0000");
reception.addEquipments(computer, 2, 100, "0000-0000");
reception.addEquipments(phone, 3, 5, "");
reception.addEquipments(printer, 1, 45, "");
% reception.addEquipments(fridge, 2, 85, "");

receptionTable =  reception.dataAsTable();
%% Cinema

cinema.addEquipments(light_bulb, 4, 15, "");
cinema.addEquipments(projector, 1, 600, "");
cinema.addEquipments(audio_equipment, 1, 2500, "");
cinema.addEquipments(ac, 2, 1700, "");

cinemaTable = cinema.dataAsTable();
%% Laundry

laundry.addEquipments(light_bulb, 20, 20, "0430-0800;1600-2300");
laundry.addEquipments(tv, 1, 80, "");
laundry.addEquipments(washer, 8, 250, "");
laundry.addEquipments(dryer, 6, 5, "");
laundry.addEquipments(steam_iron, 2, 2000, "1100-1600");

laundryTable = laundry.dataAsTable();
%% local hub

%% Join All table
allTables = {std_roomTable, two_broomTable, three_broomTable, receptionTable, cinemaTable, kitchenTable, commonAreasTable, laundryTable};

% tbAll = joinMultiTable(allTables);
% 
% function allJoined = joinMultiTable(allTables)
%     arguments
%         allTables (1,:) cell
% %         helperTable table
%     end
%     Tname = allTables{1}.Properties.VariableNames{1};
%     name = splitvars(allTables{1}, Tname);
%     joined = cell(1, length(allTables));
%     for tble = 2:length(allTables)
%         
%         tableName = allTables{tble}.Properties.VariableNames{1};
%         loop_tname = splitvars(allTables{tble}, tableName);
%         joined{tble} = outerjoin(name, loop_tname, 'Keys', [1 1], 'MergeKeys', true);
%         name = loop_tname;
%         allJoined = cell2table(joined);
%     end
%     
%     return
% end


tableName1 = allTables{1}.Properties.VariableNames{1};
loop_tname1 = splitvars(allTables{1}, tableName1);

tableName2 = allTables{2}.Properties.VariableNames{1};
loop_tname2 = splitvars(allTables{2}, tableName2);

tableName3 = allTables{3}.Properties.VariableNames{1};
loop_tname3 = splitvars(allTables{3}, tableName3);

tableName4 = allTables{4}.Properties.VariableNames{1};
loop_tname4 = splitvars(allTables{4}, tableName4);

tableName5 = allTables{5}.Properties.VariableNames{1};
loop_tname5 = splitvars(allTables{5}, tableName5);

tableName6 = allTables{6}.Properties.VariableNames{1};
loop_tname6 = splitvars(allTables{6}, tableName6);

tableName7 = allTables{7}.Properties.VariableNames{1};
% disp(tableName7);
loop_tname7 = splitvars(allTables{7}, tableName7);

tableName8 = allTables{8}.Properties.VariableNames{1};
% disp(tableName8);
loop_tname8 = splitvars(allTables{8}, tableName8);

allTab2 = outerjoin(loop_tname1, loop_tname2, 'Keys', [1 1], 'MergeKeys', true);
allTab3 = outerjoin(loop_tname3, loop_tname4, 'Keys', [1 1], 'MergeKeys', true);
allTab4 = outerjoin(loop_tname5, loop_tname6, 'Keys', [1 1], 'MergeKeys', true);
allTab5 = outerjoin(loop_tname7, loop_tname8, 'Keys', [1 1], 'MergeKeys', true);

comb23 = outerjoin(allTab2, allTab3, 'Keys', [1 1], 'MergeKeys', true);
comb45 = outerjoin(allTab4, allTab5, 'Keys', [1 1], 'MergeKeys', true);
% allTab6 = outerjoin(allTab5, loop_tname6, 'Keys', [1 1], 'MergeKeys', true);
% allTab7 = outerjoin(allTab6, loop_tname7 , 'Keys', [1 1], 'MergeKeys', true);
% allTab8 = outerjoin(allTab7, loop_tname8, 'Keys', [1 1], 'MergeKeys', true);
 
allComb = outerjoin(comb23, comb45, 'Keys', [1 1], 'MergeKeys', true);


% tableWritten = writetable(allComb, 'rawData01.xlsx');