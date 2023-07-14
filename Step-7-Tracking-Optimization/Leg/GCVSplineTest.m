
storage = org.opensim.modeling.Storage("preprocessed/IKData/trial_1.sto");
gcvSplineSet = org.opensim.modeling.GCVSplineSet(5, storage);
time = findTimeColumn(storage);
data = zeros(55, 3);
for i = 0:gcvSplineSet.getSize()-1
    for j = 1:length(time)
        data(j, i+1) = gcvSplineSet.evaluate(i, 2, time(j));
    end
end


% gcvSpline = org.opensim.modeling.GCVSpline();
% gcvSpline.setDegree(1);
%
% gcvSpline.addPoint(5, 6);
% gcvSpline.addPoint(6, 7);
% gcvSpline.addPoint(7, 8);
%
% functionSet = org.opensim.modeling.FunctionSet();
% functionSet.setSize(1);
%
% functionSet.insert(0, gcvSpline);
%
% functionSet.evaluate(0, 1, 5.5)

