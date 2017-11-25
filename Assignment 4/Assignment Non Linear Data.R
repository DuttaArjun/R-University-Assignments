#Assignment 4
rm(list=ls())   #cleans all objects from the enviroment
LungCapData2 <- read.csv("DATASET/LungCapData2.csv", header=T)
# and attach the data
attach(LungCapData2)
# ask for a summary of the data
summary(LungCapData2)

# make a plot of LungCap vs. Height
plot(Height, LungCap,xlab="Height",ylab="LungCap", main="Non-Linear Regression", las=1,cex.lab=1.5,cex.axis=1.5,cex.main=2.5)

# now, let's fit a linear regression
model1 <- lm(LungCap ~ Height)
summary(model1)
# and add the line to the plot...make it thick and blue...
abline(model1, lwd=5, col="Red")

model2 <- lm(LungCap ~ Height + I(Height^2))  #I(object) is Inhibit Interpretation
summary(model2)

# now, let's add this model to the plot, using a thick blue line
lines(smooth.spline(Height, predict(model2)), col="Blue", lwd=5)

# test if the model including Height^2 i signif. better than one without
# using the partial F-test
anova(model1, model2) #it is significant(we take model 2) that is we accept the  null hypothesis since p_value<0.05

# try fitting a model that includes Height^3 as well
model3 <- lm(LungCap ~ Height + I(Height^2) + I(Height^3))
summary(model3)

# now, let's add this model to the plot, using a thick dashed green line
lines(smooth.spline(Height, predict(model3)), col="green", lwd=5, lty=3)

# and, let's add a legend to clarify the lines
legend(46, 15, legend = c("model1: linear", "model2: poly x^2", "model3: poly x^2 + x^3"), 
       col=c("red", "blue", "green"), lty=c(1,1,3), lwd=3, bty="n", cex=0.9)

# let's test if the model with Height^3 is signif better than one without
anova(model2, model3) #It is not so significant(we take Model 2) that is we accept alternative hypothesis since p_value>0.05

