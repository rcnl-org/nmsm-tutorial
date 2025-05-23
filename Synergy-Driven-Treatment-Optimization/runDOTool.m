%% Run Synergy-Driven Design Optimization

close all
tic
DesignOptimizationTool('SynergyDrivenDesignOptimizationFreeSettings.xml');
toc

%% Plot Results

plotTreatmentOptimizationResultsFromSettingsFile('SynergyDrivenDesignOptimizationFreeSettings.xml')
