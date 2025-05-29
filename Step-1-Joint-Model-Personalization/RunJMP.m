%% Run JMP V1

SettingsFileName = "JMPSettingsV1.xml";
outputModelFileName = "UF_Subject_3_scaled_JMPV1.osim";

tic
JointModelPersonalizationTool(SettingsFileName);
fprintf("JMP Runtime: %f Minutes\n", toc/60);

close all

% List markers of interest. for this example, it is the markers about the
% knee joint.
markerNames = ["R_Thigh_Superior", "R_Thigh_Inferior", ...
    "R_Thigh_Lateral", "R_Shank_Superior", "R_Shank_Inferior", ...
    "R_Shank_Lateral"];

% Generate the .sto file for the marker error values for the original
% model.
reportDistanceErrorByMarker('UF_Subject_3_Scaled.osim', ...
    fullfile("MarkerFiles", "GaitTrial_markers.trc"), markerNames, ...
    fullfile("MarkerErrors", "ScaledModelMarkerErrors.sto"))

% Generate the .sto file for the marker error values after JMP. In this
% case, the knee isolated trial was used to optimize the knee parameters.
reportDistanceErrorByMarker(outputModelFileName, ...
    fullfile("MarkerFiles", "GaitTrial_markers.trc"), markerNames, ...
    fullfile("MarkerErrors", "JMPV1MarkerErrors.sto"))

% Create the plot. A value of false means each pair is plotted separately,
% a value of true means all are plotted together.
plotMarkerDistanceErrors([fullfile("MarkerErrors", "ScaledModelMarkerErrors.sto"), ...
    fullfile("MarkerErrors", "JMPV1MarkerErrors.sto")], false)

%% Run JMP V2

SettingsFileName = "JMPSettingsV2.xml";
outputModelFileName = "UF_Subject_3_scaled_JMPV2.osim";

tic
JointModelPersonalizationTool(SettingsFileName);
fprintf("JMP Runtime: %f Minutes\n", toc/60);

close all

% List markers of interest. for this example, it is the markers about the
% knee joint.
markerNames = ["R_Thigh_Superior", "R_Thigh_Inferior", ...
    "R_Thigh_Lateral", "R_Shank_Superior", "R_Shank_Inferior", ...
    "R_Shank_Lateral"];

% Generate the .sto file for the marker error values after JMP. In this
% case, the knee isolated trial was used to optimize the knee parameters.
reportDistanceErrorByMarker(outputModelFileName, ...
    fullfile("MarkerFiles", "GaitTrial_markers.trc"), markerNames, ...
    fullfile("MarkerErrors", "JMPV2MarkerErrors.sto"))

% Create the plot. A value of false means each pair is plotted separately,
% a value of true means all are plotted together.
plotMarkerDistanceErrors([fullfile("MarkerErrors", "ScaledModelMarkerErrors.sto"), ...
    fullfile("MarkerErrors", "JMPV2MarkerErrors.sto")], false)