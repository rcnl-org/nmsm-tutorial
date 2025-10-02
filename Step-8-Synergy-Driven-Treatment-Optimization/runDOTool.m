%% Run Synergy DO V1
DesignOptimizationTool("SynergyDOSettingsV1.xml");

plotTreatmentOptimizationResultsFromSettingsFile("SynergyDOSettingsV1.xml")

%% Run Synergy DO V2
DesignOptimizationTool("SynergyDOSettingsV2.xml");

plotTreatmentOptimizationResultsFromSettingsFile("SynergyDOSettingsV2.xml")

%% Compare Synergy Driven Results
plotTreatmentOptimizationResultsFromSettingsFile("SynergyDOSettingsV1.xml", ...
    ["SynergyDOResultsV1", "SynergyDOResultsV2"])

%% Compare to Torque Driven Results
plotTreatmentOptimizationResultsFromSettingsFile("SynergyDOSettingsV1.xml", ...
    ["SynergyDOResultsV2", "TorqueDOResultsV4"])