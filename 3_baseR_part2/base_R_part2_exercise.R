library(dplyr)
a <- 45
b <- "happy"
c<- 1:46

save.image(file = "exercise1_image.Rdata")
save(a,b,c, file = "exercise1.Rdata")

saveRDS(object= a, file = "exercise1_a.RDS")

rm(b)
ls()
rm(list=ls())
getwd()

load(file = "exercise1.Rdata")
###exercise 2 descriptive statistics
my_day2<- readRDS(file = "/project/obds/shared/resources/2_r/my_day2matrix.rds")
head(my_day2)
# add rowsum and row means to the current dataset
my_day2_new<- cbind(my_day2,rowsum=rowSums(my_day2),rowmeans=rowMeans(my_day2))
head(my_day2_new)
## calculate the row sum
my_day2_new2<- rbind(my_day2_new,c(colSums(my_day2),NA,NA),c(colMeans(my_day2),NA,NA))
head(my_day2_new2)
#load the tooth Growth data
data("ToothGrowth")
?ToothGrowth
summary(ToothGrowth)
colnames(ToothGrowth)
colMeans(ToothGrowth["len"])
min(ToothGrowth$len)
max(ToothGrowth$len)
# try to cacluate row sum and row means 
rowSums(ToothGrowth)
# cannot work sinc the factors are not numeric, one is factor
sum(ToothGrowth$len)
# anyNA in the dataset?
anyNA(ToothGrowth)
is.na(ToothGrowth)

##exercise 3 sorting 
data("airquality")
?airquality
dim(airquality)
colnames(airquality)
#sort airquality by Ozone
air_1<- airquality[order(airquality$Ozone),]
head(air_1)
#sort based on month and then temperature later  
air_2<- airquality[order(airquality$Month,airquality$Temp,decreasing = TRUE),]
head(air_2)
rownames(air_2)
write.table(air_2, file = "sorted_airquality_exercise.txt",sep = "\t")
## exercise 4 merging

buildings <- data.frame(location=c(1, 2, 3), name=c("b1", "b2", "b3"))
data <- data.frame(survey=c(1,1,1,2,2,2), location=c(1,2,3,2,3,1),
                   efficiency=c(51,64,70,71,80,58))
buildings
data
buildingStats<-merge(data,buildings, by="location")
buildingStats
##exercise 5 aggregate
air_month<- aggregate(airquality,by=list(airquality$Month),FUN = mean,  na.rm= TRUE )
air_month
data("Solar.R")
air_solar_month <- aggregate(airquality$Solar.R, by=list(month= airquality$Month),FUN = mean,  na.rm= TRUE )
air_solar_month_sd <- aggregate(airquality$Solar.R, by=list(month= airquality$Month),FUN = sd,  na.rm= TRUE )
air_solar_month_sd 

#exttra activity
data <- data.frame(
  name = c("Astrid", "Lea", "Sarina", "Remon", "Lea", "Babice", "Jonas", "Wendy", "Niveditha", "Gioia"),
  sex = c("female", "male", "male", "male", "female", "male", "female", "female", "male", "female"),
  age = c(30, 25, 25, 29, 31, 30, 33, 35, 25, 34),
  superhero = c("Batman", "Superman", "Batman", "Spiderman", "Batman", "Antman", "Batman", "Superman", "Maggott",
                "Superman" ),
  tattoos = c(11, 15, 12, 12, 17, 12, 9, 13, 9, 9)
  )
head(data)
dim(data)
median(data$age)
#calculate by gender
aggregate(data$age,by= list(gender=data$sex),FUN= mean, rm.na=TRUE)
# whether the most tatoo owned by male
aggregate(data$tattoos,by= list(gender=data$sex),FUN= max, rm.na=TRUE)

count(data[data$age<32 & data$sex=="female",])/count(data[data$age<32,])

#TRUE is counted as 1, so SUM can caculate the number
sum(data$age<32 & data$sex=="female")
sum(data$age<32)
#cacluate the percentage of What percent of pirates under the age of 32 were female?
sum(data$age<32 & data$sex=="female")/sum(data$age<32)
#What percent of female pirates are under the age of 32?
sum(data$age<32 & data$sex=="female")/sum(data$sex=="female")

##exercise 6 apply
num_vec<- c(1:10)
#create a custom function to achieve the action
square<-function(x){
  y= x^2
  return(y)
}
square(c(3,4))
lapply(num_vec, square)

sapply(num_vec, square)

my_list<-list(1:3,c(TRUE,TRUE,FALSE),FALSE,5)
lapply(my_list,sum)
sapply(my_list,sum)

repeat_fun<- function(x){
  output<-c(x,x,x)
  return(output)
}
# only rep has each parameter, the parameter should be place after fun in sapply, refer to help page
my_list_new<- sapply(my_list,rep, each= 3)

#exercise 7 loops

for (i in 1:7) {
  y=i^3
  print(y)
}

#Write a for loop that iterates over the column names of the inbuilt
#iris dataset and print each together with the number of characters
#in the column name in parenthesis.
#Example output: Sepal.Length (12).
#Use the functions print(), paste0() and nchar(). Look up what these
#functions do using the help feature.

paste(colnames(iris)[1],sep=".")
for ( i in colnames(iris)){
  print(paste0(i," ","(",nchar(i),")"))
}

#Write an ifelse loop to print the colours in colours_vector with four
#characters. Use nchar()
colours_vector <- c("red", "orange", "purple", "yellow", "pink", "blue")
#solution 1
for( i in colours_vector){
  if(nchar(i) ==4){
    print(i)
  }
  }
print(colours_vector[ifelse(colours_vector==4,jud=TRUE,jud=FALSE)])
ifelse(nchar(colours_vector)==4,TRUE,FALSE)
#solution 2
colours_vector[ifelse(nchar(colours_vector)==4,TRUE,FALSE)]

#exercise 8 writing a function

# Write a function to calculate the hypotenuse of a triangle given the length of the 2 sides.
#Remember the hypotenuse is the square root of the sum of the squares - √(a² + b²)
#Run the function you have created with different values.
hypotenuse_cal<-function(x,y){
  z=(x^2+y^2)^0.5
  return(z)
}
hypotenuse_cal(3,4)
