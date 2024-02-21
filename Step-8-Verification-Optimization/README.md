# Step 7 Verification Optimization

Verification Optimization (VO) is the second tool in the NMSM Pipeline Treatment Optimization toolset. After Tracking Optimization has ensured dynamic consistency, VO makes sure the solution is consistent on its own by tracking the solved controls.  

This tool uses the GPOPS-II optimal control solver. A license is required to use this solver, and it must be set up before using this tool. 

## Running VO

To run VO:

- Make sure the nmsm-core project is loaded (double-click `Project.prj` in the root of nmsm-core if it is not loaded).
- Navigate to the nmsm-tutorial/Step-7-Verification-Optimization directory.
- Open and run the MATLAB script `runVOTool.m`.

This script will run the VO tool with the XML settings file. The torque-driven results will be saved in the `resultsVO` directory, and the synergy-driven results will be saved in `SynergyDrivenVO`. The results will also be plotted.