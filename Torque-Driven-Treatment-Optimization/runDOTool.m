%% Run Torque-Driven Design Optimization

close all
tic
DesignOptimizationTool("TorqueDOSettingsUserDefined.xml");
toc

plotTreatmentOptimizationResultsFromSettingsFile('TorqueDOSettingsUserDefined.xml')




