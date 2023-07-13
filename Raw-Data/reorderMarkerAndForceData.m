function reorderMarkerAndForceData(trialName,x,y,z)

% Matlab program to change order of and scale columns in a
% marker data .trc file.
%
% Inputs: trialName - Name of experimental trial
%             (e.g., GaitTrial48), which will read in
%             input files <trialname>_markers.trc and
%             <trialName>_forces_ec_adjusted.mot.
%         x - Columns from original .trc marker file
%             to be used to populate the x columns of
%             the reordered marker and force files.
%         y - Columns from original .trc marker file
%             to be used to populate the x columns of
%             the reordered marker and force files.
%         z - Columns from original .trc marker file
%             to be used to populate the x columns of
%             the reordered marker and force files.
%
%         Columns from original .trc marker file are indicated
%         by 1 for the x column, -1 for the negative of the
%         x column, 2 for the y column, -2 for the negative of
%         the y column, 3 for the z column, and -3 for the
%         negative of the z column.
%
% Outputs: <trialName>_markers_reordered.trc
%          <trialName>_forces_ec_reordered.mot
%
% Note that <trialName>_forces_ec.mot becomes
% <trialName>_forces_ec_filtering.mot which becomes
% <trialName>_forces_ec_adjusted.mot after electrical center adjustment
% which becomes <trialName>_forces_ec_reordered.mot after swapping axes
% in this function.
%
% As an example of how to use the program, if the columns
% of trial drive_kick1 are to be processed such that
% Original -x => New x
% Original z => New y
% Original y => New z
% then the program would be called as
%
% >> reorderMarkerAndForceData('drive_kick1',-1,3,2)
%
% Author: B.J. Fregly
% %       July 11, 2023

% Create 3 x 3 perumation matrix
permutation_matrix = zeros(3,3);
permutation_matrix(abs(x),1) = sign(x);
permutation_matrix(abs(y),2) = sign(y);
permutation_matrix(abs(z),3) = sign(z);

% Read in marker data from .trc file
markerFile = trialName;
fprintf('Reading in marker data from file %s . . .\n', markerFile)
delimiterIn = '\t';
headerlinesIn = 6;
data = importdata(markerFile,delimiterIn,headerlinesIn);
headerlines = data.textdata;
frameTimeData = data.data(:,1:2);
markerData = data.data(:,3:end);

% Reorder marker data based on permutation matrix
[nRows,nCols] = size(markerData);
newMarkerData = zeros(nRows,nCols);

for i = 1:3:nCols-2
    newMarkerData(:,i:i+2) = markerData(:,i:i+2)*permutation_matrix;
end

% Output data new markers .trc file
[filepath,name,ext] = fileparts(trialName);
outfile = strcat(filepath, name, "_reordered", ext);
fprintf('Outputting reordered marker data to file %s . . .\n', outfile)
fid = fopen(outfile,'w');

nCols = size(headerlines,2);

for i = 1:4
    fprintf(fid,'%s\n',headerlines{i,1});
end

for j = 1:nCols-1
    fprintf(fid,'%s\t',headerlines{5,j});
end

fprintf(fid,'%s\n',headerlines{5,nCols});
fprintf(fid,'\n');

[nRows,nCols] = size(newMarkerData);

for i = 1:nRows
    fprintf(fid,'%d\t%8.3f\t',frameTimeData(i,1:2));

    for j = 1:nCols-1
        fprintf(fid,'%20.14f\t',newMarkerData(i,j));
    end

    fprintf(fid,'%20.14f\n',newMarkerData(i,nCols));
end

fclose(fid);


