# This script assumes you have downloaded the 'bootcamp' repository
# https://github.com/mfredata/bootcamp

# Step 1: Make sure you open the bootcamp.Rproj first
# Step 2: Open this script

# Define function that converts fahrenheit to celcius
f_to_c <- function(temp_f){
  temp_c <- (temp_f - 32) * 5 / 9
  return(temp_c)
}

# Convert 32F to C
f_to_c(32)

# Convert 150F to C
f_to_c(150)

# Create a new function called square 
# That takes 2 values called var1 and var2
# var1 is the base, and var2 is the power
# test it with var1 = 2 and var2 = 3

square <- function(var1, var2){
  result <- var1^var2 
  print(result)
}

square(2,3)

# just put one argument
square(2)

# set var2 = 3 as default
square <- function(var1, var2 = 3){
  result <- var1^var2 
  print(result)
}

square(2)
square(2, 4)

# get.Comtrade()
# https://comtrade.un.org/data/Doc/api/ex/r
pacman::p_load(rjson)
get.Comtrade <- function(url="http://comtrade.un.org/api/get?"
                         ,maxrec=50000
                         ,type="C"
                         ,freq="A"
                         ,px="HS"
                         ,ps="now"
                         ,r
                         ,p
                         ,rg="all"
                         ,cc="TOTAL"
                         ,fmt="json"
)
{
  string<- paste(url
                 ,"max=",maxrec,"&" #maximum no. of records returned
                 ,"type=",type,"&" #type of trade (c=commodities)
                 ,"freq=",freq,"&" #frequency
                 ,"px=",px,"&" #classification
                 ,"ps=",ps,"&" #time period
                 ,"r=",r,"&" #reporting area
                 ,"p=",p,"&" #partner country
                 ,"rg=",rg,"&" #trade flow
                 ,"cc=",cc,"&" #classification code
                 ,"fmt=",fmt        #Format
                 ,sep = ""
  )
  
  if(fmt == "csv") {
    raw.data<- read.csv(string,header=TRUE)
    return(list(validation=NULL, data=raw.data))
  } else {
    if(fmt == "json" ) {
      raw.data<- fromJSON(file=string)
      data<- raw.data$dataset
      validation<- unlist(raw.data$validation, recursive=TRUE)
      ndata<- NULL
      if(length(data)> 0) {
        var.names<- names(data[[1]])
        data<- as.data.frame(t( sapply(data,rbind)))
        ndata<- NULL
        for(i in 1:ncol(data)){
          data[sapply(data[,i],is.null),i]<- NA
          ndata<- cbind(ndata, unlist(data[,i]))
        }
        ndata<- as.data.frame(ndata)
        colnames(ndata)<- var.names
      }
      return(list(validation=validation,data =ndata))
    }
  }
}

# application
raw <- get.Comtrade(r="528", p="0,170,320,360,458", ps="2020",
                    rg=1, cc="151110")

# convert to dataframe
dfraw <- as.data.frame(raw$data)

# view first 5 rows of data
head(dfraw)
