%% Run MTP

MuscleTendonPersonalizationTool("MTPSettings.xml")

%% Analyze results

resultsDirectory = "mtpResults";

plotMtpPassiveMomentCurves(resultsDirectory)
plotMtpPassiveForceCurves(resultsDirectory)
plotMtpMuscleExcitationsAndActivations(resultsDirectory)
plotMtpHillTypeMuscleParams(resultsDirectory)
plotMtpJointMoments(resultsDirectory)
plotMtpNormalizedFiberLengths(resultsDirectory)
