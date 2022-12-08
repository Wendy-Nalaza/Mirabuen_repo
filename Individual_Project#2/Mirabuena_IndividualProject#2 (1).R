library(twitteR)
library (dplyr)
library(magrittr)
library(ggplot2)
library (plotly)
library(tidytext)
library(rtweet)
library(tm)
library(slam)


consumerKey <- "tEYaTlH2VrTa8olD4ujT7qO1T"
consumerSecret <- "xVOh76nCTDe67WjfauDTOP2xUh5s2svcff1VxMn6EAucModdK3"
accessToken <- "1595027326198484994-Zu27ZwmJEQJ4qst6NBzbobwHBM1kaz"
accessSecret <- "jxE261Yt5qagqtUvgjS2L9TNFZIjG2asXVMCpTgDLsk7a"

setup_twitter_oauth(consumer_key = consumerKey,
                    consumer_secret = consumerSecret,
                    access_token = accessToken,
                    access_secret = accessSecret)

#Extract 10000 tweets from Twitter using twitteR package including retweets.
trendTweets <- searchTwitter("EXO",
                             n = 10000,
                             lang = "en",
                             since = "2022-11-29",
                             until = "2022-12-03",
                             retryOnRateLimit=120)
trendTweets

#Converting into dataframe
trendTweetsDF <- twListToDF(trendTweets)

#Subset the retweets and the original tweets into a separate file
originalTweets <- subset(trendTweetsDF, isRetweet=="FALSE",
                        select= c(text,screenName,created, isRetweet))

originalTweets %>%  
  group_by(1) %>%  
  summarise(max = max(created), min = min(created))
    ekso <- originalTweets %>% mutate(Created_At_Round = created%>% 
           round(units = 'hours') %>%
           as.POSIXct())


minimum <- ekso %>% pull(created) %>% min()
minimum

maximum <- ekso %>% pull(created) %>% max()
maximum



#Retweets
retweets <- subset(trendTweetsDF, isRetweet=="TRUE",
                        select= c(text,screenName,created, isRetweet))

retweets %>%  
  group_by(1) %>%  
  summarise(max = max(created), min = min(created))
rt <- retweets %>% mutate(Created_At_Round = created%>% 
         round(units = 'hours') %>%
         as.POSIXct())
rt

mini <- rt %>% pull(created) %>% min()
mini
maxi <- rt %>% pull(created) %>% max()
maxi

#Plot the retweets and the original tweets using bar graph
#Include legends
orig <- ggplot(ekso, aes(x = Created_At_Round)) +
  geom_histogram(aes(fill = ..count..)) +
  theme(legend.position = "right") +
  xlab("Time") + ylab("Number of tweets") + 
  scale_fill_gradient(low = "pink", high = "magenta")

orig %>% ggplotly()

#retweets
rtweet <- ggplot(rt, aes(x = Created_At_Round)) +
  geom_histogram(aes(fill = ..count..)) +
  theme(legend.position = "right") +
  xlab("Time") + ylab("Number of tweets") + 
  scale_fill_gradient(low = "pink", high = "magenta")

rtweet %>% ggplotly()

```{r, include = FALSE}

```
