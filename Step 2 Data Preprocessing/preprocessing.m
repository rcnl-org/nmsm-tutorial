% This function is part of the NMSM Pipeline, see file for full license.
%
% Use this script to process your EMG, IK, ID, and MuscleAnalysis data in
% preparation for the other NMSM Pipeline tools. This script is intended to
% be used after Joint Model Personalization and the IK, ID, and
% MuscleAnalysis data for this script should be generated through the 
% OpenSim GUI tools. 
%
% Modify the script below with your own filenames and preferred settings.

%% Preprocessing Script

% All values required
rawEmgFileName = "kick_emg.mot";
filterOrder = 4;
highPassCutoff = 10;
lowPassCutoff = 50;
processedEmgFileName = "kick_processed_emg.sto";

processRawEmgFile(rawEmgFileName, filterOrder, highPassCutoff, ...
    lowPassCutoff, processedEmgFileName);


%% Create Muscle Tendon Velocity
% Calculates muscle-tendon velocity using B-splines and MuscleAnalysis's
% muscle-tendon length. The file is written in the same directory as the
% muscle-tendon length file.

muscleTendonLengthFileName = "MuscleAnalysis\player_MuscleAnalysis_Length.sto";
cutoffFrequency = 10;
createMuscleTendonVelocity(muscleTendonLengthFileName, cutoffFrequency);

%% Split OpenSim data into trials by time pairs

% Required: pairs of start/end time of events to be extracted
trialTimePairs = [
    0.4 0.67
];

% Required: Associated .osim model file
inputSettings.model = "player.osim";

% All values optional: files and directories of data to be split
inputSettings.ikFileName = "ik.mot";
inputSettings.idFileName = "id.sto";
% The emgFileName should be the name of the *processed* emg data file
inputSettings.emgFileName = "kick_processed_emg.sto";
inputSettings.maDirectory = "MuscleAnalysis";

% All values optional: output information, uses default values otherwise
outputSettings.resultsDirectory = "preprocessed";
% The trial prefix is the prefix of each output file, identifying the
% motion such as 'gait' or 'squat' or 'step_up'.
outputSettings.trialPrefix = "kick";

splitIntoTrials( ...
    trialTimePairs, ...
    inputSettings, ...
    outputSettings ...
    )
