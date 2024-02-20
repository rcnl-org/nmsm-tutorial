# Step 6 Surrogate Model Preview

During Synergy-Driven Treatment Optimization, muscle-tendon length is calculated using polynomial fits of OpenSim length calculations so that the Muscle Analysis tool is not needed at every iteration. Muscle-tendon velocity and moment arms are calculated as analytical derivatives of these polynomials. The script in this folder shows a preview of how well a surrogate model created during Treatment Optimization with the given settings will match Muscle Analysis results. 

## Running a Surrogate Model Preview

To run this step:

- Make sure the nmsm-core project is loaded (double-click `Project.prj` in the root of nmsm-core if it is not loaded).
- Navigate to the nmsm-tutorial/Step-6-Surrogate-Model directory.
- Open and run the MATLAB script `surrogate.m`.

The results will be plotted after surrogate models are created. 