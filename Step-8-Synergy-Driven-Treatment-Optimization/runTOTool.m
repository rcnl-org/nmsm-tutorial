%% Run Synergy TO V1
close all
TrackingOptimizationTool("SynergyTOSettingsV1.xml");
plotTreatmentOptimizationResultsFromSettingsFile("SynergyTOSettingsV1.xml")

%% Run Synergy TO V2
close all
TrackingOptimizationTool("SynergyTOSettingsV2.xml");
plotTreatmentOptimizationResultsFromSettingsFile("SynergyTOSettingsV2.xml")

%% Run Synergy TO V3
close all
TrackingOptimizationTool("SynergyTOSettingsV3.xml");
plotTreatmentOptimizationResultsFromSettingsFile("SynergyTOSettingsV3.xml")

%% Run Synergy TO V4
close all
TrackingOptimizationTool("SynergyTOSettingsV4.xml");
plotTreatmentOptimizationResultsFromSettingsFile("SynergyTOSettingsV4.xml")

%% Run Synergy TO V5
close all
TrackingOptimizationTool("SynergyTOSettingsV5.xml");
plotTreatmentOptimizationResultsFromSettingsFile("SynergyTOSettingsV5.xml")

%% Compare results
close all
plotTreatmentOptimizationResultsFromSettingsFile("SynergyTOSettingsV5.xml", ...
    ["SynergyTOResultsV1", "SynergyTOResultsV4", "SynergyTOResultsV5"])