%% Run Torque TO V1

TrackingOptimizationTool("TorqueTOSettingsV1.xml");

plotTreatmentOptimizationResultsFromSettingsFile("TorqueTOSettingsV1.xml")


%% Run Torque TO V2
close all
TrackingOptimizationTool("TorqueTOSettingsV2.xml");

plotTreatmentOptimizationResultsFromSettingsFile("TorqueTOSettingsV2.xml")