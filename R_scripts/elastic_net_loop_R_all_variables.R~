best.lambda <- rep(NA,21)
optimal.nr <- rep(NA,21)
optimal.dev <- rep(NA,21)
options(warn=1)

set.seed(100)
alpha <- seq(0,1,0.05)

for (i in  1:21){
              print(paste(i,":","alpha=",alpha[i]))
              try(cv.model <- cv.glmnet(matrix_thickness_over_17[train_indices,], dx_train,family="binomial",alpha=alpha[i],nfolds=10,type.measure="deviance"))
              cv.lambda <- cv.model$lambda
              dev.array <- as.array(cv.model$cvm)
              ncoeff.array <- as.array(cv.model$nzero)
              best.lambda[i] <- cv.model$lambda.1se
              optimal.nr[i] <-ncoeff.array[cv.lambda==best.lambda[i]]
              optimal.dev[i] <- dev.array[cv.lambda==best.lambda[i]]
              }
options(warn=0)    #Reset warning-handling to default
