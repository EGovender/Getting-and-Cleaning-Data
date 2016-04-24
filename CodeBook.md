#CodeBook
Feature Selection 
=================

The features selected for this database come from the Accelerometerelerometer and Gyroscopescope 3-axial raw signals tAccelerometer-XYZ and tGyroscope-XYZ. These time domain signals (prefix 't' to denote time) were captured at a constant rate of 50 Hz. Then they were filtered using a median filter and a 3rd order low pass Butterworth filter with a corner frequency of 20 Hz to remove noise. Similarly, the Accelerometereleration signal was then separated into body and gravity Accelerometereleration signals (timeBodyAccelerometer-XYZ and timeGravityAccelerometer-XYZ) using another low pass Butterworth filter with a corner frequency of 0.3 Hz. 

Subsequently, the body linear Accelerometereleration and angular velocity were derived in time to obtain Jerk signals (timeBodyAccelerometerJerk-XYZ and timeBodyGyroscopeJerk-XYZ). Also the magnitude of these three-dimensional signals were calculated using the Euclidean norm (timeBodyAccelerometerMag, timeGravityAccelerometerMag, timeBodyAccelerometerJerkMag, timeBodyGyroscopeMag, timeBodyGyroscopeJerkMag). 

Finally a Fast Fourier Transform (FFT) was applied to some of these signals producing fastFourierTransform_BodyAccelerometer-XYZ, fastFourierTransform_BodyAccelerometerJerk-XYZ, fastFourierTransform_BodyGyroscope-XYZ, fastFourierTransform_BodyAccelerometerJerkMag, fastFourierTransform_BodyGyroscopeMag, fastFourierTransform_BodyGyroscopeJerkMag. (Note the 'f' to indicate frequency domain signals).


These signals were used to estimate variables of the feature vector for each pattern:  
'-XYZ' is used to denote 3-axial signals in the X, Y and Z directions.

timeBodyAccelerometer-XYZ
timeGravityAccelerometer-XYZ
timeBodyAccelerometerJerk-XYZ
timeBodyGyroscope-XYZ
timeBodyGyroscopeJerk-XYZ
timeBodyAccelerometerMag
timeGravityAccelerometerMag
timeBodyAccelerometerJerkMag
timeBodyGyroscopeMag
timeBodyGyroscopeJerkMag
fastFourierTransform_BodyAccelerometer-XYZ
fastFourierTransform_BodyAccelerometerJerk-XYZ
fastFourierTransform_BodyGyroscope-XYZ
fastFourierTransform_BodyAccelerometerMag
fastFourierTransform_BodyAccelerometerJerkMag
fastFourierTransform_BodyGyroscopeMag
fastFourierTransform_BodyGyroscopeJerkMag

The set of variables that were estimated from these signals are: 

mean(): Mean value
std(): Standard deviation
mad(): Median absolute deviation 
max(): Largest value in array
min(): Smallest value in array
sma(): Signal magnitude area
energy(): Energy measure. Sum of the squares divided by the number of values. 
iqr(): Interquartile range 
entropy(): Signal entropy
arCoeff(): Autorregresion coefficients with Burg order equal to 4
correlation(): correlation coefficient between two signals
maxInds(): index of the frequency component with largest magnitude
meanFreq(): Weighted average of the frequency components to obtain a mean frequency
skewness(): skewness of the frequency domain signal 
kurtosis(): kurtosis of the frequency domain signal 
bandsEnergy(): Energy of a frequency interval within the 64 bins of the FFT of each window.
angle(): Angle between to vectors.

Additional vectors obtained by averaging the signals in a signal window sample. These are used on the angle() variable:

gravityMean
timeBodyAccelerometerMean
timeBodyAccelerometerJerkMean
timeBodyGyroscopeMean
timeBodyGyroscopeJerkMean

The complete list of variables of each feature vector is available in 'features.txt'

