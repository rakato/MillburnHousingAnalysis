library(ggplot2)
library(scales)
library(RgoogleMaps)
library(plotly)

homes<-read.csv("LTM_MILL_MAY16.csv", stringsAsFactors = FALSE)
u<-ggplot(homes, aes(homes$sp, homes$lp, label= homes$add))
u+geom_point(aes(size=homes$dom), colour="white")+scale_x_continuous(labels=comma)+
scale_y_continuous(labels=comma)+ggtitle("Millburn LTM May 16 List Price vs. Selling Price")+scale_size_area()+
xlab("home selling price")+ylab("home listing price")+geom_text(check_overlap = TRUE)

#create a subset of homes that sell above and below listing
und<- subset(homes, homes$sp.olp<1)
over<- subset(homes, homes$sp.olp>1)

median(und$lp-und$sp)
median(over$lp-over$sp)

median(over$dom)
median(und$dom)

#Homes that sell over/under/at listing
bad<-length(which(homes$lp>homes$sp))
good<-length(which(homes$sp>homes$lp))
okay<-length(which(homes$sp==homes$lp))

good/(good+bad+okay)
bad/(good+bad+okay)
okay/(good+bad+okay)

#sales price vs days on market

z<-ggplot(homes, aes(homes$sp, homes$dom, label= homes$add))
z+geom_point()
z+geom_point(aes(size=homes$dom), colour="white")+scale_x_continuous(labels=comma)+
  scale_y_continuous(labels=comma)+ggtitle("Millburn LTM May 16 List Price vs. Selling Price")+scale_size_area()+
   xlab("home selling price")+ylab("home listing price")+geom_text(check_overlap = TRUE)

head(lapply(homes$full, getGeoCode))

#histogram with number of occurences
y<- hist(homes$dom, plot=FALSE)
plot(y, ylim=c(0, max(y$counts)+5))
text(y$mids, y$counts+3, y$counts, cex=0.75)

#Days under 50
homes50<-subset(homes, dom<=10)
u<-ggplot(homes50, aes(homes50$sp, homes50$lp, label= homes50$add))
          u+geom_point(aes(size=homes50$dom), colour="white")+scale_x_continuous(labels=comma)+
            scale_y_continuous(labels=comma)+ggtitle("Millburn LTM May 16 List Price vs. Selling Price")+scale_size_area()+
            xlab("home selling price")+ylab("home listing price")+geom_text(check_overlap = TRUE)
          
#put into plotly
plot_ly(homes, x = dom, y = sp, mode="markers", text = paste("Address: ", add)) 

#with bedrooms
plot_ly(homes, x = dom, y = sp, mode="markers", size= Beds, text = paste("Address: ", add))

#with color and opacity
plot_ly(homes, x = dom, y = sp, mode="markers", color=Beds, size= Beds, opacity= Beds, text = paste("Address: ", add))

