%% Run Torque Driven VO V1
VerificationOptimizationTool("TorqueVOSettingsV1.xml");

plotTreatmentOptimizationResultsFromSettingsFile("TorqueVOSettingsV1.xml")

%% Run Torque Driven VO V2
VerificationOptimizationTool("TorqueVOSettingsV2.xml");

plotTreatmentOptimizationResultsFromSettingsFile("TorqueVOSettingsV2.xml")

%% Compare Results
plotTreatmentOptimizationResultsFromSettingsFile("TorqueVOSettingsV2.xml", ...
    ["TorqueVOResultsV1", "TorqueVOResultsV2"])