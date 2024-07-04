# surf-seg
MATLAB-based app plugin for modifying higherarchical phase CT (HiPCT) images and segmenting outer organ surfaces.

_Developed for Materials, Structures, and Manufacturing at Harwell (MSM@H) group, Mechanical Engineering, UCL
Andrew Keenlyside (andrew.keenlyside.23@ucl.ac.uk)_

# Install
Intstructions for installation of current version (July 2024)
- Requires linux-based MATLAB installation for interpolation functionality
- Download .mlappinstall file
- Open MATLAB
- In files or terminal, open .mlappinstall file and approve install
- Go to 'Apps' then 'My Apps' in MATLAB and open the app
- It will then launch as a new window

# Instructions for Use
Once open, the app can carry out various tasks with some requiring more data than others. N.B. that as many functions require nifti inputs, this can be rather RAM intensive.

- Segmentation: Requires an input directory of JPEG2000 (.jp2) images. Tested/runs on Windows and Linux (ubuntu).
  (note multiple niftis will be 10x sized and will need to be stored on ram, so check file sizes before use)

- Interpolation: Requires input and sparce mask nifti volumes. Runs on **linux only** (ubuntu).

- Conversion to Nifti: Requires an input directory of JPEG2000 (.jp2) images. Tested/runs on Windows and Linux (ubuntu).
  (note a nifti will be 10x sized and will need to be stored on ram, so check file sizes before use)

- Binning resolution: TBC.
