
model = Model("RightLegAndPelvisKneeNoAdd.osim");
ikStorage = org.opensim.modeling.Storage("preprocessed/IKData/kick_1.mot");

[columnNames, timePoints, data] = parseMotToComponents(model, ikStorage);

order = 4;
filterCutoff = 2 * 6 / (55/0.27);
[b, a] = butter(order, filterCutoff, 'low');
processedData = filtfilt(b, a, data')';

writeToSto(columnNames, timePoints, processedData', "preprocessed/IKData/kick_1.sto");