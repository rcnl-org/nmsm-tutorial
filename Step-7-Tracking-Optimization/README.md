# Step 7 Tracking Optimization

Tracking Optimization (TO) is the first tool in the NMSM Pipeline Treatment Optimization toolset. It uses an optimal control solver to ensure dynamic consistency between all components of a personalized model, which may have associated components such as kinematics, joint moments, muscle synergy activations, and ground contact models. 

This tool uses the GPOPS-II optimal control solver. A license is required to use this solver, and it must be set up before using this tool. 

## Running TO

To run TO:

- Make sure the nmsm-core project is loaded (double-click `Project.prj` in the root of nmsm-core if it is not loaded).
- Navigate to the nmsm-tutorial/Step-7-Tracking-Optimization directory.
- Open and run the MATLAB script `runTOTool.m`.

This script will run the TO tool with the XML settings file. The torque-driven results will be saved in the `resultsTO` directory, and the synergy-driven results will be saved in `SynergyDrivenTO`. The results will also be plotted.