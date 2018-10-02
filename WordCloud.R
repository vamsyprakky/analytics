# library
install.packages('wordcloud2')
library(wordcloud2) 

# have a look to the example dataset
head(demoFreq)
str(demoFreq)
word_text=sample(c('Sahithi', 'barath', 'sarita','Surya','Vamsy','ritesh','rohith','CK','SVS'),1000,T, prob=(c(.15,.1,.1,.1,.15,.1,.1,.1,.1)))

sname = paste('s', 1:1000)
sname
sname=factor(sname)
sname_final=data.frame(sname,word_freq)
str(sname_final)
wordcloud2(sname_final, size=0.7, shape ='star')

word_freq=sample(c(1:100), 1000,T)
word_text=factor(word_text)
word_final=data.frame(word_text,word_freq)

wordcloud2(demoFreq, size=1, shape ='star')
wordcloud2(word_final, size=.3, shape ='circle')
?wordcloud2
head(word_final)
str(word_final)

# Install
install.packages("tm")  # for text mining
install.packages("SnowballC") # for text stemming
install.packages("wordcloud") # word-cloud generator 
install.packages("RColorBrewer") # color palettes
# Load
library("tm")
library("SnowballC")
library("wordcloud")
library("RColorBrewer")
text <- readLines(file.choose())
filePath <- "http://www.sthda.com/sthda/RDoc/example-files/martin-luther-king-i-have-a-dream-speech.txt"
text <- readLines(filePath)
docs <- Corpus(VectorSource(text))
inspect(docs)

toSpace <- content_transformer(function (x , pattern ) gsub(pattern, " ", x))
docs <- tm_map(docs, toSpace, "/")
docs <- tm_map(docs, toSpace, "@")
docs <- tm_map(docs, toSpace, "\\|")
# Convert the text to lower case
docs <- tm_map(docs, content_transformer(tolower))
# Remove numbers
docs <- tm_map(docs, removeNumbers)
# Remove english common stopwords
docs <- tm_map(docs, removeWords, stopwords("english"))
# Remove your own stop word
# specify your stopwords as a character vector
docs <- tm_map(docs, removeWords, c("blabla1", "blabla2")) 
# Remove punctuations
docs <- tm_map(docs, removePunctuation)
# Eliminate extra white spaces
docs <- tm_map(docs, stripWhitespace)
# Text stemming
# docs <- tm_map(docs, stemDocument)
dtm <- TermDocumentMatrix(docs)
m <- as.matrix(dtm)
v <- sort(rowSums(m),decreasing=TRUE)
d$freq
d$word

word_final$word_text
word_final$word_freq
d <- data.frame(word = names(v),freq=v)
head(d, 10)
set.seed(1234)
wordcloud(words = d$word, freq = d$freq, min.freq = 1,
          max.words=200, random.order=FALSE, rot.per=0.35, 
          colors=brewer.pal(8, "Dark2"))
str(d)
wordcloud2(sname_final, size=0.7, shape ='circle')
wordcloud2(d, size=0.7,shape = 'circle')
           
           #, backgroundColor = 'cyan')
           
           #figPath = "likee.jpg")
