 #Source <br />
 Data were taken from Human Activity Recognition Using Smartphones Data Set ( http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones ). <br />

#Pre-processing <br />
The variables come from the accelerometer and gyroscope 3-axial raw signals. These time domain signals were captured at a constant rate of 50 Hz. Then they were filtered using a median filter and a 3rd order low pass Butterworth filter with a corner frequency of 20 Hz to remove noise. Similarly, the acceleration signal was then separated into body and gravity acceleration signals  using another low pass Butterworth filter with a corner frequency of 0.3 Hz. <br />

Subsequently, the body linear acceleration and angular velocity were derived in time to obtain Jerk signals. Also the magnitude of these three-dimensional signals were calculated using the Euclidean norm.  <br />

Finally a Fast Fourier Transform (FFT) was applied to some of these signals. <br />

'-XYZ' is used to denote 3-axial signals in the X, Y and Z directions. 'Magnitude' denotes the magnitude of the respective XYZ signals (ie, magnitude=sqrt(X^2+Y^2+Z^2)). <br />

Mean and standard deviation were calculated for each category. This is the data that I extracted and cleaned. <br />

Data were read in directly from the files and transformed to appropriate object type. Variables were renamed to reflect the measurement and, finally, a secondary data set was produced including the mean of each value for each participant and each activity. <br />
 
#Data <br />
The variable names are described below: <br />
<br />

[1] "activity" <br />
One of five activities performed for each measurement: walking, walking upstairs, walking downstairs, sitting, standing, or laying.
<br />

[2] "participant" <br />
A number between 1 and 30 designating the person from whom data was taken.
<br />

 Raw acceleration signals are the data from the accelerometer in the smartphone. While the documentation does not specifically say, it is implied that these numbers have units of Hz, as discussed above: <br />
 [3] "raw accel signal mean X" <br />
 [4] "raw accel signal mean Y" <br />
 [5] "raw accel signal mean Z" <br />
 [6] "raw accel signal std X" <br />
 [7] "raw accel signal std Y" <br />
 [8] "raw accel signal std Z" <br />
 <br />

 Gravity acceleration signals are the gravity "noise" picked up by the accelerometer, which will later be filtered out:<br />
 [9] "gravity accel mean X"<br />
 [10] "gravity accel mean Y"<br />
 [11] "gravity accel mean Z"<br />
[12] "gravity accel std X"<br />
[13] "gravity accel std Y"<br />
[14] "gravity accel std Z"<br />
<br />

Acceleration data calculated from the accelerometer data as discussed above. Again, no units were given in the documentation:<br />
[15] "accel mean X"<br />
[16] "accel mean Y"<br />
[17] "accel mean Z"<br />
[18] "accel std X"<br />
[19] "accel std Y"<br />
[20] "accel std Z"<br />
<br />

Raw gyroscope signals are the data from the gyroscope in the smartphone. While the documentation does not specifically say, it is implied that these numbers have units of Hz, as discussed above:<br />
[21] "raw gyro signal mean X"<br />
[22] "raw gyro signal mean Y"<br />
[23] "raw gyro signal mean Z"<br />
[24] "raw gyro signal std X"<br />
[25] "raw gyro signal std Y"<br />
[26] "raw gyro signal std Z"<br />
<br />

Angular velocity data calculated from the gyroscope data as discussed above. Again, no units were given in the documentation:<br />
[27] "angular velocity mean X"<br />
[28] "angular velocity mean Y"<br />
[29] "angular velocity mean Z"<br />
[30] "angular velocity std X"<br />
[31] "angular velocity std Y"<br />
[32] "angular velocity std Z"<br />
<br />

Mean and standard deviation are calculated for the magnitude values, as discussed above:<br />
[33] "raw accel signal magnitude mean"<br />
[34] "raw accel signal magnitude std"<br />
[35] "gravity accel magnitude mean"<br />
[36] "gravity accel magnitude std"<br />
[37] "accel magnitude mean"<br />
[38] "accel magnitude std"<br />
[39] "raw gyro signal magnitude mean"<br />
[40] "raw gyro signal magnitude std"<br />
[41] "angular velocity magnitude mean"<br />
[42] "angular velocity magnitude std"<br />
<br />

The remainder are the same data, but after the fast fourier transform has been performed:<br />
[43] "FFT raw accel signal mean X"<br />
[44] "FFT raw accel signal mean Y"<br />
[45] "FFT raw accel signal mean Z"<br />
[46] "FFT raw accel signal std X"<br />
[47] "FFT raw accel signal std Y"<br />
[48] "FFT raw accel signal std Z"<br />
[49] "FFT accel mean X"<br />
[50] "FFT accel mean Y"<br />
[51] "FFT accel mean Z"<br />
[52] "FFT accel std X"<br />
[53] "FFT accel std Y"<br />
[54] "FFT accel std Z"<br />
[55] "FFT raw gyro signal mean X"<br />
[56] "FFT raw gyro signal mean Y"<br />
[57] "FFT raw gyro signal mean Z"<br />
[58] "FFT raw gyro signal std X"<br />
[59] "FFT raw gyro signal std Y"<br />
[60] "FFT raw gyro signal std Z"<br />
[61] "FFT raw accel signal magnitude mean"<br />
[62] "FFT raw accel signal magnitude std"<br />
[63] "FFT accel magnitude mean"<br />
[64] "FFT accel magnitude std"<br />
[65] "FFT raw gyro signal magnitude mean"<br />
[66] "FFT raw gyro signal magnitude std"<br />
[67] "FFT angular velocity magnitude mean"<br />
[68] "FFT angular velocity magnitude std"<br />
