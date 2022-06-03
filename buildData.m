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

%% Adding Gadgets to rooms
allEquips = {light_bulb.name, tv.name, ac.name, fan.name, phone.name, fridge.name, computer.name, water_heater.name, pressing_iron.name, microwave.name, freezer.name, electric_oven.name, blender.name, printer.name, borehole_pump.name, pool_pump.name, water_pump.name, pool_heater.name, audio_equipment.name, projector.name, washer.name, steam_iron.name, dryer.name};
   
% helperTable = table({zeros(23, 1), zeros(23, 1), zeros(23, 1), zeros(23, 1), zeros(23, 1)}  , 'VariableNames', {'gadgets','Number', 'Power', 'Power Range', 'category', 'Schedule'}, 'RowNames', allEquips');
%% Standard Room

std_room.addEquipments(light_bulb, 2, 7.5, "0530-0730;1830-2230");
std_room.addEquipments(ac, 1, 1190, "0630-1030;1330-1930;1930-2330;0030-0230");
std_room.addEquipments(phone, 2, 5, "3");
std_room.addEquipments(tv, 1, 80, "0630-0830;2030-2330");
std_room.addEquipments(fan, 1, 50, "1430-1830;1930-2330");
std_room.addEquipments(fridge, 1, 85, "0030-2330");
std_room.addEquipments(computer, 2, 60,"3");
std_room.addEquipments(water_heater, 1, 3000, ".75");
std_room.addEquipments(pressing_iron, 1, 1500, ".1");

std_roomTable = std_room.dataAsTable();
std_tsTable = std_room.getYearlyTable();

std_1 = outerjoin(std_tsTable{1}, std_tsTable{2}, 'Keys', [1 1], 'MergeKeys', true);
std_2 = outerjoin(std_1, std_tsTable{3}, 'Keys', [1 1], 'MergeKeys', true);
std_3 = outerjoin(std_2, std_tsTable{4}, 'Keys', [1 1], 'MergeKeys', true);
std_4 = outerjoin(std_3, std_tsTable{5}, 'Keys', [1 1], 'MergeKeys', true);
std_5 = outerjoin(std_4, std_tsTable{6}, 'Keys', [1 1], 'MergeKeys', true);
std_6 = outerjoin(std_5, std_tsTable{7}, 'Keys', [1 1], 'MergeKeys', true);
std_7 = outerjoin(std_6, std_tsTable{8}, 'Keys', [1 1], 'MergeKeys', true);
std_8 = outerjoin(std_7, std_tsTable{9}, 'Keys', [1 1], 'MergeKeys', true);

std_8 = fillmissing(std_8, 'constant', 0, 'DataVariables', @isnumeric);
writetable(std_8, 'std_roomYearly.xlsx');
%% Two BedRoom

two_broom.addEquipments(light_bulb, 3, 15, "0530-0730;1830-2230");
two_broom.addEquipments(ac, 1, 1120, "0530-0930;1330-1830;2000-2330;0030-0230");
two_broom.addEquipments(phone, 2, 5, "3");
two_broom.addEquipments(tv, 1, 80, "0630-0830;1930-2300");
two_broom.addEquipments(fan, 1, 50, "1400-1800;2000-2330");
two_broom.addEquipments(fridge, 1, 85, "0030-2330");
two_broom.addEquipments(computer, 2, 60, "3");
two_broom.addEquipments(water_heater, 1, 3000, "1");
two_broom.addEquipments(pressing_iron, 1, 1500, "1");
two_broom.addEquipments(microwave, 1, 600, ".5");

two_broomTable = two_broom.dataAsTable();
twobroom_tsTable = two_broom.getYearlyTable();

t3br_1 = outerjoin(twobroom_tsTable{1}, twobroom_tsTable{2}, 'Keys', [1 1], 'MergeKeys', true);
t3br_2 = outerjoin(t3br_1, twobroom_tsTable{3}, 'Keys', [1 1], 'MergeKeys', true);
t3br_3 = outerjoin(t3br_2, twobroom_tsTable{4}, 'Keys', [1 1], 'MergeKeys', true);
t3br_4 = outerjoin(t3br_3, twobroom_tsTable{5}, 'Keys', [1 1], 'MergeKeys', true);
t3br_5 = outerjoin(t3br_4, twobroom_tsTable{6}, 'Keys', [1 1], 'MergeKeys', true);
t3br_6 = outerjoin(t3br_5, twobroom_tsTable{7}, 'Keys', [1 1], 'MergeKeys', true);
t3br_7 = outerjoin(t3br_6, twobroom_tsTable{8}, 'Keys', [1 1], 'MergeKeys', true);
t3br_8 = outerjoin(t3br_7, twobroom_tsTable{9}, 'Keys', [1 1], 'MergeKeys', true);
tbr_9 = outerjoin(t3br_8, twobroom_tsTable{10}, 'Keys', [1 1], 'MergeKeys', true);

tbr_tsTable = fillmissing(tbr_9, 'constant', 0, 'DataVariables', @isnumeric);

writetable(tbr_tsTable, 'twobedroomYearly.xlsx')
%% Three BedRoom

three_broom.addEquipments(light_bulb, 3, 15, "0530-0730;1830-2230");
three_broom.addEquipments(ac, 1, 1120, "0530-0930;1330-1730;1930-2330;0030-0330");
three_broom.addEquipments(phone, 2, 5, "3");
three_broom.addEquipments(tv, 1, 80, "0530-0730;1930-2330");
three_broom.addEquipments(fan, 1, 50, "1430-1830;1930-2330");
three_broom.addEquipments(fridge, 1, 85, "0030-2330");
three_broom.addEquipments(computer, 2, 60, "3");
three_broom.addEquipments(water_heater, 1, 3000, "1");
three_broom.addEquipments(pressing_iron, 1, 1500, "1");
three_broom.addEquipments(microwave, 1, 600, "1");

three_broomTable = three_broom.dataAsTable();
threebroom_tsTable = three_broom.getYearlyTable();

t3br_1 = outerjoin(threebroom_tsTable{1}, threebroom_tsTable{2}, 'Keys', [1 1], 'MergeKeys', true);
t3br_2 = outerjoin(t3br_1, threebroom_tsTable{3}, 'Keys', [1 1], 'MergeKeys', true);
t3br_3 = outerjoin(t3br_2, threebroom_tsTable{4}, 'Keys', [1 1], 'MergeKeys', true);
t3br_4 = outerjoin(t3br_3, threebroom_tsTable{5}, 'Keys', [1 1], 'MergeKeys', true);
t3br_5 = outerjoin(t3br_4, threebroom_tsTable{6}, 'Keys', [1 1], 'MergeKeys', true);
t3br_6 = outerjoin(t3br_5, threebroom_tsTable{7}, 'Keys', [1 1], 'MergeKeys', true);
t3br_7 = outerjoin(t3br_6, threebroom_tsTable{8}, 'Keys', [1 1], 'MergeKeys', true);
t3br_8 = outerjoin(t3br_7, threebroom_tsTable{9}, 'Keys', [1 1], 'MergeKeys', true);
t3br_9 = outerjoin(t3br_8, threebroom_tsTable{10}, 'Keys', [1 1], 'MergeKeys', true);

t3br_tsTable = fillmissing(t3br_9, 'constant', 0, 'DataVariables', @isnumeric);

writetable(t3br_tsTable, 'threebedroomYearly.xlsx')
%% Kitchen

kitchen.addEquipments(light_bulb, 20, 20, "0330-0730;1530-2230");
kitchen.addEquipments(tv, 1, 80, "0530-0730;1930-2230");
kitchen.addEquipments(freezer, 8, 100, "0030-2330");
kitchen.addEquipments(phone, 2, 5, "3");
kitchen.addEquipments(fridge, 2, 150, "0030-2330");
kitchen.addEquipments(fan, 8, 50, "1330-1730;1930-2330");
kitchen.addEquipments(computer, 2, 60, "3");
kitchen.addEquipments(ac, 1, 1190, "1030-1830")
kitchen.addEquipments(electric_oven, 2, 2000, "2");
kitchen.addEquipments(water_heater, 1, 3000, "1030-1330");
kitchen.addEquipments(blender, 2, 300, "1");
kitchen.addEquipments(microwave, 2, 600, "1");
kitchen.addEquipments(water_pump, 2, 1500, "3");
kitchen.addEquipments(water_heater, 1, 3000, "1");
kitchen.addEquipments(pool_pump, 2, 750, "12");
kitchen.addEquipments(pool_heater, 1, 25, "0030-2330");
kitchen.addEquipments(borehole_pump, 2, 1000, "5");
kitchen.addEquipments(pressing_iron, 2, 1500, "10");

kitchenTable = kitchen.dataAsTable();
k_tsTable = kitchen.getYearlyTable();

kts_1 = outerjoin(k_tsTable{1}, k_tsTable{2}, 'Keys', [1 1], 'MergeKeys', true);
kts_2 = outerjoin(kts_1, k_tsTable{3}, 'Keys', [1 1], 'MergeKeys', true);
kts_3 = outerjoin(kts_2, k_tsTable{4}, 'Keys', [1 1], 'MergeKeys', true);
kts_4 = outerjoin(kts_3, k_tsTable{5}, 'Keys', [1 1], 'MergeKeys', true);
kts_5 = outerjoin(kts_4, k_tsTable{6}, 'Keys', [1 1], 'MergeKeys', true);
kts_6 = outerjoin(kts_5, k_tsTable{7}, 'Keys', [1 1], 'MergeKeys', true);
kts_7 = outerjoin(kts_6, k_tsTable{8}, 'Keys', [1 1], 'MergeKeys', true);
kts_8 = outerjoin(kts_7, k_tsTable{9}, 'Keys', [1 1], 'MergeKeys', true);
kts_9 = outerjoin(kts_8, k_tsTable{10}, 'Keys', [1 1], 'MergeKeys', true);
kts_10 = outerjoin(kts_9, k_tsTable{11}, 'Keys', [1 1], 'MergeKeys', true);
kts_11 = outerjoin(kts_10, k_tsTable{12}, 'Keys', [1 1], 'MergeKeys', true);
kts_12 = outerjoin(kts_11, k_tsTable{13}, 'Keys', [1 1], 'MergeKeys', true);
kts_13 = outerjoin(kts_12, k_tsTable{14}, 'Keys', [1 1], 'MergeKeys', true);
kts_14 = outerjoin(kts_13, k_tsTable{15}, 'Keys', [1 1], 'MergeKeys', true);
kts_15 = outerjoin(kts_14, k_tsTable{16}, 'Keys', [1 1], 'MergeKeys', true);
kts_16 = outerjoin(kts_15, k_tsTable{17}, 'Keys', [1 1], 'MergeKeys', true);

kitchen_tsTable = fillmissing(kts_16, 'constant', 0, 'DataVariables', @isnumeric);
writetable(kitchen_tsTable, 'kitchenYearly.xlsx')
%% Common Areas

common_areas.addEquipments(light_bulb, 40, 20, "1730-2330;0030-0630");
% common_areas.addEquipments(tv, 1, 80, "0600-0800;2000-2300");
% common_areas.addEquipments(chiller, 1, 2000, "");
common_areas.addEquipments(fan, 4, 50, "1030-2030");
% common_areas.addEquipments(phone, 2, 5, "");
% common_areas.addEquipments(water_heater, 1, 3000, "");
% common_areas.addEquipments(fridge, 2, 85, "");
% common_areas.addEquipments(computer, 2, 100, "");

commonAreasTable = common_areas.dataAsTable();
cAreas_tsTable = common_areas.getYearlyTable();

cAreas_1 = outerjoin(cAreas_tsTable{1}, cAreas_tsTable{2}, 'Keys', [1 1], 'MergeKeys', true);

c_AreastsTable = fillmissing(cAreas_1, 'constant', 0, 'DataVariables', @isnumeric);

writetable(c_AreastsTable, 'cAreasYearly.xlsx')
%% Reception

reception.addEquipments(light_bulb, 6, 20, "1730-2330;0030-0630");
reception.addEquipments(tv, 1, 100, "0030-2330");
reception.addEquipments(computer, 2, 100, "0030-2330");
reception.addEquipments(phone, 3, 5, "3");
reception.addEquipments(printer, 1, 45, "1");
% reception.addEquipments(fridge, 2, 85, "");

receptionTable =  reception.dataAsTable();
r_tsTable = reception.getYearlyTable();

rcp_1 = outerjoin(r_tsTable{1}, r_tsTable{2}, 'Keys', [1 1], 'MergeKeys', true);
rcp_2 = outerjoin(rcp_1, r_tsTable{3}, 'Keys', [1 1], 'MergeKeys', true);
rcp_3 = outerjoin(rcp_2, r_tsTable{4}, 'Keys', [1 1], 'MergeKeys', true);
rcp_4 = outerjoin(rcp_3, r_tsTable{5}, 'Keys', [1 1], 'MergeKeys', true);

reception_tsTable = fillmissing(rcp_4, 'constant', 0, 'DataVariables', @isnumeric);

writetable(reception_tsTable, 'receptionYearly.xlsx')
%% Cinema

cinema.addEquipments(light_bulb, 4, 15, "3");
cinema.addEquipments(projector, 1, 600, "3");
cinema.addEquipments(audio_equipment, 1, 2500, "3");
cinema.addEquipments(ac, 2, 1700, "3");

cinemaTable = cinema.dataAsTable();
cin_tsTable = cinema.getYearlyTable();

cinema_ts1 = outerjoin(cin_tsTable{1}, cin_tsTable{2}, 'Keys', [1 1], 'MergeKeys', true);
cinema_ts2 = outerjoin(cinema_ts1, cin_tsTable{3}, 'Keys', [1 1], 'MergeKeys', true);
cinema_ts3 = outerjoin(cinema_ts2, cin_tsTable{4}, 'Keys', [1 1], 'MergeKeys', true);

cinema_tsTable = fillmissing(cinema_ts3, 'constant', 0, 'DataVariables', @isnumeric);
writetable(cinema_tsTable, 'cinemaYearly.xlsx')
%% Laundry

laundry.addEquipments(light_bulb, 20, 20, "0430-0830;1630-2330");
laundry.addEquipments(tv, 1, 80, "6");
laundry.addEquipments(washer, 8, 250, "0030-2330");
laundry.addEquipments(dryer, 6, 5, "2");
laundry.addEquipments(steam_iron, 2, 2000, "1130-1630");

laundryTable = laundry.dataAsTable();
laundry_tsTable = laundry.getYearlyTable();

lTs1 = outerjoin(laundry_tsTable{1}, laundry_tsTable{2}, 'Keys', [1 1], 'MergeKeys', true);
lTs2 = outerjoin(lTs1, laundry_tsTable{3}, 'Keys', [1 1], 'MergeKeys', true);
lTs3 = outerjoin(lTs2, laundry_tsTable{4}, 'Keys', [1 1], 'MergeKeys', true);
lTs4 = outerjoin(lTs3, laundry_tsTable{5}, 'Keys', [1 1], 'MergeKeys', true);

l_tsTable = fillmissing(lTs4, 'constant', 0, 'DataVariables', @isnumeric);

writetable(l_tsTable, 'laundryYearly.xlsx')
%% end

%% Join All table
allTables = {std_roomTable, two_broomTable, three_broomTable, receptionTable, cinemaTable, kitchenTable, commonAreasTable, laundryTable};

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
