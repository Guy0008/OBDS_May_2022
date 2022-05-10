data("iris")
coding_gene_region<- read.table(file= "/project/obds/shared/resources/2_r/baseR/coding_gene_region.bed",header = FALSE,sep = "\t")
View(coding_gene_region)
dim(coding_gene_region)
nrow(coding_gene_region)
ncol(coding_gene_region)

colnames(coding_gene_region)<-c("chr","start","stop","name","score","strand")
colnames(coding_gene_region)
names(coding_gene_region) # show names

coding_gene_region[30,3]
coding_gene_region[,2]
start<- coding_gene_region$start

coding_gene_region$int_length <- coding_gene_region$stop - coding_gene_region$start

colnames(coding_gene_region)

medium_size<- coding_gene_region[coding_gene_region$int_length >= 100001 & coding_gene_region$int_length <= 200000,]
medium_size_new<-subset(coding_gene_region,int_length>= 100001 & int_length<=200000)
identical(medium_size,medium_size_new)
# save a table separate file without quote and no row names
write.table(medium_size,file="subset_coding_gene_region_base_R.txt",row.names = FALSE,sep = "\t", quote = FALSE)
