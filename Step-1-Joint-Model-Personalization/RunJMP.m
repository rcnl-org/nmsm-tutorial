%% Run JMP Sequential
close all

JointModelPersonalizationTool("JMPSettingsSequential.xml")

plotJmpResultsFromSettingsFile("JMPSettingsSequential.xml", "MarkerFiles\GaitTrial_markers.trc")


%% Run JMP Simultaneous

JointModelPersonalizationTool("JMPSettingsSimultaneous.xml")

plotJmpResultsFromSettingsFile("JMPSettingsSimultaneous.xml", "MarkerFiles\GaitTrial_markers.trc")