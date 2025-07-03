%% Run Torque Driven VO
close all

VerificationOptimizationTool("TorqueVOSettings.xml");

plotTreatmentOptimizationResultsFromSettingsFile("TorqueVOSettings.xml")