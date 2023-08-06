# Step 4 Neural Control Personalization

The next step in the pipeline is Neural Control Personalization (NCP). It may be performed with or without MTP results, but it should be used after MTP if EMG data are being used with the model. NCP fits synergy weights and activations to known and unknown muscle activations to match Inverse Dynamics joint moments.

NCP is based on [Shourijeh (2020)](https://rcnl.rice.edu/PDFs/jbme2020.pdf). Unlike [non-negative matrix factorization](https://en.wikipedia.org/wiki/Non-negative_matrix_factorization), NCP uses its cost function to match joint moments and can estimate activations for muscles without activation data. This tool is documented in more detail [here](https://nmsm.rice.edu/model-personalization/neural-control-personalization/).

This tool requires an OpenSim model and a directory of data, produced by or following the same formatting as the output of our [data preprocessing tool](https://nmsm.rice.edu/model-personalization/data-preprocessing/). If using [Muscle-Tendon Length Initialization](https://nmsm.rice.edu/model-personalization/muscle-tendon-length-initialization/), optional for NCP, a [passive moment data directory](https://nmsm.rice.edu/model-personalization/muscle-tendon-length-initialization/#input-files) is also needed. If matching results from MTP, its results directory must also be specified.

## How to Use

In this step of our project, we are optimizing synergy weights and activations to fit the muscle activations resulting from MTP. These synergy activations will also be calibrated to produce joint moments matching those found with Inverse Dynamics.

Open the XML settings file (`NCPSettings.xml`). NCP shares many of its settings with MTP.

- `<input_model_file>` - the OpenSim (.osim) file to use
- `<results_directory>` - the location of MTP output files
- `<input_osimx_file>` - a file containing previous personalization data associated with the model
    - For this project, this input .osimx file was generated as a result of MTP. If using previous MTP data with NCP, this file will provide personalized muscle parameters. If using Muscle-Tendon Length Initialization, these results will appended to a copy of this file after NCP.
- `<data_directory>` - input data prepared during preprocessing
- `<coordinate_list>` - a list of coordinates, which is used to determine the moments NCP will track
    - As with MTP, NCP will include every muscle that spans these coordinates. Every muscle must be included in a synergy group as explained below.
- Muscle groups - more details on these groups, which must also be included in the input model file, can be found [here](https://nmsm.rice.edu/preparing-to-use-nmsm-pipeline/model-requirements/#neural-control-personalization)
    - `<activation_muscle_groups>` - groups of muscles that will maintain similar activations over time
    - `<normalized_fiber_length_muscle_groups>` - groups of muscles that will maintain similar normalized fiber lengths over time
- `<MuscleTendonLengthInitialization>` - a section defining the input data and cost terms for Muscle-Tendon Length Initialization
    - This section is the same as the one used with MTP.
- `<mtp_results_directory>` - a directory containing MTP results, which is used to find previous activations to match
- `<enforce_bilateral_symmetry>` - enforces strong similarity in synergy weights between synergy groups for optimizations with two groups with the same number of weights
    - As this project uses one synergy group, this setting does not apply.
- `<RCNLSynergySet>` - a set of `<RCNLSynergy>` elements, each defining a synergy group and the number of synergies used to describe activations of muscles in the group
    - The `<muscle_group_name>` belonging to each `<RCNLSynergy>` must be a muscle group in the provided model file. These groups define which muscles are described by each synergy.
- `<RCNLCostTermSet>` - a set of `<RCNLCostTerm>` elements for configuring the cost function

## Running NCP

To run NCP:

- Make sure the nmsm-core project is loaded (double-click `Project.prj` in the root of nmsm-core if it is not loaded).
- Navigate to the nmsm-tutorial/Step-4-Neural-Control-Personalization directory.
- Open and run the MATLAB script `RunNCP.m`.

This script will run the NCP tool with the XML settings file described above. The results will be saved in the `ncpResults` directory. The results will also be plotted.
