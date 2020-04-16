api_key <- 'Whi6JuY5Q3TT48X7GXAjdcuqU'
api_secret <- 'm768FKRkdDBLnjGAIoIlH3RfkygDMMY5tu4mRvgcxZB99ux8uR'
access_token <- '1144509535157198849-kMNSAMajq7djO7bPaYfhBoGPzu47nH'
access_token_secret <- '3EmrfbnbvooSVBN0baoPmW1NYjVdvrGadLFFYJb4bPxsV'

#Loading twitteR library
library(twitteR)

#Setting up the account
setup_twitter_oauth(api_key, api_secret, access_token, access_token_secret)

#Getting tweets data
tweets <- searchTwitter('#Covid19', n=1000, lang = 'en')
tweetsdf <- twListToDF(tweets)
write.csv(tweetsdf, file = 'covid.csv', row.names = F)
trend <- availableTrendLocations()
head(trend)
world <- getTrends(1)
rm(tweets)
rm(tweetsdf)
rm(trend)
rm(world)
library("rmarkdown")

install.packages("quanteda")
library(quanteda)
ncorpus <- iconv(tweets_df$text, to = "UTF-8")
ncorpus <- Corpus(VectorSource(ncorpus))
inspect(ncorpus[1:3])
ncorpus <- dfm(ncorpus, verbose = TRUE, toLower = TRUE, removeNumbers = TRUE,
               removePunct = TRUE, removeSeparators = TRUE, removeTwitter = FALSE,
               stem = FALSE, ignoredFeatures = NULL, keptFeatures = NULL, 
               language = "english", thesaurus = NULL, dictionary = NULL, 
               valuetype = c("glob", "regex", "fixed"), ...)
??dfm
?quanteda