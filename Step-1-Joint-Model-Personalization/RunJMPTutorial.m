SettingsFileName = "JMPSettingsV1.xml";
ModelFileName = "UF_Subject_3_scaled_JMPV1.osim";

tic
JointModelPersonalizationTool(SettingsFileName);
fprintf("JMP Runtime: %f Minutes\n", toc/60);