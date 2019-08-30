# Getting and Cleaning Data
### The Functions
|functions|application in the script|
|:-:|:-:|
|read.table|to grab data from the file|
|cbind&rbind|to combine the datasets|
|rm|to remove the useless variables|
|grep|to justify the column names to be more readable|
|colnames&names|to get the colnames of the dataset|
|gsub|to justify the colnames of data|
|group_by|to group the data by the subject and activity|
|summarize_each|to calculate the average  of each variable for each activity and each subject|

### The Variables
|Variables|Data|
|:-:|:-:|
|x(/y/subject)_test(/train)|the original data read from the files|
|train|combination of the (x/y/subject)_train|
|test|combination of the (x/y/subject)_test|
|data|combination of all the original data|
|fname|the data from "features.txt"|
|fin|the index of element in fname which needs to be justify|
|aname|data read from "activity_labels.txt"|
|data_temp|the data set after being grouped|
|data_tidy_mean|the final tidy data|

### The Column Names of Exported Data Set
|Names|Meaning|
|:-|:-|
|train/Inertial Signals/total_acc_x_train|The acceleration signal from the smartphone accelerometer X axis in standard gravity units 'g'. Every row shows a 128 element vector. The same description applies for the 'total_acc_x_train.txt' and 'total_acc_z_train.txt' files for the Y and Z axis. |
|train/Inertial Signals/body_acc_x_train|The body acceleration signal obtained by subtracting the gravity from the total acceleration. |
|train/Inertial Signals/body_gyro_x_train|The angular velocity vector measured by the gyroscope for each window sample. The units are radians/second. |
|subject|Each row identifies the subject who performed the activity for each window sample. Its range is from 1 to 30. |
|activity|The activity names.|


