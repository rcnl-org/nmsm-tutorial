%% Run JMP
tic
JointModelPersonalizationTool("JMPRKnee.xml");

%%

JointModelPersonalizationTool("JMPFemurMarkers.xml")

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
reportDistanceErrorByMarker( ...
    'femurMarkerMotion\UF_Subject_3_v10.osim', 'GaitTrial_markers_jmp.trc', ...
    markerNames, 'finish.sto')

% Create the plot. A value of false means each pair is plotted separately,
% a value of true means all are plotted together.
plotMarkerDistanceErrors(["start.sto", "finish.sto"], false)

%%

jointArray = {"knee_r"};
markerFile = "GaitTrial_markers_jmp.trc";

start = sqrt(calculateJointError('UF_Subject_3_v2.osim', ...
    1, jointArray, markerFile, 1e-6))

final = sqrt(calculateJointError('kneeJointParameters/UF_Subject_3_v9.osim', ...
    1, jointArray, markerFile, 1e-6))

disp("Improvement: " + (((start - final) / start) * 100) + "%") 

jointArray = {"knee_r"};
markerFile = "GaitTrial_markers_jmp.trc";

start = sqrt(calculateJointError('kneeJointParameters/UF_Subject_3_v9.osim', ...
    1, jointArray, markerFile, 1e-6))

final = sqrt(calculateJointError('femurMarkerMotion/UF_Subject_3_v10.osim', ...
    1, jointArray, markerFile, 1e-6))

disp("Improvement: " + (((start - final) / start) * 100) + "%") 

jointArray = {"knee_r"};
markerFile = "GaitTrial_markers_jmp.trc";

start = sqrt(calculateJointError('UF_Subject_3_v2.osim', ...
    1, jointArray, markerFile, 1e-6))

final = sqrt(calculateJointError('femurMarkerMotion/UF_Subject_3_v10.osim', ...
    1, jointArray, markerFile, 1e-6))

disp("Improvement: " + (((start - final) / start) * 100) + "%") 

toc