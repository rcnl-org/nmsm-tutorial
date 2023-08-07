function cost = footSpeedCost(values, modeledValues, auxdata, costTerm)
model = auxdata.model;
state = model.initSystem();
for i = 1:size(state, 2)
    model.getCoordinateSet().get(auxdata.coordinateNames{i}).setValue(state, values.statePositions(end, i))
    model.getCoordinateSet().get(auxdata.coordinateNames{i}).setSpeedValue(state, values.stateVelocities(end, i))
end
model.realizeVelocity(state);
newSpeed 
cost = costTerm.initial_speed / newSpeed;
end