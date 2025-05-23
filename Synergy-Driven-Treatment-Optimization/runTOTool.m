%% Run Torque-Driven Tracking Optimization

close all
tic
TrackingOptimizationTool('TorqueDrivenTrackingOptimizationSettings.xml');
toc

%% Plot Results

plotTreatmentOptimizationResultsFromSettingsFile('TorqueDrivenTrackingOptimizationSettings.xml')


