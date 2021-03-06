# Report for Getting and Cleaning Data Course Project
S C NG  
20 Apr 2015  
 
## Project Description
This is the report of Course Project for Coursera Course [Getting and Cleaning Data][course_url]. Please refer to the [course project page][project_url] for the details. All the source code for this project is uploaded in [author's github repository][github_url].

##How to re-produce the resulting dataset from raw data
All the scripts for generating the final dataset are included in R scripts file [run_analysis.R][script_url]. The scripts assumed that user has downloaded the [raw data][data_url] zip file and unzipped all contents into ./data folder. 

The following command can be used to run the script

```r
source("run_analysis.R")
```

The resulting dataset will be exported as [summarise_tidy_dataset.txt][result_url] file

##Codebook of the tidy dataset
Please refer to the [codebook][codebook_url] that described the variables, the data and any further information on the transformation from original dataset

##Reference
* [Forum post from Jawad Habib](https://class.coursera.org/getdata-013/forum/thread?thread_id=191#post-772)
* [Project FAQ from David Hood](https://class.coursera.org/getdata-013/forum/thread?thread_id=30)
* [Course Community Site](http://datasciencespecialization.github.io/getclean/)


[course_url]:https://class.coursera.org/getdata-013
[project_url]:https://class.coursera.org/getdata-013/human_grading/index
[github_url]:https://github.com/scng/getdata_PeerAssignments
[script_url]:https://github.com/scng/getdata_PeerAssignments/blob/master/run_analysis.R
[data_url]:https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip
[result_url]:https://github.com/scng/getdata_PeerAssignments/blob/master/summarise_tidy_dataset.txt
[codebook_url]:https://github.com/scng/getdata_PeerAssignments/blob/master/cookbook.md
