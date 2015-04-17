#Runs logistic regression classification in R
#Called by logistic_regression bash script

library(rms)

model<-lrm(dx~.,data=data[,1:27], x=TRUE,y=TRUE) #Initial model estimate. This estimate is based on PCs. The first 27 were chosen because each explains >1% of the variance. Will have to update this for non-PC variables & to be adaptable to PC inputs when a different number than 27 PCs explain >1% of the variance

validate(model,method=".632",B=40,bw=T,rule="aic",type="individual") #Validate logistic regression model using 40 rounds of bootstrapping, backward step-down variable deletion)


