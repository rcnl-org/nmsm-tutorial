
model = Model("TibiaCalcn.osim");
ikStorage = org.opensim.modeling.Storage("preprocessed/IKData/trial_1.mot");

[columnNames, timePoints, data] = parseMotToComponents(model, ikStorage);

order = 4;
filterCutoff = 6;
[b, a] = butter(order, filterCutoff, 'low');
processedData = filtfilt(b, a, data')';

writeToSto(columnNames, timePoints, processedData, "preprocessed/IKData/trial_2.sto");