%% Run Torque DO V1
DesignOptimizationTool("TorqueDOSettingsV1.xml");

plotTreatmentOptimizationResultsFromSettingsFile("TorqueDOSettingsV1.xml")

%% Run Torque DO V2
DesignOptimizationTool("TorqueDOSettingsV2.xml");

plotTreatmentOptimizationResultsFromSettingsFile("TorqueDOSettingsV2.xml")

%% Run Torque DO V3
DesignOptimizationTool("TorqueDOSettingsV3.xml");

plotTreatmentOptimizationResultsFromSettingsFile("TorqueDOSettingsV3.xml")

%% Run Torque DO V4
DesignOptimizationTool("TorqueDOSettingsV4.xml");

plotTreatmentOptimizationResultsFromSettingsFile("TorqueDOSettingsV4.xml")

%% Run Torque DO V5
DesignOptimizationTool("TorqueDOSettingsV5.xml");

plotTreatmentOptimizationResultsFromSettingsFile("TorqueDOSettingsV5.xml")

%% Compare Results
plotTreatmentOptimizationResultsFromSettingsFile("TorqueDOSettingsV5.xml", ...
    ["TorqueDOResultsV3", "TorqueDOResultsV4", "TorqueDOResultsV5"])