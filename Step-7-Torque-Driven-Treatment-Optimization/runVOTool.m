%% Run Torque Driven VO V1

close all
tic
VerificationOptimizationTool("TorqueVOSettingsV1.xml");
toc
plotTreatmentOptimizationResultsFromSettingsFile("TorqueVOSettingsV1.xml")

%% Run Torque Driven VO V2

close all
tic
VerificationOptimizationTool("TorqueVOSettingsV2.xml");
toc
plotTreatmentOptimizationResultsFromSettingsFile("TorqueVOSettingsV2.xml")

%% Compare Results
close all
plotTreatmentOptimizationResultsFromSettingsFile("TorqueVOSettingsV2.xml", ...
    ["TorqueVOResultsV1", "TorqueVOResultsV2"])