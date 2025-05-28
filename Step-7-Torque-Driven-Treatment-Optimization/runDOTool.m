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

%% Run Torque DO V5
close all
DesignOptimizationTool("TorqueDOSettingsV5.xml");

plotTreatmentOptimizationResultsFromSettingsFile("TorqueDOSettingsV5.xml")

%% Compare Results
close all
plotTreatmentOptimizationResultsFromSettingsFile("TorqueDOSettingsV5.xml", ...
    ["TorqueDOResultsV3", "TorqueDOResultsV4", "TorqueDOResultsV5"])