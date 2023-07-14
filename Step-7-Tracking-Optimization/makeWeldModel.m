
initialModel = Model("RightLegAndPelvisKneeNoAdd.osim");

newModel = org.opensim.modeling.Model();

newModel.addBody(initialModel.getBodySet().get("femur_r"));
newModel.addBody(initialModel.getBodySet().get("tibia_r"));
newModel.addBody(initialModel.getBodySet().get("pretalus_r"));
newModel.addBody(initialModel.getBodySet().get("talus_r"));
newModel.addBody(initialModel.getBodySet().get("calcn_r"));
weldJoint = org.opensim.modeling.WeldJoint("FemurGround", newModel.getGround(), newModel.getBodySet().get(0));
newModel.addJoint(weldJoint);
newModel.addJoint(initialModel.getJointSet().get("knee_r"));
newModel.addJoint(initialModel.getJointSet().get("ankle_r"));
newModel.addJoint(initialModel.getJointSet().get("pretalar_r"));
newModel.addJoint(initialModel.getJointSet().get("subtalar_r"));

newModel.finalizeConnections();
newModel.print("test.osim");