%% Convert HiPCT tiff to Nifti formatting 

% blurb
% a keenlyside

% -------------------------------------------------------------------------
function tiff2nifti(niftiToolboxPath, inputDir, outputFile)
% Add path to NIfTI toolbox (adjust the path according to your installation)
addpath(niftiToolboxPath);

% Get a list of all TIFF files in the directory
tiffFiles = dir(fullfile(inputDir, '*.tif'));

% Check if there are any TIFF files
if isempty(tiffFiles)
    error('No TIFF files found in the specified directory.');
end

% Read the first image to get the dimensions
firstImage = imread(fullfile(inputDir, tiffFiles(1).name));
[rows, cols] = size(firstImage);

% Define the size of the central region
cropSize = 100;

% Initialize a 3D volume to store all cropped images
numImages = length(tiffFiles);
volume = zeros(cropSize, cropSize, numImages, 'like', firstImage);

% Loop through each TIFF file and read, then crop the image
for i = 1:numImages
    fileName = fullfile(inputDir, tiffFiles(i).name);
    image = imread(fileName);
    
    % Get the dimensions of the current image
    [imgRows, imgCols] = size(image);
    
    % Calculate the starting points for cropping
    startRow = max(1, floor((imgRows - cropSize) / 2) + 1);
    startCol = max(1, floor((imgCols - cropSize) / 2) + 1);
    
    % Calculate the ending points for cropping
    endRow = min(imgRows, startRow + cropSize - 1);
    endCol = min(imgCols, startCol + cropSize - 1);
    
    % Extract the central region
    croppedImage = image(startRow:endRow, startCol:endCol);
    
    % If the cropped region is smaller than the target size, pad with zeros
    if size(croppedImage, 1) < cropSize || size(croppedImage, 2) < cropSize
        paddedImage = zeros(cropSize, cropSize, 'like', firstImage);
        paddedImage(1:size(croppedImage, 1), 1:size(croppedImage, 2)) = croppedImage;
        croppedImage = paddedImage;
    end
    
    % Store the cropped image in the volume
    volume(:,:,i) = croppedImage;
end

% Create a NIfTI structure
nii = make_nii(volume);

% Save the NIfTI file
save_nii(nii, outputFile);

fprintf('NIfTI file saved successfully to %s\n', outputFile);

end
