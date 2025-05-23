function cost = footSpeedCost(values, modeledValues, auxdata, costTerm)
model = auxdata.model;
state = model.initSystem();
for i = 1:size(state, 2)
    model.getCoordinateSet().get(auxdata.coordinateNames{i}).setValue(state, values.statePositions(end, i), false);
    model.getCoordinateSet().get(auxdata.coordinateNames{i}).setSpeedValue(state, values.stateVelocities(end, i));
end
model.realizeVelocity(state);
newSpeed = model.getMarkerSet().get(costTerm.marker_name) ...
    .getVelocityInGround(state).get(0);
cost = costTerm.target_speed - newSpeed;
end