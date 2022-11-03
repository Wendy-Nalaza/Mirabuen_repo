# use data(iris)
data("iris")
iris

#Subset the iris into 3 files per Species 
subset(iris, Species == "setosa")

#Get the total mean of each species 

meanSepal_L <- iris$Sepal.Length[1:50]
meanSepal_W <- iris$Sepal.Width[1:50]
meanPetal_L <- iris$Petal.Length[1:50]
meanPetal_W <- iris$Petal.Width[1:50]

meanSepal_L
meanSepal_W
meanPetal_L
meanPetal_W

#Get the total mean for each species 
totalmean <- c(meanSepal_W,meanSepal_L,meanPetal_L,meanPetal_W)
totalmean
mean(totalmean)


#Get the mean of each characteristic of the species 
mean(meanSepal_L)
mean(meanSepal_W)
mean(meanPetal_L)
mean(meanPetal_W)
