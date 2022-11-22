

#1. Create a data frame using the table below.
# a.Write the codes.
Respondents <- c(seq(1,20))
Sex <- c(2,2,1,2,2,2,2,2,2,2,1,2,2,2,2,2,2,2,1,2)
Fathers_Occupation <- c(1,3,3,3,1,2,3,1,1,1,3,2,1,3,3,1,3,1,2,1)
Persons_at_home <- c(5,7,3,8,5,9,6,7,8,4,7,5,4,7,8,8,3,11,7,6) 
Siblings_at_school <- c(6,4,4,1,2,1,5,3,1,2,3,2,5,5,2,1,2,5,3,2)
Types_of_houses <- c(1,2,3,1,1,3,3,1,2,3,2,3,2,2,3,3,3,3,3,2)

frame1 <- data.frame(Respondents,Sex,Fathers_Occupation,Persons_at_home,Siblings_at_school,Types_of_houses)
frame1
#b.Describe the data. Get the structure or the summary of the data

summary(frame1)


#c. Is the mean number of siblings attending is 5?

# Answer: No 
#Mean is 2.3


#d. Extract the 1st two rows and then all the columns using the subsetting functions.
#Write the codes and its output.

set1<- subset(dframe[1:2, 1:6, drop = FALSE])
set1

#e. Extract 3rd and 5th row with 2nd and 4th column. Write the codes and its
#result.
set2 <- subset(dframe[c(3,5),c(2,4)])
set2
#f. Select the variable types of houses then store the vector that results as types_houses.
#Write the codes.
set3<- subset(dframe[c(1:20), c(2,6)])

type_houses <- set3


#g. Select only all Males respondent that their father occupation was farmer. Write
#the codes and its output.



set4<- subset(dframe[c(1:20), c(2,3)])


male <- set4[dframe$FathersOccupation == '1',]
male

#h. Select only all females respondent that have greater than or equal to 5 number
#of siblings attending school. Write the codes and its outputs
set5 <- subset(dframe[c(1:20), c(2,5)])
female <- set5[dframe$Siblingsatschool == '1',]

#2. Write a R program to create an empty data frame. Using the following codes:
  df = data.frame(Ints=integer(),
                  Doubles=double(), Characters=character(),
                  Logicals=logical(),
                  Factors=factor(),
                  stringsAsFactors=FALSE)
print("Structure of the empty dataframe:")
print(str(df))

#The result indicates an empty data frame that has a five variables however it doesn't have value

#3. Interpret the graph.
#for the month of July year 2020 the negative sentiments has a higher tweets



