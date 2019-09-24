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
# http://www.biz.uiowa.edu/faculty/jledolter/DataMining

#2.1 Example 1: 2006 Birth Data #############################################
#From R in a Nutshell, Adler 2009

library(lattice) 
install.packages("nutshell")
library(nutshell)
data(births2006.smpl)
births2006.smpl[1:5,] #show rows 1-5
dim(births2006.smpl) #show dimensions of data set

#examine births by day of week:

#extract the segment
births.dow=table(births2006.smpl$DOB_WK)

#examine the result:
births.dow

#graph the result:
barchart(births.dow, ylab="Day of Week", col = "black")

#Perhaps weekends are slow due to c-sections not being scheduled.  Split the data set into DoW and delivery type:
dob.dm.tbl=table(WK=births2006.smpl$DOB_WK,
                  MM=births2006.smpl$DMETH_REC)
dob.dm.tbl

#drop the "unknown" column:
dob.dm.tbl=dob.dm.tbl[,-2]
dob.dm.tbl

#initialize a display device:
trellis.device()
?trellis.device

#Chart births by day and type:
barchart(dob.dm.tbl, ylab="Day of Week")
barchart(dob.dm.tbl, horizontal = FALSE, groups = FALSE, xlab="Day of Week", col="black")

#Use the lattice package to condition density histograms on a third variable.
#Here, we chart birth weight agains both #birthed...
histogram(~DBWT|DPLURAL, data=births2006.smpl, layout=c(1,5), col="black")
#We can see birth weight decreases as # birthed increases

#and delivery method:
histogram(~DBWT|DMETH_REC, data=births2006.smpl, layout=c(1,3), col="black")

#now smoothed versions:
?densityplot
densityplot(~DBWT|DPLURAL, data=births2006.smpl, layout=c(1,5), plot.points=FALSE, col="black")

#overlaid on a single chart:
densityplot(~DBWT, groups = DPLURAL, data = births2006.smpl, plot.points=FALSE)

#a dot plot illustrated the lack of observations are higher #birthed:
?dotplot
dotplot(~DBWT|DPLURAL, data=births2006.smpl, layout=c(1,5), plot.points=FALSE, col="black")

#scatter plots ("xyplot' in lattice package) show birth weight against weight gain:
xyplot(DBWT~DOB_WK, data=births2006.smpl, col="black")

xyplot(DBWT~DOB_WK|DPLURAL, data=births2006.smpl, layout=c(1,5), col="black")

#single scatter plot:
xyplot(DBWT~WTGAIN, data=births2006.smpl, col="black")

#faceted by #birthed:
xyplot(DBWT~WTGAIN|DPLURAL, data=births2006.smpl, layout=c(1,5), col="black")

#smoothed scatter plot:
smoothScatter(births2006.smpl$WTGAIN, births2006.smpl$DBWT)

#boxplots to illustrates APGAR score (lower is worse) versus weight:
boxplot(DBWT~APGAR5, data=births2006.smpl, ylab="DBWT", xlab="APGAR5")

#you can see this relationship clearly.  By contrast:
boxplot(DBWT~DOB_WK, data=births2006.smpl, ylab="DBWT", xlab="DoW")

#Further conditon by sex:
bwplot(DBWT~factor(APGAR5)|factor(SEX), data=births2006.smpl, xlab="APGAR5")

#Average birth weight by #birthed, then split further by sex:

#set #birthed as a factor:
fac=factor(births2006.smpl$DPLURAL)


res=births2006.smpl$DBWT

?tapply
#calculate the mean for each unique #birthed:
t4=tapply(res, fac, mean, na.rm=TRUE)
t4

#calculate mean for #birthed by sex:
t5=tapply(births2006.smpl$DBWT, INDEX=list(births2006.smpl$DPLURAL, births2006.smpl$SEX), FUN=mean, na.rm=TRUE)
t5

barplot(t4, ylab="DBWT")
barplot(t5, beside=TRUE, ylab="DBWT") 

















































