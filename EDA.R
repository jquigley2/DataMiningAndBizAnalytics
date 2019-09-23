#Intro

#Data mining involves several interrelated steps:
#1.) Efficient data storage and data preprocessing steps
#2.) selection of appropriate response variables
#3.) screening data for outliers, handle missing data
#4.) partitioning of data sets into test, train, validate
#5.) EDA:
     #a.) visualization and summarization of data
     #b.) initial summary of data
#6.) Apply the appropriate data modeling technique: 
     #a.) regression
     #b.) logistic regression
     #c.) classification trees
     #d.) nearest neighbors
     #e.) k-means clustering
     #f.) 
     #g.) 

#7.) confirm findings on a holdut set
#8.) implement insights

#Chapter 2: Processing the Info and Getting to Know Your Data ###############
http://www.biz.uiowa.edu/faculty/jledolter/DataMining

#2.1 Example 1: 2006 Birth Data #############################################
#From R in a Nutshell, Adler 2009

library(lattice)
install.packages("nutshell")
library(nutshell)
data(births2006.smpl)
births2006.smpl[1:5,] #show rows 1-5
dim(births2006.smpl) #show dimensions of data set

