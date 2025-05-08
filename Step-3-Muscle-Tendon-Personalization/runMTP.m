%% Run MTP

MuscleTendonPersonalizationTool("MTPSettingsV2.xml")

%% Analyze results

plotMtpResultsFromSettingsFile("MTPSettingsV1.xml", "MTPSettingsV2.xml")
