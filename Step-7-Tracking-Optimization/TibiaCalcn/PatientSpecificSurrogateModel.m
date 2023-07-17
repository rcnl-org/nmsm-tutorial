function [matrix] = PatientSpecificSurrogateModel(jointAngles, jointVelocities, numMuscles)
onesCol = ones(size(jointAngles, 1), 1);
zeroCol = zeros(size(jointAngles, 1), 1);
switch numMuscles
    case 1
        theta1 = jointAngles(:, 1);
        theta2 = jointAngles(:, 2);
        thetaDot1 = jointVelocities(:, 1);
        thetaDot2 = jointVelocities(:, 2);
        muscleTendonLengths = [ 5.*theta1, 5.*theta2, 30.*theta1.^2.*theta2.^2, 10.*theta1.^2.*theta2.^3, 10.*theta1.^3.*theta2.^2, 20.*theta1.*theta2, 30.*theta1.*theta2.^2, 30.*theta1.^2.*theta2, 20.*theta1.*theta2.^3, 20.*theta1.^3.*theta2, 5.*theta1.*theta2.^4, 5.*theta1.^4.*theta2, 10.*theta1.^2, 10.*theta1.^3, 10.*theta2.^2, 5.*theta1.^4, 10.*theta2.^3, theta1.^5, 5.*theta2.^4, theta2.^5, onesCol,];
        muscleTendonVelocities = [ 10.*thetaDot1, 5.*thetaDot2, 120.*theta1.*theta2.^2.*thetaDot1 + 60.*theta1.^2.*theta2.*thetaDot2, 40.*theta1.*theta2.^3.*thetaDot1 + 30.*theta1.^2.*theta2.^2.*thetaDot2, 20.*theta1.^3.*theta2.*thetaDot2 + 60.*theta1.^2.*theta2.^2.*thetaDot1, 20.*theta1.*thetaDot2 + 40.*theta2.*thetaDot1, 60.*theta2.^2.*thetaDot1 + 60.*theta1.*theta2.*thetaDot2, 30.*theta1.^2.*thetaDot2 + 120.*theta1.*theta2.*thetaDot1, 40.*theta2.^3.*thetaDot1 + 60.*theta1.*theta2.^2.*thetaDot2, 20.*theta1.^3.*thetaDot2 + 120.*theta1.^2.*theta2.*thetaDot1, 10.*theta2.^4.*thetaDot1 + 20.*theta1.*theta2.^3.*thetaDot2, 5.*theta1.^4.*thetaDot2 + 40.*theta1.^3.*theta2.*thetaDot1, 40.*theta1.*thetaDot1, 60.*theta1.^2.*thetaDot1, 20.*theta2.*thetaDot2, 40.*theta1.^3.*thetaDot1, 30.*theta2.^2.*thetaDot2, 10.*theta1.^4.*thetaDot1, 20.*theta2.^3.*thetaDot2, 5.*theta2.^4.*thetaDot2, zeroCol,];
        momentArms1 = [-5*onesCol, zeroCol, -60.*theta1.*theta2.^2, -20.*theta1.*theta2.^3, -30.*theta1.^2.*theta2.^2, -20.*theta2, -30.*theta2.^2, -60.*theta1.*theta2, -20.*theta2.^3, -60.*theta1.^2.*theta2, -5.*theta2.^4, -20.*theta1.^3.*theta2, -20.*theta1, -30.*theta1.^2, zeroCol, -20.*theta1.^3, zeroCol, -5.*theta1.^4, zeroCol, zeroCol, zeroCol,];
        momentArms2 = [ zeroCol,-5*onesCol, -60.*theta1.^2.*theta2, -30.*theta1.^2.*theta2.^2, -20.*theta1.^3.*theta2, -20.*theta1, -60.*theta1.*theta2, -30.*theta1.^2, -60.*theta1.*theta2.^2, -20.*theta1.^3, -20.*theta1.*theta2.^3, -5.*theta1.^4, zeroCol, zeroCol, -20.*theta2, zeroCol, -30.*theta2.^2, zeroCol, -20.*theta2.^3, -5.*theta2.^4, zeroCol,];
        matrix = [muscleTendonLengths; muscleTendonVelocities;momentArms1; momentArms2; ];
    case 2
        theta1 = jointAngles(:, 1);
        theta2 = jointAngles(:, 2);
        thetaDot1 = jointVelocities(:, 1);
        thetaDot2 = jointVelocities(:, 2);
        muscleTendonLengths = [ 5.*theta1, 5.*theta2, 30.*theta1.^2.*theta2.^2, 10.*theta1.^2.*theta2.^3, 10.*theta1.^3.*theta2.^2, 20.*theta1.*theta2, 30.*theta1.*theta2.^2, 30.*theta1.^2.*theta2, 20.*theta1.*theta2.^3, 20.*theta1.^3.*theta2, 5.*theta1.*theta2.^4, 5.*theta1.^4.*theta2, 10.*theta1.^2, 10.*theta1.^3, 10.*theta2.^2, 5.*theta1.^4, 10.*theta2.^3, theta1.^5, 5.*theta2.^4, theta2.^5, onesCol,];
        muscleTendonVelocities = [ 10.*thetaDot1, 5.*thetaDot2, 120.*theta1.*theta2.^2.*thetaDot1 + 60.*theta1.^2.*theta2.*thetaDot2, 40.*theta1.*theta2.^3.*thetaDot1 + 30.*theta1.^2.*theta2.^2.*thetaDot2, 20.*theta1.^3.*theta2.*thetaDot2 + 60.*theta1.^2.*theta2.^2.*thetaDot1, 20.*theta1.*thetaDot2 + 40.*theta2.*thetaDot1, 60.*theta2.^2.*thetaDot1 + 60.*theta1.*theta2.*thetaDot2, 30.*theta1.^2.*thetaDot2 + 120.*theta1.*theta2.*thetaDot1, 40.*theta2.^3.*thetaDot1 + 60.*theta1.*theta2.^2.*thetaDot2, 20.*theta1.^3.*thetaDot2 + 120.*theta1.^2.*theta2.*thetaDot1, 10.*theta2.^4.*thetaDot1 + 20.*theta1.*theta2.^3.*thetaDot2, 5.*theta1.^4.*thetaDot2 + 40.*theta1.^3.*theta2.*thetaDot1, 40.*theta1.*thetaDot1, 60.*theta1.^2.*thetaDot1, 20.*theta2.*thetaDot2, 40.*theta1.^3.*thetaDot1, 30.*theta2.^2.*thetaDot2, 10.*theta1.^4.*thetaDot1, 20.*theta2.^3.*thetaDot2, 5.*theta2.^4.*thetaDot2, zeroCol,];
        momentArms1 = [-5*onesCol, zeroCol, -60.*theta1.*theta2.^2, -20.*theta1.*theta2.^3, -30.*theta1.^2.*theta2.^2, -20.*theta2, -30.*theta2.^2, -60.*theta1.*theta2, -20.*theta2.^3, -60.*theta1.^2.*theta2, -5.*theta2.^4, -20.*theta1.^3.*theta2, -20.*theta1, -30.*theta1.^2, zeroCol, -20.*theta1.^3, zeroCol, -5.*theta1.^4, zeroCol, zeroCol, zeroCol,];
        momentArms2 = [ zeroCol,-5*onesCol, -60.*theta1.^2.*theta2, -30.*theta1.^2.*theta2.^2, -20.*theta1.^3.*theta2, -20.*theta1, -60.*theta1.*theta2, -30.*theta1.^2, -60.*theta1.*theta2.^2, -20.*theta1.^3, -20.*theta1.*theta2.^3, -5.*theta1.^4, zeroCol, zeroCol, -20.*theta2, zeroCol, -30.*theta2.^2, zeroCol, -20.*theta2.^3, -5.*theta2.^4, zeroCol,];
        matrix = [muscleTendonLengths; muscleTendonVelocities;momentArms1; momentArms2; ];
end
end
