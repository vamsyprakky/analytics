grades=sample(c('A','B','C','D'),30,replace=T,prob =c(.4,.2,.3,.1) )
grades
summary(grades)
grades=factor(grades)#convert grades into values
grades
plot(grades)
summary(grades)
class(grades)
grades=factor(grades,ordered = T);grades
grades=factor(grades,ordered = T,levels = c('B','C','A','D'));grades

marks = ceiling(rnorm(30, mean = 60, sd = 5))
(student1 = data.frame(marks, grades))
boxplot(marks ~ grades,data = student1)#~ means marks with respect to grades

boxplot(marks)

summary(marks)
abline(h=summary(marks))
gender1=factor(sample(c('M','F'),size=30,replace=T,),)
gender1

(student1 = data.frame(marks, grades,gender1))
boxplot(marks ~ grades+gender1,data = student1)


