%% Run Torque DO V1
close all
% DesignOptimizationTool("TorqueDOSettingsV1.xml");
% 
% plotTreatmentOptimizationResultsFromSettingsFile("TorqueDOSettingsV1.xml")

%% Run Torque DO V2

% DesignOptimizationTool("TorqueDOSettingsV2.xml");
% 
% plotTreatmentOptimizationResultsFromSettingsFile("TorqueDOSettingsV2.xml")

%% Run Torque DO V3

% DesignOptimizationTool("TorqueDOSettingsV3.xml");
% 
% plotTreatmentOptimizationResultsFromSettingsFile("TorqueDOSettingsV3.xml")

%% Run Torque DO V4

% DesignOptimizationTool("TorqueDOSettingsV4.xml");

% plotTreatmentOptimizationResultsFromSettingsFile("TorqueDOSettingsV4.xml")

%% Compare Results
plotTreatmentOptimizationResultsFromSettingsFile("TorqueDOSettingsV4.xml", ...
    ["TorqueDOResultsV3", "TorqueDOResultsV4"])