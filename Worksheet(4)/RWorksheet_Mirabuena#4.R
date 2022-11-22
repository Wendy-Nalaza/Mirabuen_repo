#1. The table below shows the data about shoe size and height. Create a data frame..
Shoe_size <- c(6.6,9.0,8.5,8.5,10.5,7.0,9.5,9.0,13.0,7.5,10.5,8.5,12.0,10.5)
Height <- c(66.0,68.0,64.5,65.0,70.0,64.0,70.0,71.0,72.0,64.0,74.5,67.0,71.0,71.0)
Gender <- c("F","F","F","F","M","F","F","F","M","F","M","F","M","M")
Shoe_size <- c(13.0,11.5,8.5,5.0,10.0,6.5,7.5,8.5,10.5,8.5,10.5,11.0,9.0,13.0)
Height <- c(77.0, 72.0, 59.0, 62.0, 72.0, 66.0, 64.0, 67.0,73.0, 69.0, 72.0, 70.0, 69.0, 70.0)
Gender <- c("M" ,"M", "F", "F", "M", "F", "F", "M", "M", "F", "M", "M", "M", "M")

data1<- data.frame(Shoe_size,Height,Gender,Shoe_size,Height,Gender) 
data1

#a. Describe the data.
#The data shows the gender and the shoe size however the shoe size vary on gender 
#if the it is female the smaller the shoe size.


#b. Find the mean of shoe size and height of the respondents.
#Copy the codes and results.
mean(Shoe_size)
mean(Height)

#c. Is there a relationship between shoe size and height? Why
 # As I evaluate there is a relationship between shoe size and height the
#higher the height the bigger shoe size

#2. Construct character vector months to a factor with factor() and assign the result to
#factor_months_vector. Print out factor_months_vector and assert that R prints out
#the factor levels below the actual values.
 months <-c("March","April","January","November","January",
            "September","October","September","November","August",
            "January","November","November","February","May","August",
            "July","December","August","August","September","November","February","April")
 months
 
 factor_months_vector <- factor(months)
 factor_months_vector 

 #3. Then check the summary() of the months_vector and factor_months_vector. |
   #Interpret the results of both vectors. Are they both equally useful in this case?
  summary( factor_months_vector)
  summary(months)

  #4. Create a vector and factor for the table below.
  
  Directions<- c("East","West","North")
  Frequency <- c (1, 4, 3)
  
   
  factor ( Directions)
  factor(Frequency)
  
  new_order_data <- factor(new_order_data,levels = c("East","West","North"))
  print(new_order_data)
 
   #5. Enter the data below in Excel with file name = import_march.csv 
  
       
  
  #a. Import the excel file into the Environment Pane using read.table() function.
 #Write the code.
  readdata <- read.table("/cloud/project/Worksheet4/import_march.csv", header = TRUE, sep = ",")
  readdata
  
 # b. View the dataset. Write the code and its result.
  read.csv ("/cloud/project/Worksheet4/import_march.csv")




