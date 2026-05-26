# Step 5 Ground Contact Personalization

For problems with ground reaction data, Ground Contact Personalization (GCP) can produce foot-ground contact models for use in predictive simulations. GCP uses kinematics and ground reaction data to calibrate an array of linear springs placed at the bottom of the subject's foot or shoe to match ground reaction forces and moments.

GCP is primarily based on [Jackson (2016)](https://rcnl.rice.edu/PDFs/jbme2016a.pdf) in how linear springs are placed and in the recommended three-stage optimization. The tool is documented in more detail [here](https://nmsm.rice.edu/model-personalization/ground-contact-personalization/intro/).

This tool requires an OpenSim model, a kinematics file, and a ground reactions file containing three forces, three moments, and three coordinates of a point the moments are calculated about (such as the electrical center) for each foot that will be included in GCP. The time columns of the input kinematics and ground reactions must match, which is acheived by our [data preprocessing tool](https://nmsm.rice.edu/model-personalization/data-preprocessing/). One or both feet may have models optimized at a time. If both are included, they will have the same physical properties. 

## How to Use

GCP is configured using a XML settings file. For this project, we are optimizing a contact model for the right foot. This tutorial uses a simplified set of design variables and less precision in fitting kinematics for speed.

Open the XML settings file (`GCPSettings.xml`). This file contains the primary requirements for GCP, which includes definitions for included contact surfaces and configurations for each stage of the optimization. 

- `<results_directory>` - the location of GCP output files
- `<input_directory>` - optionally specify a directory that contains both the input kinematics and ground reactions files. 
- `<input_model_file>` - the OpenSim (.osim) file to use
- `<input_motion_file>` - the kinematics (.mot or .sto) file to use
- `<input_grf_file>` - the ground reactions (.mot or .sto) file to use
- `<kinematics_filter_cutoff>` - used to determine the number of B-spline nodes needed to fit experimental kinematics with a tolerance resembling a lowpass filter of the given cutoff frequency
    - This is generally recommended to be 10, but a lower frequency is used here for a faster example
- `<initialize_resting_spring_length>` - determines whether the initial guess for the resting spring length will be calibrated based on initial spring constants
    - This is generally recommended to be set to `true`, unless the length given as the initial guess in the settings file is not intended to be changed by the optimization.
- `<grid_width>` and `<grid_height>` - define the dimensions of the grid of springs that will be fit to the bottom of the foot

A GCP settings file will contain a `<GCPContactSurfaceSet>`, which contains each `<GCPContactSurface>` that will be personalized. 

- `<is_left_foot>` - used for making the shoe outline for selecting which springs in the grid will be placed on the foot model
     - If this option is enabled, the shoe outline and placement order of spring constants will be mirrored from the default right-side options
- `<start_time>` and `<end_time>` - set bounds on the time points from the specific input kinematics and ground reactions to use
- `<belt_speed>` - define the speed of the treadmill belt from the motion data
    - This is used to account for the belt's velocity in the friction model. Set this to 0 if not using a treadmill
- `<force_columns>`, `<moment_columns>`, and `<electrical_center_columns>` - specify the columns in the ground reactions file to use as the foot's forces, moments, and point the moments were calculated about respectively
- `<toe_coordinate>` and `<toe_joint>` - used to identify toe joint and foot bodies in the body model
    - This tool requires two-segment foot models as described [here](https://nmsm.rice.edu/preparing-to-use-nmsm-pipeline/model-requirements/#ground-contact-personalization)
- Marker names - Five marker names defining features of the foot
    - These markers are defined [here](https://nmsm.rice.edu/preparing-to-use-nmsm-pipeline/model-requirements/#ground-contact-personalization). The midfoot superior marker is used for calculating moments relative to a point on the foot projected to the floor, while other markers are for placing the spring grid

The file will then contain a `<GCPTaskList>` defining stages of the optimization with the `<GCPTask>` object. The included example settings file has three tasks, as most optimizations will, though only the last one is enabled for this example. 

- For each task, the included design variables can be set. These are described in more detail [here](https://nmsm.rice.edu/model-personalization/ground-contact-personalization/intro/#design-variables)
- Individual cost terms are also explained [here](https://nmsm.rice.edu/model-personalization/ground-contact-personalization/intro/#recommended-cost-function-formulation)

## Running GCP

To run GCP:

- Make sure the nmsm-core project is loaded (double-click `Project.prj` in the root of nmsm-core if it is not loaded).
- Navigate to the nmsm-tutorial/Step-5-Ground-Contact-Personalization directory.
- Open and run the MATLAB script `runGCP.m`.

This script will run the GCP tool with the XML settings file described above. The results will be saved in the `gcpResults` directory. The results will also be plotted.
