%% Run JMP
tic
JointModelPersonalizationTool("JMPBothHipSettings.xml")

JointModelPersonalizationTool("JMPRKnee.xml");

JointModelPersonalizationTool("JMPFemurMarkers.xml")
toc

%% Analyze Results

close all

% List markers of interest. for this example, it is the markers about the
% knee joint.
markerNames = ["R_Thigh_Superior", "R_Thigh_Inferior", ...
    "R_Thigh_Lateral", "R_Shank_Superior", "R_Shank_Inferior", ...
    "R_Shank_Lateral"];

% Generate the .sto file for the marker error values for the original
% model.
reportDistanceErrorByMarker('UF_Subject_3_v2.osim', ...
    'GaitTrial_markers_jmp.trc', markerNames, 'start.sto')

% Generate the .sto file for the marker error values after JMP. In this
% case, the knee isolated trial was used to optimize the knee parameters.
reportDistanceErrorByMarker(fullfile('femurMarkerMotion', ...
    'UF_Subject_3_hipScaling_Knee_LegMarkers.osim'), ...
    'GaitTrial_markers_jmp.trc', markerNames, 'finish.sto')

% Create the plot. A value of false means each pair is plotted separately,
% a value of true means all are plotted together.
plotMarkerDistanceErrors(["start.sto", "finish.sto"], false)

%% Calculate percent improvement for markers around the knee

jointArray = {"knee_r"};
markerFile = "GaitTrial_markers_jmp.trc";

start = sqrt(calculateJointError('UF_Subject_3_v2.osim', ...
    1, jointArray, markerFile, 1e-6));

final = sqrt(calculateJointError(fullfile('femurMarkerMotion', ...
    'UF_Subject_3_hipScaling_Knee_LegMarkers.osim'), ...
    1, jointArray, markerFile, 1e-6));

disp("Marker improvement: " + (((start - final) / start) * 100) + "%") 
