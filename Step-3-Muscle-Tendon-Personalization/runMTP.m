%% Run MTP V1

MuscleTendonPersonalizationTool("MTPSettingsV1.xml")

plotMtpResultsFromSettingsFile("MTPSettingsV1.xml")

%% Run MTP V2

MuscleTendonPersonalizationTool("MTPSettingsV2.xml")

plotMtpResultsFromSettingsFile("MTPSettingsV2.xml")

% Uncomment this line if you want to plot the results from the first MTP
% run as well for comparison. Warning: This will create 11 separate plots.
plotMtpResultsFromSettingsFile("MTPSettingsV1.xml", "MTPSettingsV2.xml")


%% Run MTP V3

MuscleTendonPersonalizationTool("MTPSettingsV3.xml")

plotMtpResultsFromSettingsFile("MTPSettingsV3.xml")

% Uncomment this line if you want to plot the results from the first MTP
% run as well for comparison. Warning: This will create 11 separate plots.
% plotMtpResultsFromSettingsFile("MTPSettingsV1.xml", "MTPSettingsV3.xml")