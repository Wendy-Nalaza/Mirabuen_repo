
library(dplyr)
library(ggplot2)
library(tidyverse)
data(mpg)


#1How many columns are in mpg dataset? How about the number of rows? Show the
#codes and its result.
nrow(mpg)
ncol(mpg)
#row 234
#colums11

#2.Which manufacturer has the most models in this data set? Which model has the most
#variations? Ans:
#most models = dodge 34
model <- mpg %>% 
  count(manufacturer, sort = TRUE)


#most unique "a4"
unique(mpg$model)

#a. Group the manufacturers and find the unique models. Copy the codes and result.

datampg <- mpg
datax <- datampg %>% group_by(manufacturer, model) %>%
  distinct() %>% count()
datax
colnames(datax) <- c("Manufacturer", "Model","Counts")
datax

#b. Graph the result by using plot() and ggplot(). Write the codes and its result.
qplot(model, data = mpg,geom = "bar", fill=manufacturer)

ggplot(mpg, aes(model, manufacturer)) + geom_point()


#3. Same dataset will be used. You are going to show the relationship of the modeland
#the manufacturer.
datampg <- mpg
data2 <- datampg %>% group_by(manufacturer, model) %>%
  distinct() %>% count()
data2

colnames(data2) <- c("Manufacturer", "Model")
data2

#a. What does ggplot(mpg, aes(model, manufacturer)) + geom_point() show?
ggplot(mpg, aes(model, manufacturer)) + geom_point()
# It shows the model scater plot of the dataset

#b. For you, is it useful? If not, how could you modify the data to make it more
#informative?
#Yes it is useful it can be use to identify the different variation of data.
  
#4. Using the pipe (%>%), group the model and get the number of cars per model. Show
#codes and its result.
data3 <- datax%>% group_by(Model) %>% count()
data3

#a. Plot using the geom_bar() + coord_flip() just like what is shown below. Show
#codes and its result.
qplot(model,
      data = mpg,main = "Number of Cars per Model", 
      xlab = "Model",
      ylab = "Number of Cars", 
      geom = "bar", fill = manufacturer) 
 coord_flip()
 
# b. Use only the top 20 observations. Show code and results.
 head(mpg,n=20)
 
 

 #5. Plot the relationship between cyl - number of cylinders and displ - 
 #engine displacement using geom_point with aesthetic colour = engine displacement.
 #Title should be “Relationship  between No. of Cylinders and Engine Displacement”.
 #a. Show the codes and its result.
 
 ggplot(data = mpg , mapping = aes(x = displ, y = cyl, 
    main = "Relationship between No of Cylinders and Engine Displacement")) + 
 geom_point(mapping=aes(colour = "engine displacement")) + geom_jitter()
 
#b. How would you describe its relationship?
 #Using the geometric point it shows the engine displacement with legend that is color
 #pink 
 
 
 #6. Get the total number of observations for drv - type of drive train (f = front-wheel drive,
 #r = rear wheel drive, 4 = 4wd) and class - type of class (Example: suv, 2seater, etc.).
 #Plot using the geom_tile() where the number of observations for class be used as a
 #fill for aesthetics.
 
 #a. Show the codes and its result for the narrative in #6.
 ggplot(data = mpg, mapping = aes(x = drv, y = class)) + 
   geom_point(mapping=aes(color=class)) +
   geom_tile()
     
 #b. Interpret the result.
 #These tiles represent unobserved combinations of class and drv values.
 
 #7. Discuss the difference between these codes. Its outputs for each are shown below.
 #• Code #1
 ggplot(data = mpg) +
   geom_point(mapping = aes(x = displ, y = hwy, colour = "blue"))
 
 # Code #2
 ggplot(data = mpg) +
   geom_point(mapping = aes(x = displ, y = hwy), colour = "blue")
#The first code shows pink even the color is blue because The mapping argument, which is a mapping between a variable and a value, 
 #has the argumentcolor = "blue," which is handled as an aesthetic as a result.
 #8. Try to run the command ?mpg. What is the result of this command?
   
   # It shows the cars dataset
 #a. Which variables from mpg dataset are categorical?
   #Categorical variables in mpg which include: 
   #the manufacturer, model, trans (type of transmission), 
   #drv (front-wheel drive, rear-wheel, 4wd), fl (fuel type),
   #and class (type of car).
   
   #b. Which are continuous variables?
   #The variable cty , city highway miles per gallon, is a continuous variable
   ggplot(mpg, aes(x = displ, y = hwy, colour = cty)) +
     geom_point()
 
   #c. Plot the relationship between displ (engine displacement) and hwy(highway miles
  #per gallon). Mapped it with a continuous variable you have identified in #5-b.
#What is itsresult? Why it produced such output?
   ggplot(mpg, aes(x = displ, y = hwy, colour = cty)) + geom_point()
   
#9. Plot the relationship between displ (engine displacement) and hwy(highway miles
 #per gallon) using geom_point(). Add a trend line over the existing plot using
#geom_smooth() with se = FALSE. Default method is “loess”.
   ggplot(data = mpg, mapping = aes(x = displ, y = hwy)) +
     geom_point(mapping=aes(color=class)) +
     geom_smooth(se = FALSE)
 
#10. Using the relationship of displ and hwy, add a trend line over existing plot. Set the
#se = FALSE to remove the confidence interval and method = lm to check for linear
#modeling  
   ggplot(data = mpg, mapping = aes(x = displ, y = hwy, color = class)) + 
     geom_point() +
     geom_smooth(se = FALSE)
   
 
  
