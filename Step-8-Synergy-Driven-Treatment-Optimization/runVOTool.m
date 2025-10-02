%% Run Synergy Driven VO V1
VerificationOptimizationTool("SynergyVOSettingsV1.xml");

plotTreatmentOptimizationResultsFromSettingsFile("SynergyVOSettingsV1.xml")

%% Run Synergy Driven VO V2
VerificationOptimizationTool("SynergyVOSettingsV2.xml");

plotTreatmentOptimizationResultsFromSettingsFile("SynergyVOSettingsV2.xml")

%% Compare Results
plotTreatmentOptimizationResultsFromSettingsFile("SynergyVOSettingsV2.xml", ...
    ["SynergyVOResultsV1", "SynergyVOResultsV2"])