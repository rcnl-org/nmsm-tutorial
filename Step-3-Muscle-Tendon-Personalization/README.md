# Step 3 Muscle-Tendon Personalization

After preprocessing, the data are ready for Muscle-Tendon Personalization (MTP) if EMG data are available. MTP uses EMG-driven modeling to calibrate muscle and tendon parameters, deriving properties and muscle activations to match Inverse Dynamics (ID) joint moments. 

MTP is primarily based on [Meyer (2017)](https://rcnl.rice.edu/PDFs/po2017.pdf). It also incorporates a synergy extrapolation algorithm first published in [**TODO add SynX paper**](), which uses muscle excitation synergies to estimate excitations for muscles without measured EMG data. The tool is documented in more detail [here](https://nmsm.rice.edu/model-personalization/muscle-tendon-personalization/).

This tool requires an OpenSim model and a directory of data, produced by or following the same formatting as the output of our [data preprocessing tool](https://nmsm.rice.edu/model-personalization/data-preprocessing/). If using [Muscle-Tendon Length Initialization](https://nmsm.rice.edu/model-personalization/muscle-tendon-length-initialization/), highly recommended for MTP, a [passive moment data directory](https://nmsm.rice.edu/model-personalization/muscle-tendon-length-initialization/#input-files) is also needed. 

## How to Use

MTP is configured using a XML settings file. For this project, we are optimizing the parameters of the nine muscles in this model which span the sagittal coordinates of the right leg: hip, knee, and ankle flexion. One of these muscles, the iliacus, does not have EMG data, so we will estimate its excitations using synergy extrapolation. We will also use Muscle-Tendon Length Initialization to refine our intial guesses. 

Open the XML settings file (`MTPSettings.xml`). This file contains the primary requirements for MTP, as well as three sections defining settings for Muscle-Tendon Length Initialization, synergy extrapolation, and the main MTP algorithm. 

- `<input_model_file>` - the OpenSim (.osim) file to use
- `<results_directory>` - the location of MTP output files
- `<data_directory>` - input data prepared during preprocessing
- `<coordinate_list>` - a list of coordinates, which is used to determine the moments MTP will track
    - Note that MTP will optimize parameters for every muscle that spans the coordinates in this list. This means that every muscle spanning these coordinates must have associated EMG data or be defined in a missing EMG channel group, as explained below. 
- Muscle groups - more details on these groups, which must also be included in the input model file, can be found [here](https://nmsm.rice.edu/preparing-to-use-nmsm-pipeline/model-requirements/#muscle-tendon-personalization)
    - `<activation_muscle_groups>` - groups of muscles that will maintain similar activations over time
    - `<normalized_fiber_length_muscle_groups>` - groups of muscles that will maintain similar normalized fiber lengths over time
    - `<collected_emg_channel_muscle_groups>` - groups of muscles defining which muscles in the model each collected EMG channel describes
        - Each group must have the same name as its corresponding data column in the EMG files
    - `<missing_emg_channel_muscle_groups>` - groups of muscles defining EMG signals estimated using synergy extrapolation
        - Muscles should be grouped together if they would be described by the same EMG signal if it had been collected
- `<MuscleTendonLengthInitialization>` - a section defining the input data and cost terms for Muscle-Tendon Length Initialization
- `<MTPSynergyExtrapolation>` - defines settings and cost terms for synergy extrapolation
- `<MTPTaskList>` - a list of `<MTPTask>` elements, each defining the settings for a MTP optimization
    - MTP tasks are performed sequentially. For most cases, only one stage is needed.

## Running MTP

To run MTP:

- Make sure the nmsm-core project is loaded (double-click `Project.prj` in the root of nmsm-core if it is not loaded).
- Navigate to the nmsm-tutorial/Step-3-Muscle-Tendon-Personalization directory.
- Open and run the MATLAB script `RunMTP.m`.

This script will run the MTP tool with the XML settings file described above. The results will be saved in the `mtpResults` directory. The results will also be plotted. 