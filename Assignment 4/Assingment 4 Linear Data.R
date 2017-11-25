#Assignment 4
rm(list=ls())   #cleans all objects from the enviroment
#First I have converted the .XLS file to .CSV 
#Importing the Datasets
LungData <- read.csv("DATASET/LungCapData.csv",header =T, stringsAsFactors = T)   #Linear
LungDataNON <- read.csv("DATASET/LungCapData2.csv",header =T, stringsAsFactors = T)#Non-Linear
#Exploring the dataset
dim(LungData)
head(LungData,20)
tail(LungData,20)
str(LungData)
attach(LungData) #Attaching the the variables of LungCap dataset
sapply(LungData , class) #Understanding the Class or Data Type of Variables
summary(LungData) #From the summary we can see the data do not contain any missing or outlier values

#a)	Show the difference between lung capacities of non-smokers vs. smokers using a plot.
Means1 <- aggregate(LungCap~Smoke,Smoke,mean)
boxplot(LungCap~Smoke,col=c(3,2),xlab="Smoke",ylab="LungCapacity",main="Boxplots of LungCapacity vs Smoke",las=1,names=c("Non-Smoker","Smoker"),cex.lab=1.5,cex.axis=1.5,cex.main=2.5)
points(1:2, Means1$LungCap, col = "White",pch=".",cex=3)

#b) Perform a two sided t-test and explain the test in your own language?
#i) One Sample T test
T1 <- t.test(LungCap, mu = 8, alt="two.sided", conf=0.95)
T1$p.value>0.05    #We accept the null Hypothesis since p value is > 0.05(alpha)
                  #We can also check from the boxplot that the mean is quiet close to 8 both for smoker and Non Smoker

#ii)two Sample T test difference between two mean of smoker and non smoker
T2 <- t.test(LungCap~Smoke, mu = 0, alt="two.sided", conf=0.95, var.eq=F, paired=F)
T2$p.value>0.05   #We reject the null Hypothesis since p value is < 0.05(alpha) 

#c)	What is ANOVA? Conduct a one way ANOVA for two suitable variables and explain every aspect of this test.

#First I have converted the .XLS file to .CSV
#Importing the Dataset
WLDData <- read.csv("DATASET/DietWeightLoss.csv")

#Exploring the Dataset
dim(WLDData)
head(WLDData,20)
tail(WLDData,20)
str(WLDData)
attach(WLDData) #Attaching the the variables of WLDData dataset
sapply(WLDData , class) #Understanding the Class or Data Type of Variables
summary(WLDData) #From the summary we can see the data do not contain any missing or outlier values

#Visualizing the Data
Means2 <- aggregate(WeightLoss~Diet, Diet, mean)
boxplot(WeightLoss~Diet,col=c(2,3,4,5),xlab="Diet",ylab="WeightLoss",main="Boxplots of WeightLoss vs Diet",las=1,cex.lab=1.5,cex.axis=1.5,cex.main=2.5)
points(1:4, Means2$WeightLoss, col = "White",pch=".",cex=3)    #The white points represents the mean of each group

#One-Way Anova Test
Anova <- aov(WeightLoss~Diet)
T3 <- summary(Anova)
T3[[1]]$"Pr(>F)">0.05   #We Reject the NUll Hypothesis since p value < 0.05 


#d)	Conduct Chi-square and Fisher's exact test on two variables. Explain the test?

#Chi-square of independence 

#For Gender and Smoke
table <- table(Gender,Smoke)
Chitest <- chisq.test(table)
Chitest$p.value > 0.05      #We accept the null hypothesis

#Fisher Test
fishtest <- fisher.test(table,conf.int = T,conf.level = 0.99)
fishtest$p.value>0.05       #We accept the null hypothesis

#e)	How to determine correlation and covariance in R? Give two examples with help of above data?

cor(LungCap,Age)    #By default it is taking pearson correlation
cor(LungCap,Height)
cor(Age,Height)

cor(LungData[,1:3]) #This in short gives the correlation matrix.

#To check it graphically
pairs(LungData[,1:3])   #We can a there is high amount o correlation between the three Variables.

cov(LungData[,1:3]) #This is the Covariance matrix.

#f)	Compare the linear model (single + multiple) for every set of data. How to check non-linear relationship?

#Linear Model
SingleModel <- lm(LungCap~Age)  #single
MultipleModel <- lm(LungCap~Age+Gender+Smoke+Height)  #Multiple
#The Multiple Model is better than the Single it is explained in question i)

#Non Linear Model
NONMultiple <- lm(LungDataNON$LungCap~LungDataNON$Age+I(LungDataNON$Age^2))
plot(NONMultiple)   #Just go to the Console and hit Enter to get the plots


#g)	How to change a numeric variable to categorical variable? How to include categorical variables or factors in a linear regression model? 

L <- LETTERS[1:6]
CatH <- cut(Height, breaks = c(0,50,55,60,65,70,100), labels =L, right = F)
Height[1:10]
CatH[1:10]
#to include categorical variable in linear regression
lm(LungCap~Age+Smoke+Gender)


#h)	How to include categorical or qualitative variables(also known as factors) in a regression model using dummy or indicator variables? Explain with an example (use dataset).
#I have already created the CatH

dummylm <- lm(LungCap~CatH)

MD <- list(mean(LungCap[CatH=="A"]),mean(LungCap[CatH=="B"]),mean(LungCap[CatH=="C"]),mean(LungCap[CatH=="D"]),mean(LungCap[CatH=="E"]),mean(LungCap[CatH=="F"]))
sapply(MD, function(x) x)

dummylm$coefficients


#i)	What do you mean by residual sum of squares (RSS)? What is the significance of its (RSS) value with respect to selecting a variable in a linear regression model? Explain with an example.
#Linear Data LungCapData
#This model contains all variables
Model1 <- lm(LungCap~Age+Gender+Smoke+Height)
#This model contains one variable less
Model2 <- lm(LungCap~Age+Gender+Smoke)
#Calling Summary
summary(Model1)
summary(Model2)
#looking at R-squared error and residual Standard error of both model you
#will find much significant change
#lets do anova
T4 <- anova(Model1,Model2)
T4$`Pr(>F)`<0.05  #We accept the alternative hypothesis and conclude the Model1 is better than Model2
#We can see the RSS of model1 in T4 is very less than model 2

#Non Linear Data LungCapData2
#What are model1 and model 2 is explained on the doc file
#This model contains all variables
NONModel1 <- lm(LungDataNON$LungCap~LungDataNON$Age+I(LungDataNON$Age^2))
#This model contains one variable less
NONModel2 <- lm(LungDataNON$LungCap~LungDataNON$Age)

#calling summary
summary(NONModel1)
summary(NONModel2)
#looking at R-squared error and residual Standard error of both model you
#will not find much significant change
#lets do anova
T5 <- anova(NONModel1,NONModel2)  
T5$`Pr(>F)`<0.05  #We accept the alternative hypothesis and conclude the Model1 is better than Model2
#We can see the RSS of model1 in T5 is very less than model 2

