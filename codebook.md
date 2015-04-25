#Code Book


The data set "tidy_data.txt" contains 68 variables, they are listed as below:

[1] Subject: volunteer ID. Its range is from 1 to 30.

[2] Activity: activity types. 
            WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING and LAYING.

**Variable [3] ~ [68] are feature variables. Detailed explanation is attached in the end.**

 [3] TimeBodyAccelerometerMeanX                              
 [4] TimeBodyAccelerometerMeanY                              
 [5] TimeBodyAccelerometerMeanZ                              
 [6] TimeBodyAccelerometerStandardDeviationX                 
 [7] TimeBodyAccelerometerStandardDeviationY                 
 [8] TimeBodyAccelerometerStandardDeviationZ                 
 [9] TimeGravityAccelerometerMeanX                           
[10] TimeGravityAccelerometerMeanY                           
[11] TimeGravityAccelerometerMeanZ                           
[12] TimeGravityAccelerometerStandardDeviationX              
[13] TimeGravityAccelerometerStandardDeviationY              
[14] TimeGravityAccelerometerStandardDeviationZ              
[15] TimeBodyAccelerometerJerkMeanX                          
[16] TimeBodyAccelerometerJerkMeanY                          
[17] TimeBodyAccelerometerJerkMeanZ                          
[18] TimeBodyAccelerometerJerkStandardDeviationX             
[19] TimeBodyAccelerometerJerkStandardDeviationY             
[20] TimeBodyAccelerometerJerkStandardDeviationZ             
[21] TimeBodyGyroscopeMeanX                                  
[22] TimeBodyGyroscopeMeanY                                  
[23] TimeBodyGyroscopeMeanZ                                  
[24] TimeBodyGyroscopeStandardDeviationX                     
[25] TimeBodyGyroscopeStandardDeviationY                     
[26] TimeBodyGyroscopeStandardDeviationZ                     
[27] TimeBodyGyroscopeJerkMeanX                              
[28] TimeBodyGyroscopeJerkMeanY                              
[29] TimeBodyGyroscopeJerkMeanZ                              
[30] TimeBodyGyroscopeJerkStandardDeviationX                 
[31] TimeBodyGyroscopeJerkStandardDeviationY                 
[32] TimeBodyGyroscopeJerkStandardDeviationZ                 
[33] TimeBodyAccelerometerMagnitudeMean                      
[34] TimeBodyAccelerometerMagnitudeStandardDeviation         
[35] TimeGravityAccelerometerMagnitudeMean                   
[36] TimeGravityAccelerometerMagnitudeStandardDeviation      
[37] TimeBodyAccelerometerJerkMagnitudeMean                  
[38] TimeBodyAccelerometerJerkMagnitudeStandardDeviation     
[39] TimeBodyGyroscopeMagnitudeMean                          
[40] TimeBodyGyroscopeMagnitudeStandardDeviation             
[41] TimeBodyGyroscopeJerkMagnitudeMean                      
[42] TimeBodyGyroscopeJerkMagnitudeStandardDeviation         
[43] FrequencyBodyAccelerometerMeanX                         
[44] FrequencyBodyAccelerometerMeanY                         
[45] FrequencyBodyAccelerometerMeanZ                         
[46] FrequencyBodyAccelerometerStandardDeviationX            
[47] FrequencyBodyAccelerometerStandardDeviationY            
[48] FrequencyBodyAccelerometerStandardDeviationZ            
[49] FrequencyBodyAccelerometerJerkMeanX                     
[50] FrequencyBodyAccelerometerJerkMeanY                     
[51] FrequencyBodyAccelerometerJerkMeanZ                     
[52] FrequencyBodyAccelerometerJerkStandardDeviationX        
[53] FrequencyBodyAccelerometerJerkStandardDeviationY        
[54] FrequencyBodyAccelerometerJerkStandardDeviationZ        
[55] FrequencyBodyGyroscopeMeanX                             
[56] FrequencyBodyGyroscopeMeanY                             
[57] FrequencyBodyGyroscopeMeanZ                             
[58] FrequencyBodyGyroscopeStandardDeviationX                
[59] FrequencyBodyGyroscopeStandardDeviationY                
[60] FrequencyBodyGyroscopeStandardDeviationZ                
[61] FrequencyBodyAccelerometerMagnitudeMean                 
[62] FrequencyBodyAccelerometerMagnitudeStandardDeviation    
[63] FrequencyBodyAccelerometerJerkMagnitudeMean             
[64] FrequencyBodyAccelerometerJerkMagnitudeStandardDeviation
[65] FrequencyBodyGyroscopeMagnitudeMean                     
[66] FrequencyBodyGyroscopeMagnitudeStandardDeviation        
[67] FrequencyBodyGyroscopeJerkMagnitudeMean                 
[68] FrequencyBodyGyroscopeJerkMagnitudeStandardDeviation      


The features selected for this database come from the **accelerometer** and **gyroscope** 3-axial raw signals TimeAccelerometerXYZ and TimeGyroscopeXYZ. These time domain signals were captured at a constant rate of 50 Hz. Then they were filtered using a median filter and a 3rd order low pass Butterworth filter with a corner frequency of 20 Hz to remove noise. Similarly, the acceleration signal was then separated into **body** and **gravity** acceleration signals (TimeBodyAccelerometerXYZ and TimeGravityAccelerometerXYZ) using another low pass Butterworth filter with a corner frequency of 0.3 Hz. 

Subsequently, the body linear acceleration and angular velocity were derived in time to obtain **Jerk** signals (TimeBodyAccelerometerJerkXYZ and TimeBodyGyroscopeJerkXYZ). Also the **magnitude** of these three-dimensional signals were calculated using the Euclidean norm (TimeBodyAccelerometerMagnitude, TimeGravityAccelerometerMagnitude, TimeBodyAccelerometerJerkMagnitude, TimeBodyGyroscopeMagnitude, TimeBodyGyroscopeJerkMagnitude). 

Finally a Fast Fourier Transform (FFT) was applied to some of these signals producing  **frequency** domain signals. 

These signals were used to estimate variables of the feature vector for each pattern:  
**'XYZ' is used to denote 3-axial signals in the X, Y and Z directions.**

**Mean:** Mean value

**Standard Deviation:** Standard deviation


