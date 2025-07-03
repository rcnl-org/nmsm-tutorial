%% Run JMP V1

SettingsFileName = "JMPSettings.xml";
outputModelFileName = "UF_Subject_3_scaled_JMPV2.osim";

tic
JointModelPersonalizationTool(SettingsFileName);
fprintf("JMP Runtime: %f Minutes\n", toc/60);

close all

% List markers of interest. for this example, it is the markers about the
% knee joint.
markerNames = ["R_Asis", "L_Asis", "Sacral", "R_Thigh_Superior", "R_Thigh_Inferior", ...
    "R_Thigh_Lateral", "R_Shank_Superior", "R_Shank_Inferior", ...
    "R_Shank_Lateral"];

% Generate the .sto file for the marker error values for the original
% model.
reportDistanceErrorByMarker('UF_Subject_3_scaled_JMPV3.osim', ...
    fullfile("MarkerFiles", "GaitTrial_markers.trc"), markerNames, ...
    fullfile("MarkerErrors", "JMPMarkerErrorsV3.sto"))

% Generate the .sto file for the marker error values after JMP. In this
% case, the knee isolated trial was used to optimize the knee parameters.
reportDistanceErrorByMarker(outputModelFileName, ...
    fullfile("MarkerFiles", "GaitTrial_markers.trc"), markerNames, ...
    fullfile("MarkerErrors", "JMPMarkerErrorsV2.sto"))

% Create the plot. A value of false means each pair is plotted separately,
% a value of true means all are plotted together.
plotMarkerDistanceErrors([fullfile("MarkerErrors", "JMPMarkerErrorsV2.sto"), ...
    fullfile("MarkerErrors", "JMPMarkerErrorsV3.sto")], false)