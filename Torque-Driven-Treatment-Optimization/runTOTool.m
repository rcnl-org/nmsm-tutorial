%% Run Torque-Driven Tracking Optimization

close all
tic
TrackingOptimizationTool("TorqueTOSettingsV1.xml");
toc

%% Plot Results

plotTreatmentOptimizationResultsFromSettingsFile("TorqueTOSettingsV1.xml", ...
    ["TorqueTOResultsV1", "TorqueTOResultsV2"])


