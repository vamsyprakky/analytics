# Data Structures in R

#Vectors----
x=1:10 #create a sequence of nos from 1 to 10
x
x1<- 1:20
x1
(x1=1:30)
(x2=c(1,2,13,4,5))
class(x2)
(x3=letters[1:10])
class(x3)
LETTERS[1:26]
(x3b= c('a',"Dhiraj","4"))
class(x3b)
(x4=c(T,FALSE,TRUE,T,F))
class(x4)

x5=c(3L,5L)
x5
class(x5)

(x5b =c(1, 'a',T,4L))
class(x5b)

(x5c=c(1,3,TRUE))
class(x5c)


rm(x6)

# access elements

(x6=seq(0,100,by=3))
?seq#help function
methods(class='numeric')
ls()
x6
x6[20]
x6[3]
x6[c(2,4)]

x6[0]


x6[-1]#removes the 1 element

x6[-2]#removes the particular element(2nd element)

x5b[0]# another way to know the class

x6[-c(1,5,20)]

x6[-(length(x6)-1)]

x7=c(x6,x2)#combining arrays
x7
?sort
sort(x7,T)#decreasing
x7
sort(x7,F)#increasing

rev(x7)
x7


seq(-3,10, by=.2)

x7[length(x7)-2] <- 14 #modify
x7

(x=-3:2)
x[2] <-10 #modify 2nd element
x

x<0


x[x<=1 & x>=-1] = 100;
x

x=x[1:4];x#truncating the vector ....operation and printing in single sheet 


#delete vector
(x=seq(1,5, length.out = 15))#1 to 5 has been divided into 15 parts
x

x=NULL

(x= rnorm(1000, mean = 50, sd=5))#normal distribution
plot(density(x))#graph is plotted
mean(x)

abline(v=mean(x))#mean line gets plotted in the graph

#Matrices----

100:111
(m1 = matrix(1:12, nrow = 4))
(m2 = matrix(1:12, ncol = 3, byrow = T))#
class(m1)
attributes(m1)#displayes all the attribure of matrix including dimensions

dim(m1)# displays only dimensions

#access elements of matrix

m1[1,2:3]# displays the row and columns of the desired output in this case row 1 column 2 and 3
m1

m1[c(1,3),]
m1[,c(1:3)]

paste("C","D",sep="-")
paste("C",1:100, sep = "-")

(colnames(m1) =paste('C',1:3, sep='-'))
(rownames(m1) =paste('R',1:4, sep='-'))
m1
m1[1:5]#first five elements are displayed


m2[m2 > 5]# all elements greater than 5

m2[m2>5 & m2<10] # multiple conditions to display'
m2

m2[c(TRUE,F,T,F), c(F,T,T)]# the rows and columns that are true are printed


m2[2,2] = 10 # modifiying matrix elements
m2  

rbind(m2, c(50,60,70))# adding a row ..only temporary unless it is assigned back to m2, the host m2 is not changed
m2

cbind(m2, c(55,65,75,85))# adding a column

m1
colSums(m1); rowSums(m1)
colMeans(m1); colMeans(m1)

m1
t(m1)#transpose m1 and it is temporary


m1
sweep(m1, MARGIN = 1, STATS = c(2,3,4,5), FUN="+" )#row wise
sweep(m1, MARGIN = 2, STATS = c(2,3,4), FUN="*" )#col wise
?sweep

#addmargins
m1
addmargins(m1, margin=1 ,sum) #col wise function

addmargins(m1,1,sd)

addmargins(m1,2,mean)
addmargins(m1,c(1,2), mean) #row & col wise function


#arrays----

#Data Frame----

#DataFrame----

#create Vectors to be combined into DF
(rollno = 1:30)
(sname = paste('student',1:30,sep=''))#student1 to student30
(gender = sample(c('M','F'), size=30, replace=T, prob=c(.7,.3)))#probabilities of c, size is num of elements and replace is True when we have to repeat the values in 'c'
summary(gender)
(marks = floor(rnorm(30,mean= 50,sd=10)))
(marks2 = ceiling(rnorm(30,40,5)))
(course = sample(c('BBA','MBA'), size=30, replace=T, prob=c(.5,.5)))
rollno; sname; gender
marks ; marks2; course

table(gender)

set.seed(1234)#system generates the same random variable when this is used before the generation
(gender = sample(c('M','F'), size=30, replace=T, prob=c(.7,.3)))
table(gender)


#create DF
df1= data.frame(rollno, sname, gender, marks, marks2, course, stringsAsFactors = F)
str(df1) #structure of DF
head(df1) #top 6 rows
head(df1,n=3) #top 3 rows
tail(df1) #last 6 rows
class(df1) # DF
summary(df1) #summary
df1$gender = factor(df1$gender)
df1$course = factor(df1$course)
str(df1)
summary(df1)


df1  #full data
df1$gender  # one column
df1[ , c(2,4)] #multiple columns
df1[1:10 ,] #select rows, all columns
#as per conditionis
df1[ marks > 50 & gender=='F', c('rollno', 'sname','gender', 'marks')]
df1[ marks > 50 & gender=='F', c(1,2)]
df1[ marks > 50 | gender=='F', ]


names(df1)  # names of columns
dim(df1)  #Dimensions

aggregate(df1$marks, by=list(df1$gender), FUN=max)
aggregate(df1$marks ~ df1$gender, FUN=max)


(df2 = aggregate(cbind(marks,marks2) ~ gender + course, data=df1, FUN=mean))

#lists----
