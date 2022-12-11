


library(Hmisc)
library(pastecs)


#1. Create a data frame for the table below 

Student <- seq(1:10)
PreTest <- c(55,54,47,57,51,61,57,54,63,58)
PostTest <- c(61,60,56,63,56,63,59,56,62,61)

a <- data.frame(Student,PreTest,PostTest)
a

#a. Compute the descriptive statistics using different packages (Hmisc and pastecs).
#Write the codes and its result.

describe(a)

stat.desc(a)

#2. The Department of Agriculture was studying the effects of several levels of a
#fertilizer on the growth of a plant. For some analyses, it might be useful to convert
#the fertilizer levels to an ordered factor.
#The data were 10,10,10, 20,20,50,10,20,10,50,20,50,20,10.

Fertilizer_Levels <- c(10,10,10,20,20,50,10,
                             20,10,50,20,50,20,10)



#a. Write the codes and describe the result.
order <- factor(Fertilizer_Levels, ordered = TRUE)
order

#3. Abdul Hassan, president of Floor Coverings Unlimited, has asked you to study
#the exercise levels undertaken by 10 subjects were “l”, “n”, “n”, “i”, “l” ,
#“l”, “n”, “n”, “i”, “l” ; n=none, l=light, i=intense
Subjects <- c("l","n","n","i","l","l","n","n","i","l")

#a. What is the best way to represent this in R?
#Dataframe
Df <- data.frame(Subjects)
Df

#4.Sample of 30 tax accountants from all the states and territories of Australia and
#their individual state of origin is specified by a character vector of state mnemonics
#as:
  state <- c("tas", "sa", "qld", "nsw", "nsw", "nt", "wa", "wa", "qld",
             "vic", "nsw", "vic", "qld", "qld", "sa", "tas", "sa", "nt",
             "wa", "vic", "qld", "nsw", "nsw", "wa", "sa", "act", "nsw",
             "vic", "vic", "act")
state  
#a. Apply the factor function and factor level. Describe the results.
c <- factor(state)
c 

levels(c)
#5. From #4 - continuation:

#• Suppose we have the incomes of the same tax accountants in another vector (in
incomes <- c(60, 49, 40, 61, 64, 60, 59, 54,
             62, 69, 70, 42, 56, 61, 61, 61, 58, 51, 48,
             65, 49, 49, 41, 48, 52, 46, 59, 46, 58, 43)

#a. Calculate the sample mean income for each state we can now use the special
#function tapply():
meanincome <- tapply(incomes,state, mean )
meanincome
#b. Copy the results and interpret.
#     act      nsw       nt 
#44.50000 57.33333 55.50000 
    # qld       sa      tas 
#53.60000 55.00000 60.50000 
    # vic       wa 
#56.00000 52.25000 
#these are tge mean of income 

#6.Calculate the standard errors of the state income means (refer again to number 3)
stdError <- function(x) sqrt(var(x)/length(x))

#a. What is the standard error? Write the codes.
incomestdr <- tapply(incomes, state, stdError)
incomestdr
#b. Interpret the result.
#It tells the sample mean of income
#7. Use the titanic dataset.
data("Titanic")
titanic<- data.frame(Titanic)

#a. subset the titatic dataset of those who survived and not survived. Show the
#codes and its result.
Survives <- subset(Titanic, Survived == "Yes")
Survives

Died <- subset(Titanic, Survived == "No")
Died  

#8. The data sets are about the breast cancer Wisconsin. The samples arrive periodically as Dr. Wolberg reports his clinical cases. The database therefore reflects this
#chronological grouping of the data. You can create this dataset in Microsoft Excel.

#a. describe what is the dataset all about.
#The dataset s all about Breast Cancer.

#b. Import the data from MS Excel. Copy the codes.
getwd()
breastcancer<- read.csv(file = "Breast_Cancer.csv", sep = "",stringsAsFactors = F)
breastcancer
#c. Compute the descriptive statistics using different packages. Find the values of:
#c.1 Standard error of the mean for clump thickness.
num8c1.n <- length(breastcancer$`CL. thickness`)
num8c1.sd <- sd(breastcancer$`CL. thickness`)
num8c1.se <- num8c1.sd/sqrt (breastcancer$`CL. thickness`)
num8c1.se

#c.2 Coefficient of variability for Marginal Adhesion.
Marginal_Adhesion <- as.numeric(breastcancer$V5)
   stat.desc(Marginal_Adhesion)

#c.3 Number of null values of Bare Nuclei.
Bare_Nuclei <- as.numeric(breastcancer$V7)
   stat.desc( Bare_Nuclei)

#c.4 Mean and standard deviation for Bland Chromatin
Bland_Chromatin <- as.numeric(breastcancer$V8)

  mean(Bland_Chromatin , na.rm = TRUE) 
  sd(Bland_Chromatin , na.rm = TRUE)
  
  stat.desc( Bland_Chromatin)

#c.5 Confidence interval of the mean for Uniformity of Cell Shape
cell_shape <- as.numeric(breastcancer$V4)
 stat.desc(cell_shape )

#d. How many attributes?
#e. Find the percentage of respondents who are malignant. Interpret the results.
describe(breastcancer$V11, na.rm =TRUE)

#9. Export the data abalone to the Microsoft excel file. Copy the codes.

library("AppliedPredictiveModeling")
data("abalone")
head(abalone)
summary(abalone)

library(xlsx)
write.xlsx("abalone","/cloud/project/Worksheet7a/abalone.xlsx")
