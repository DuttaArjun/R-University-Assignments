#Assignment 1

#a

#Creating Database Columns
Name <- c("Arjun Dutta","Suhrid Guha","Arnabee Chakraborty","Madhubrata Dutta","Praveen Agarwal","Ashmita Chaki","Ishani Roy","Purusatyam Ganguly","Souradeep Bandhopadhya","Oyeshee Gupta")
Age <- c(24,26,23,23,24,25,23,24,23,24)
Roll <- 1:10
Sex <- c("Male","Male","Female","Male","Male","Female","Female","Male","Male","Female")
Sex <- as.factor(Sex)
Mobile <- c(9831264265,9874352029,9903971589,9831957892,NA,9831284956,9906571289,9845265469,9831080785,7986459068)

#Creating the Dataframe(Database)
DB <- data.frame(Name,Age,Roll,Sex,Mobile,stringsAsFactors = F)
View(DB)
str(DB)         #Structure of the Dataframe to check every coloumn has correct Data Types 
sapply(DB,class)#class of Object

#(i) Complete Part of the Database (The Whole Database excluding the Missing Value)
DB[complete.cases(DB),]

#(ii) Incomplete Part of the Database(The Missing Value)
DB[!complete.cases(DB),]                

#(iii) Creating another database(DB1) omiting the incomplete tuple
DB1 <- na.omit(DB)
View(DB1)


#b
#Creating another Database Column(District)
District <- factor(c("Kolkata","Howrah","North 24 Parganas","South 24 Parganas","Kolkata","South 24 Parganas","Howrah","Kolkata","Howrah","Kolkata"),levels = c("Kolkata","Howrah","North 24 Parganas","South 24 Parganas"))
DB$District <- District
View(DB)
str(DB)
sapply(DB,class)#class of Object

#(i)
DB[DB$District=="Kolkata",]     #Returns those rows who are from Kolkata
sum(DB$District=="Kolkata")     #Counts how many of them from Kolkata

DB[DB$District=="Howrah",]     #Returns those rows who are from Howrah
sum(DB$District=="Howrah")     #Counts how many of them from Howrah

DB[DB$District=="North 24 Parganas",]     #Returns those rows who are from North 24 Parganas
sum(DB$District=="North 24 Parganas")     #Counts how many of them from North 24 Parganas

DB[DB$District=="South 24 Parganas",]     #Returns those rows who are from South 24 Parganas
sum(DB$District=="South 24 Parganas")     #Counts how many of them from South 24 Parganas

#(ii)
DB[DB$District=="Kolkata"&DB$Sex=="Male",]  #Returns those rows who are from Kolkata and Male
sum(DB$District=="Kolkata"&DB$Sex=="Male")  #Counts them

DB[DB$District=="Kolkata"&DB$Sex=="Female",]  #Returns those rows who are from Kolkata and Female
sum(DB$District=="Kolkata"&DB$Sex=="Female")  #Counts them

DB[DB$District=="Howrah"&DB$Sex=="Male",]  #Returns those rows who are from Howrah and Male
sum(DB$District=="Howrah"&DB$Sex=="Male")  #Counts them

DB[DB$District=="Howrah"&DB$Sex=="Female",]#Returns those rows who are from Howrah and Female
sum(DB$District=="Howrah"&DB$Sex=="Female")#Counts them

DB[DB$District=="North 24 Parganas"&DB$Sex=="Male",]  #Returns those rows who are from North 24 Parganas and Male
sum(DB$District=="North 24 Parganas"&DB$Sex=="Male")  #Counts them

DB[DB$District=="North 24 Parganas"&DB$Sex=="Female",]#Returns those rows who are from Kolkata and Female
sum(DB$District=="North 24 Parganas"&DB$Sex=="Female")#Counts them

DB[DB$District=="South 24 Parganas"&DB$Sex=="Male",]  #Returns those rows who are from Kolkata and Male
sum(DB$District=="South 24 Parganas"&DB$Sex=="Male")  #Counts them

DB[DB$District=="South 24 Parganas"&DB$Sex=="Female",]#Returns those rows who are from Kolkata and Female
sum(DB$District=="South 24 Parganas"&DB$Sex=="Female")#Counts them

