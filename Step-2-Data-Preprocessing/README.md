# Step 2 Data Preprocessing

After JMP, the model is ready to use with the OpenSim tools Inverse Kinematics, Inverse Dynamics, and Muscle Analysis (found in Tools > Analyze...). These results will be used with other tools in the NMSM Pipeline. First, these results need to be organized for those tools. 

The data preprocessing script included with the NMSM Pipeline can process EMG data, generate muscle-tendon velocity data from muscle-tendon length data, and split data files in multiple trials organized in the directories expected by NMSM Pipeline tools. The data preprocessing script is not a stand-alone tool, so it does not use an XML settings file. 

## How to Use

The data preprocessing script can be run after changing input settings, denoted with comments in the script. The script has three main components. Each component is in a separate section of the script, so sections may be skipped if they are not needed. 

### Process EMG

In this step, EMG data are highpass filtered, then demeaned, rectified, and then lowpass filtered. Both filters are Butterworth filters, and the order of the filters can be changed. EMG data are also normalized so that the maximum value in each data column over the full time range in the file is 1. This normalization ensures that Muscle-Tendon Personalization, the next tool in the pipeline, finds appropriate activation values for each muscle. 

### Create Muscle Tendon Velocity

Muscle-tendon velocity is used in muscle force equations, but this is not calculated by the Muscle Analysis tool. This component of the preprocessing script uses B-spline derivatives to determine the velocity. The cutoff frequency determines the number of nodes used to fit the B-splines. 

### Split Data into Trials by Time Pairs

Data are organized into directories, and files are split into the trial intervals specified as start and end time pairs in the `trialTimePairs` array. Regardless of how many frames are included in each time interval, each trial will be resampled to 101 frames by fitting splines. 

## Running Data Preprocessing

To run the data preprocessing script:

- Make sure the nmsm-core project is loaded (double click `Project.prj` in the root of nmsm-core).
- Navigate to the nmsm-tutorial/Step-2-Data-Preprocessing directory.
- Open and run the MATLAB script `preprocessing.m`.

The script will run and save properly formatted data in the `preprocessed` directory.
