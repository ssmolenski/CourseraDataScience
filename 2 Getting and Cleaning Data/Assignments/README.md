 #Source <br />
 Data were taken from Human Activity Recognition Using Smartphones Data Set ( http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones ). <br />
<br />
#Data <br />
 run_analysis.R reads in data from the files given and performs the following processes: <br />
 <br />
 
 "features.txt"<br />
 File contains the labels of each variable. I extract these names, subset only the elements that contain mean and standard deviation values, and then split it into two vectors: one to define the subset of data to be taken and the other to label that data. The labels were then cleaned up to a more human-readable form. <br />
 <br />
 
 "activity_labels.txt"<br />
 File contains the key for which number corresponds to which activity. I use this to convert numbers into activity names.<br />
 <br />
 
 "test/subject_test.txt", "train/subject_train.txt"<br />
 File contains the number designating which participant data was taken from for each observation. I read these in as numbers and combine them into one vector.<br />
 <br />
 
 "test/y_test.txt", "train/y_train.txt"<br />
 File contains the numbers disgnating which activity the participant was doing for each observation. I read these in as numbers, combine them into one vector, and then use the activity label key (above) to transform numbers into activity names.<br />
 <br />
 
 "test/X_test.txt", "train/X_train.txt"<br />
 File contains the bulk of the data. I subset this with only the variables that contain mean or std data (as defined above), then combine them into one table. I label the table with the human-readable names (above) and add on two new columns designating the participant number and the activity for each observation.<br />
 <br />

 #Analysis <br />
 The only analysis performed was to group the data by participant and activity, then calculate the mean of each veriable for each participant and activity.