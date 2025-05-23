%% Run Torque-Driven Verification Optimization

close all
tic
VerificationOptimizationTool('TorqueDrivenVerificationOptimizationSettings.xml');
toc

%% Plot Results

plotTreatmentOptimizationResultsFromSettingsFile('TorqueDrivenVerificationOptimizationSettings.xml')

