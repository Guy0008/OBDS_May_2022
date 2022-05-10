#exerciese 3 for base_R course
a<- matrix(c(1:9),nrow=3)
a
a[2,3]

b<-matrix(c(1:12),nrow = 3,byrow = TRUE)
b
colnames(b)<-c('first','second','third','forth')
rownames(b)<-c ('one','two','three')

c<- array(c(1:24),dim=c(4,2,3))
c
c[3,2,2]
last_matrix <- c[,,3]
last_matrix

d<- list(1,3.5,'eded',TRUE,34)
d[c(3:4)]#the way to extract two elements of a vector
d[[3]]


#extra activity

movie <- c("Whatever Works","It Follows","Love and Mercy","The Goonies","Jiro Dreams of Sushi","There Will be Blood", "Moon","Spice World", "Serenity", "Finding Vivian Maier")
year<- c("2009","2015","2015","1985","2012","2007","2009","1988","2005","2014")
boxoffice <- c("35","15","15","62","3","10","321","79","39","1.5")
genre <- c("Comedy","Horror","Drama","Adventure","Documentary","Drama","Science,Fiction","Comedy","Science Fiction",
"Documentary")
time <- c("92","97","120","90","81","158","97","-84","119","84")
rating<- c("PG-13","R","R","PG","G","R","R","PG-13","PG-13","Unrated")
#change the type of the objects
class(year)<- "integer"
year
movie[10]
genre[1:4]

movie[movie=="Spice World"]<- "The Naked Gun"
movie[year<1990]
movie[genre=="Comedy"]
class(boxoffice)<-'double'
sum(boxoffice[genre=="Comedy"])
movie[boxoffice<50 & genre=="Comedy"]
