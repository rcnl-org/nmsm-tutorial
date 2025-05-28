%% Run Synergy Driven VO V1
close all
VerificationOptimizationTool("SynergyVOSettingsV1.xml");
plotTreatmentOptimizationResultsFromSettingsFile("SynergyVOSettingsV1.xml")

%% Run Synergy Driven VO V2
close all
VerificationOptimizationTool("SynergyVOSettingsV2.xml");
plotTreatmentOptimizationResultsFromSettingsFile("SynergyVOSettingsV2.xml")

%% Compare Results
close all
plotTreatmentOptimizationResultsFromSettingsFile("SynergyVOSettingsV2.xml", ...
    ["SynergyVOResultsV1", "SynergyVOResultsV2"])