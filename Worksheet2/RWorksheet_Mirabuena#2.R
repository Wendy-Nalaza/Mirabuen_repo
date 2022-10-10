#1.Create a vector using : operator
seq(from=-5, to=5)

#What will be the value of x?
x <- 1:7
x

#2.Create a vector using seq() function
seq(1, 3, by=0.2)

#3.	A factory has a census of its workers. There are 50 workers in total.
a <- c(34, 28, 22, 36, 27, 18, 52, 39, 42, 29, 35, 31, 27, 
       22, 37, 34, 19, 20, 57, 49, 50, 37, 46, 25, 17, 37, 43,
       53, 41, 51, 35, 24,33, 41, 53, 40, 18, 44, 38, 41, 48, 27, 
       39, 19, 30, 61, 54, 58, 26, 18)

a[3]
a[2]
a[4]
a[2:50]

# 4.Create a vector x <- c("first"=3, "second"=0, "third"=9)
x <- c("first"=3, "second"=0, "third"=9)
x[c("first", "third")]

#5.	Create a sequence x from -3:2.
x <- c(-3:2)
x[2] <- 0
x

#The following data shows the diesel fuel purchased by Mr. Cruz.
diesel <- data.frame(
  
  month =c("Jan", "Feb", "March", "Apr", "May", "June"),
  liter=c("52.50", "57.25",	"60.00",	"65.00",	"74.25",	"54.00"),
  purchase =c("25",	"30",	"40",	"50",	"10",	"45")
)
diesel    

#average fuel expenditure of Mr. Cruz from Jan to June
liter=c(52.50, 57.25,	60.00,	65.00,	74.25, 54.00)
purchase =c(25,	30,	40,	50,	10,	45)

weighted.mean(liter, purchase)

data <- c(length(rivers), sum(rivers), mean(rivers), median(rivers), var(rivers), sd(rivers), min(rivers), max(rivers))
data

#8
PowerRanking<- 1:25
CelebrityName = c("tom Cruise","Rolling  Stone", "Oprah Winfrey", "U2",
                  "Tiger Woods", "Steven Spielberg", "Howard stern", " 50 Cent", "Cast of the Sopranos", 
                  "Dan Brown", "Bruce Springteen","Donlad Trump","Muhammad Ali","Paul McCarty","George Lucas","Elton John","David letterman"," Phil Mickelson",
                  "J.K Rowling", "Brad Pitt", "Dr. Phil McGraw", "Jay Lenon","Celine Dion", "Kobe Brayant")
Pay<-c(67,90,225,110,90,332,302,41,52,88,55,44,55,40,
       233,34,40,47,75,25,39,45,32,40,31)
Ranking<-data.frame(Power_Ranking, Celebrity_Name, Pay)
Ranking

#b
PowerRanking[19] <-15
PowerRanking

Pay[19] <-90
Pay
Ranking <- data.frame(PowerRanking, CelebrityName,Pay) 
Ranking 
PowerRanking[19] <- 15
PowerRanking

Pay [19] <-90
Pay






