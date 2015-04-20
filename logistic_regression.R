#Runs logistic regression classification in R
#Called by logistic_regression bash script

#Load rms and RMINC libraries
library(rms)
library (RMINC)

R_DEBUG_mincIO=FALSE #Have to set this for mincIO command to work, for some reason

for (dir in GM WM CSF) {
	#Read in volumes using mincIO.readVolume (part of RMINC library)
	datafiles_2<-lapply(sys.glob("dir_dwnsampld_2/*"),mincIO.readVolume,volumeType="anatomical") 
	datafiles_4<-lapply(sys.glob("dir_dwnsampld_4/*"),mincIO.readVolume,volumeType="anatomical") 

	#Initialize matrices
	dir_2<-matrix(,nrow=length(datafiles_2),ncol=dim(datafiles_2[[1]])[1]*dim(datafiles_2[[1]])[2]*dim(datafiles_2[[1]])[3])
	dir_4<-matrix(,nrow=length(datafiles_4),ncol=dim(datafiles_4[[1]])[1]*dim(datafiles_4[[1]])[2]*dim(datafiles_4[[1]])[3])

	#Read list into a vector for each subect and store in initialized matrices
	for (i in 1:length(datafiles_2){
		dir_2[i,]<-as.vector(datafiles_2[[i]])
		dir_4[i,]<-as.vector(datafiles_4[[i]])
	}
}

model<-lrm(dx~.,data=data[,1:27], x=TRUE,y=TRUE) #Initial model estimate. This estimate is based on PCs. The first 27 were chosen because each explains >1% of the variance. Will have to update this for non-PC variables & to be adaptable to PC inputs when a different number than 27 PCs explain >1% of the variance

validate(model,method=".632",B=40,bw=T,rule="aic",type="individual") #Validate logistic regression model using 40 rounds of bootstrapping, backward step-down variable deletion)


