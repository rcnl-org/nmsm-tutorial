# Step 6 Surrogate Model Sampling

During Synergy-Driven Treatment Optimization, muscle-tendon length is calculated using polynomial fits of OpenSim length calculations so that the Muscle Analysis tool is not needed at every iteration. Muscle-tendon velocity and moment arms are calculated as analytical derivatives of these polynomials. The script in this folder uses Latin Hypercube Sampling to generate kinematic configurations within a range of the reference kinematics to use in fitting surrogate muscle models. 

## Running the Surrogate Model Sampling

To run this step:

- Make sure the nmsm-core project is loaded (double-click `Project.prj` in the root of nmsm-core if it is not loaded).
- Navigate to the nmsm-tutorial/Step-6-Surrogate-Model directory.
- Open and run the MATLAB script `surrogateKinematicsScript.m`.

This will generate a new set of kinematics within a data directory structure for surrogate model sampling. To complete the surrogate model data directory, a MuscleAnalysis must be run in the OpenSim GUI, using the motion file in IKData as the motion (with no filtering), and with output going to the MAData directory. 