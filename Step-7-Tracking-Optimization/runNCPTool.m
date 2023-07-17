
clc; clear; close all;
muscleTendonLengthFileName = "preprocessed\MAData\kick_1\kick_1_Length.sto";
cutoffFrequency = 10;
createMuscleTendonVelocity(muscleTendonLengthFileName, cutoffFrequency);
NeuralControlPersonalizationTool("NCPSettingsFile.xml");