#install.packages('rvest')
library('rvest')
datalist = list() #define the variable
for(i in 160:175){   #run loop for the number of pages in the website
url <- paste0('https://www.zomato.com/ncr/delivery-in-gurgaon?ref_page=zone&page=',i, '') #changes page for each iteration

webpage <- read_html(url)  #read the html page
webpage    #print the html page
#install.packages('dplyr') 
library('dplyr')
#install.packages("XML")
library('XML') 
cast <- html_nodes(webpage, ".fontsize0")         #pick the desired node from the webpage
length(cast)
Title_data=as.data.frame(html_text(cast))         #convert it into a dataframe
Title_data
cast2<-html_nodes(webpage, "#orig-search-list .right")
length(cast2)
Rating_data=as.data.frame(html_text(cast2))
Rating_data
Gurgaon_data <- cbind(Rating_data,Title_data)    #combine the columns of both the dataframes
Gurgaon_data$i<-i
datalist[[i]] <- Gurgaon_data
}

big_data = do.call(rbind, datalist)

