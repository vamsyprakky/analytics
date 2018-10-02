#practice Exercise

#create a 100 row DF with following vriables 
# gender, spl, age, experiemce, grade, placement

gender= sample(c('M','F'),100, T,)
spl= sample(c('HR','Finance','Marketing'),100, T,)
age= sample(c(21:30),100, T,)
experience = floor(rnorm(100,mean = 3, sd=1))
grade= sample(c('A','B','C','D'),100,T)
placement= sample(c('Yes','No'),100, T,)

students= data.frame(gender,spl, age, experience, grade, placement, stringsAsFactors = T)
str(students)

students$gender=as.character(students$gender)#convert into character from factor
str(students)

#converting into relavant factors

students$gender = factor(students$gender)#convert into factor
str(students)

library('dplyr')

students %>% filter(spl=='HR' | spl=='Marketing')  %>% group_by(spl,gender) %>% arrange((experience))%>% summarise(max(experience))


#Plots----

hist(students$age)

par(mfcol=c(2,2))

pie(table(students$placement))
pie(table(students$age))
pie(table(students$gender))
pie(table(students$spl))

par(mfcol=c(1,1))

table(students$gender, students$placement, students$spl)

#writing into file----

write.csv(students,'./data/students_sample.csv')

#clustering----

km3= kmeans(students[, c('age','experience')], centers = 3)
km3
km3$cluster
plot(students[, c('age','experience')], col=km3$cluster)


#decision tree----

library(rpart)
library(rpart.plot)

tree_stu=rpart(placement ~. , data=students)
tree_stu
rpart.plot(tree_stu, nn=T, cex=.8)

rpart.plot(prune(tree_stu, cp=0.04), nn=T, cex=.8)

printcp(tree_stu)

ndata= sample_n(students, 5)
ndata
predict(tree_stu, newdata= ndata, type='class')
predict(tree_stu, newdata= ndata, type='prob')
predict(tree_stu, newdata= ndata, type='vector')


#logistic regression----

library('olsrr')

#Linear regression is not possible because the placement is non numeric variable only logistic model is possible

library(caTools)
fit_stu = glm(placement ~ .,family = 'binomial', data=students);summary(fit_stu)#placement with all variables


fit_stu1 = glm(placement ~ age,family = 'binomial', data=students);summary(fit_stu1)#reference level would be the base level and the subsequent levels would be for example Grade A is base and Grade B,C,D would be the next level so only  B,C,D will be seen

fit_stu2 = glm(placement ~ spl,family = 'binomial', data=students);summary(fit_stu2)
