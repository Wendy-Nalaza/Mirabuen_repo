library(twitteR)
library (dplyr)
library(magrittr)
library(ggplot2)
library(tidytext)
library(rtweet)
library(tm)
library(slam)
library(wordcloud2)
library(RColorBrewer)
library(corpus)


consumerKey <- "tEYaTlH2VrTa8olD4ujT7qO1T"
consumerSecret <- "xVOh76nCTDe67WjfauDTOP2xUh5s2svcff1VxMn6EAucModdK3"
accessToken <- "1595027326198484994-Zu27ZwmJEQJ4qst6NBzbobwHBM1kaz"
accessSecret <- "jxE261Yt5qagqtUvgjS2L9TNFZIjG2asXVMCpTgDLsk7a"

setup_twitter_oauth(consumer_key = consumerKey,
consumer_secret = consumerSecret,
access_token = accessToken,
access_secret = accessSecret)

#Extract from twitter using your developer's credentials. Choose any keyword you want. 
#Get 10000 observations "excluding retweets.
trendTweets <- searchTwitter("EXO -filter:retweets",
n = 10000,
lang = "en",
since = "2022-11-19",
until = "2022-11-28",
retryOnRateLimit=120)

#Converting into dataframe
trendTweetsDF <- twListToDF(trendTweets)
class(trendTweetsDF)
names(trendTweetsDF)
head(trendTweetsDF)[1:5]
head(trendTweetsDF$text)[1:5]


save(trendTweetsDF,file = "trendTweetsDF.Rdata")
load(file = "trendTweetsDF.Rdata")

#subset
tweetsDF <- trendTweetsDF %>%
  select(screenName,text,created,statusSource)

#Plot the time series from the date created. with legends. 
tweetsDF %<>% 
mutate(Created_At_Round = created%>% 
       round(units = 'hours') %>%
   
      
          as.POSIXct())
 

tweetsDF %>%  
  group_by(1) %>%  
  summarise(max = max(created), min = min(created))

tweetsDF %>% pull(created) %>% min()
tweetsDF %>% pull(created) %>% max()

ggplot(data = tweetsDF, aes(x = created), fill = tweetsDF) +
  geom_histogram(aes(fill = ..count..)) + 
  theme(legend.position="right",
         axis.title.x = element_blank(),
         axis.text.x = element_text(angle = 45, hjust = 1)) +
  xlab("Time") + ylab("Number of tweets") + 
  scale_fill_gradient(low = "lightpink", high = "magenta")

  

#Plot a graph (any graph you want)  based on the type of device - found in Source - that the user use. Include the legends.
  encodeSource <- function(x) {
  if(grepl(">Twitter for iPhone</a>", x)){
    "iphone"
  }else if(grepl(">Twitter for iPad</a>", x)){
    "ipad"
  }else if(grepl(">Twitter for Android</a>", x)){
    "android"
  }else {
    "others"
  }
}

  
 tweetsDF$tweetSource = sapply(tweetsDF$statusSource,encodeSource)
tweet_appSource <- tweetsDF %>% 
  select(tweetSource) %>%
  group_by(tweetSource) %>%
  summarize(count=n()) %>%
  arrange(desc(count)) 
 
 ggplot(tweetsDF[tweetsDF$tweetSource != 'others',], aes(tweetSource, fill = tweetSource)) +
  geom_bar() +
  theme(legend.position="right",
        axis.title.x = element_blank(),
        axis.text.x = element_text(angle = 45, hjust = 1)) +
  ylab("Number of tweets") +
  ggtitle("Tweets by Source")

  
#Create a wordcloud from the screenName
 tweet_appScreen <- tweetsDF %>%
  select(screenName) %>%
  group_by(screenName) %>%
  summarize(count=n()) %>%
  arrange(desc(count)) 

 wordcloud2(data=tweet_appScreen, 
           size=0.8, 
           color='random-light')

  

