%% Run Torque-Driven Verification Optimization

close all
tic
VerificationOptimizationTool('TorqueVOSettings.xml');
toc

%% Plot Results

plotTreatmentOptimizationResultsFromSettingsFile('TorqueVOSettings.xml')

