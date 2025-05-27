%% Run Synergy TO V1
close all
TrackingOptimizationTool("SynergyTOSettingsV1.xml");
plotTreatmentOptimizationResultsFromSettingsFile("SynergyTOSettingsV1.xml")

%% Run Synergy TO V2
TrackingOptimizationTool("SynergyTOSettingsV2.xml");
plotTreatmentOptimizationResultsFromSettingsFile("SynergyTOSettingsV2.xml")

%% Run Synergy TO V3
TrackingOptimizationTool("SynergyTOSettingsV3.xml");
plotTreatmentOptimizationResultsFromSettingsFile("SynergyTOSettingsV3.xml")

%% Run Synergy TO V4
TrackingOptimizationTool("SynergyTOSettingsV4.xml");
plotTreatmentOptimizationResultsFromSettingsFile("SynergyTOSettingsV4.xml")

%% Run Synergy TO V5
TrackingOptimizationTool("SynergyTOSettingsV5.xml");
plotTreatmentOptimizationResultsFromSettingsFile("SynergyTOSettingsV5.xml")

%% Compare results
close all
plotTreatmentOptimizationResultsFromSettingsFile("SynergyTOSettingsV5.xml", ...
    ["SynergyTOResultsV1", "SynergyTOResultsV2", "SynergyTOResultsV3"])