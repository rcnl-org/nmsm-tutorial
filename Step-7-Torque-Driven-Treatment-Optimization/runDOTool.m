%% Run Torque DO V1
close all
DesignOptimizationTool("TorqueDOSettingsV1.xml");

plotTreatmentOptimizationResultsFromSettingsFile("TorqueDOSettingsV1.xml")

%% Run Torque DO V2
close all
DesignOptimizationTool("TorqueDOSettingsV2.xml");

plotTreatmentOptimizationResultsFromSettingsFile("TorqueDOSettingsV2.xml")

%% Run Torque DO V3
close all
DesignOptimizationTool("TorqueDOSettingsV3.xml");

plotTreatmentOptimizationResultsFromSettingsFile("TorqueDOSettingsV3.xml")

%% Run Torque DO V4
close all
DesignOptimizationTool("TorqueDOSettingsV4.xml");

plotTreatmentOptimizationResultsFromSettingsFile("TorqueDOSettingsV4.xml")

%% Compare Results
close all
plotTreatmentOptimizationResultsFromSettingsFile("TorqueDOSettingsV4.xml", ...
    ["TorqueDOResultsV3", "TorqueDOResultsV4"])