# Step 1 Joint Model Personalization

The first step in any run-through of the NMSM Pipeline is Joint Model Personalization (JMP). JMP produces a new OpenSim (.osim) model with modified joint parameters to minimize OpenSim Inverse Kinematics (IK) marker distance errors. JMP is also able to move markers and scale bodies.

Based on [Reinbolt (2005)](http://rcnl.rice.edu/PDFs/jb2005b.pdf), optimization of joint parameters also [improves Inverse Dynamics (ID) results](http://rcnl.rice.edu/PDFs/tbme2007b.pdf) and other downstream computations. This tool is further documented [here](https://nmsm.rice.edu/model-personalization/joint-model-personalization/).

This tool requires only a scaled OpenSim model and a [.trc marker data file](https://simtk-confluence.stanford.edu:8443/display/OpenSim/Marker+%28.trc%29+Files) of the motion of interest. JMP is done first because the preprocessing step (Step 2) requires the user to run IK, ID, and Muscle Analysis (MA), whose results will be affected by changes to the model from JMP.

## How to Use

JMP is run through an XML settings file. For our project, we are optimizing the right leg of our team's star player.

Open the example xml file (`JMPSettingsFile.xml`). You will notice a few key elements to correct use of JMP.

- `<input_model_file>` - the OpenSim (.osim) file to use
- `<output_model_file>` - the path and name of the optimized model
- `<JMPTaskList>` - the list of sequential `<JMPTask>` elements for the tool to run
    - Running JMP in steps can improve results ([explanation here](https://nmsm.rice.edu/model-personalization/joint-model-personalization/multiple-tasks))

`<JMPTask>` defines the joints and bodies (`<JMPJoint>` and `<JMPBody>`, respectively) to be modified to reduce IK marker distance errors. Each `<JMPTask>` has a `<marker_file_name>` to provide the .trc file for the task as well as a single `<JMPJointSet>` and `<JMPBodySet>`.

`<JMPJoint>` elements define the parent and child frame transformations of a single joint that the optimization may change. The three `<JMPJoint>` elements in `JMPSettingsFile.xml` are provided for the hip, knee, and ankle according to the specifications in [Reinbolt (2005)](http://rcnl.rice.edu/PDFs/jb2005b.pdf).

`<JMPBody>` elements define whether the optimization may change the scaling or marker positions of a single body. An example showing how `<JMPBody>` can be used is available [here](https://nmsm.rice.edu/tool-specific-examples/joint-model-personalization/jmp-body-example).

More information about correctly selecting joint parameters, bodies, and markers for the optimization is available [here](https://nmsm.rice.edu/model-personalization/joint-model-personalization/selecting-joint-parameters).

## Running JMP

To run JMP:

- Make sure the nmsm-core project is loaded (double click `Project.prj` in the root of nmsm-core).
- Navigate to the nmsm-tutorial/Step-1-Joint-Model-Personalization directory.
- Open and run the MATLAB script `RunJMP.m`.

This script will run the JMP tool with the XML settings file described above. The results will be saved as `player_jmp.osim`.
