%% Run Torque DO
close all

DesignOptimizationTool("TorqueDOSettings.xml");

plotTreatmentOptimizationResultsFromSettingsFile("TorqueDOSettings.xml")