%% Run GCP

GroundContactPersonalizationTool("GCPSettings.xml")

%% Analyze results

close all

plotGcpFootKinematicsFromFiles( ...
    fullfile("gcpResults", "bodyModel_Foot_1_experimentalFootKinematics.sto"), ...
    fullfile("gcpResults", "bodyModel_Foot_1_optimizedFootKinematics.sto"), 1)

plotGcpGroundReactionsFromFiles( ...
    fullfile("gcpResults", "bodyModel_Foot_1_replacedExperimentalGroundReactions.sto"), ...
    fullfile("gcpResults", "bodyModel_Foot_1_optimizedGroundReactions.sto"), 2)
