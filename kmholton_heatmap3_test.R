
#heatmap 3 test run on metabolites: no RowSideColors
#also fails in gplots heatmap.2, but misformats row dendrograms
#kristina_holton@hms.harvard.edu

library(RColorBrewer)
library(heatmap3)

#import data
data2<-read.table("norm2-3.csv",  header=F, sep=",")
dataMS<-data2[,c(14:71)]
row.names(dataMS)<-data2[,1]
mydata<-as.matrix(dataMS)

#use Brewer pallete for pretty colors
my_palette <- colorRampPalette(c("red", "black", "green"))(n = 299)

#define color breaks (set min and max for each color
colors = c(seq(-7,-1,length=100),seq(-0.9,1,length=100),seq(1.2,6,length=100))

#Define my RowSideColors
myRowSideColors<-c(rep("deepskyblue", 82), rep("blue", 24), rep("black", 31))
#error: Error in agglo.FUN(vals[iOrd]) : invalid 'type' (character) of argument

CmyRowSideColors<-as.character(c(rep("deepskyblue", 82), rep("blue", 24), rep("black", 31)))
#error: Error in agglo.FUN(vals[iOrd]) : invalid 'type' (character) of argument

FmyRowSideColors<-as.factor(c(rep("deepskyblue", 82), rep("blue", 24), rep("black", 31)))
#no error, but no colors

#minimal heatmap3 run

heatmap3(mydata,
main="Test Heatmap", 
xlab= "Metabolites",
ylab= "Samples",
labRow=NA,
breaks=colors, 
col=my_palette,
RowSideColors<-FmyRowSideColors,
distfun = function(x) as.dist(1 - cor(t(x), use = "pa")),
showColDendro = T,
showRowDendro = T,
margins=c(10,2)
)