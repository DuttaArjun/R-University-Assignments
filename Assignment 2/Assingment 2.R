#Q-2

#Assignment 2

#Creating Database Columns
Name <- c("Arjun Dutta","Suhrid Guha","Arnabee Chakraborty","Madhubrata Dutta","Praveen Agarwal","Ashmita Chaki","Ishani Roy","Purusatyam Ganguly","Souradeep Bandhopadhya","Oyeshee Gupta","Madhulagna Paul","Amitangshu Das","Sukalpo Saha","Purbayan Chatterjee","Chandrima Sinha")
Roll <- 1:15
Sex <- c("Male","Male","Female","Male","Male","Female","Female","Male","Male","Female","Female","Male","Male","Male","Female")
Sex <- as.factor(Sex)
English <-sample(60:100,15)
Bengali <-sample(60:100,15)
Maths <-sample(60:100,15)
Statistics <-sample(60:100,15)
Total <- English+Bengali+Maths+Statistics

#Creating the Dataframe(Database)
DB <- data.frame(Name,Roll,Sex,English,Bengali,Maths,Statistics,Total,stringsAsFactors = F)
View(DB)
str(DB)

#The Average and Range of Marks the Female Students have obtained in Statistics

Female <- DB[DB$Sex=="Female",]   #Separting the Females from Males and storing t inside an object
mean(Female$Statistics)         
range(Female$Statistics)        #Here the range only gives the min and max values

max(Female$Statistics)-min(Female$Statistics)   #The actual formula of Range
