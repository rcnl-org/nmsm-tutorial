NeuralControlPersonalizationTool("NCPSettingsFile.xml")

plotNeuralControlPersonalizationActivations( ...
    fullfile("ncpResultsBJ", "synergyWeights.sto"), ...
    fullfile("ncpResultsBJ", "kick_1_synergyCommands.sto"), ...
    false, 3, 3)