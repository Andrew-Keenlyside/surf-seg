%% Convert HiPCT JPEG2000 to Nifti formatting 

% blurb
% a keenlyside

% -------------------------------------------------------------------------
function hipct2nifti(niftiToolboxPath, inputDir, outputFile)
% Add path to NIfTI toolbox (adjust the path according to your installation)
addpath(niftiToolboxPath);


% Get a list of all JPEG2000 files in the directory
jpegFiles = dir(fullfile(inputDir, '*.jp2'));

% Check if there are any JPEG2000 files
if isempty(jpegFiles)
    error('No JPEG2000 files found in the specified directory.');
end

% Read the first image to get the dimensions
firstImage = imread(fullfile(inputDir, jpegFiles(1).name));
[rows, cols] = size(firstImage);

% Initialize a 3D volume to store all images
numImages = length(jpegFiles);
volume = zeros(rows, cols, numImages, 'like', firstImage);

% Loop through each JPEG2000 file and read the image
for i = 1:numImages
    fileName = fullfile(inputDir, jpegFiles(i).name);
    volume(:,:,i) = imread(fileName);
end

% Create a NIfTI structure
nii = make_nii(volume);

% Save the NIfTI file
save_nii(nii, outputFile);

fprintf('NIfTI file saved successfully to %s\n', outputFile);

end