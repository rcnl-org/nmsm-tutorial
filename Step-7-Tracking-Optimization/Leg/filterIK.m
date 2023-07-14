
model = Model("Leg.osim");
ikStorage = org.opensim.modeling.Storage("preprocessed/IKData/trial_1.mot");

[columnNames, timePoints, data] = parseMotToComponents(model, ikStorage);

order = 4;
filterCutoff = 2 * 6 / (55/0.27);
[b, a] = butter(order, filterCutoff, 'low');
processedData = filtfilt(b, a, data')';

writeToSto(columnNames, timePoints, processedData', "preprocessed/IKData/trial_1.sto");