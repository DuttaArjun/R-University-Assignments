#Assignment 3

#1
Pollutantmean <- function(Directory, Pollutant, ID) {
  Filenames <- list.files(Directory,full.names = TRUE)  
  DF <- lapply(Filenames[ID],read.csv,header=T)
  DF <- do.call("rbind",DF)
  return(mean(DF[,Pollutant],na.rm = TRUE))
}
Pollutantmean("specdata","nitrate",1:10)
Pollutantmean("specdata","sulfate",1:10)

#2
CompleteCases <- function(Directory, ID=1:332) {
    CompleteCounts <- function(Filenames) sum(complete.cases(read.csv(Filenames)))
    Filenames <- list.files(Directory, full.names=TRUE)[ID]
    data.frame(ID = ID, CompleteCases = unlist(lapply(Filenames, CompleteCounts)))
}

CompleteCases("specdata")  #IF no ID argument is given the default value is taken i.e 1:332

#3
Cor <- function(Directory, Threshold) 
{
  CC <-  CompleteCases(Directory)
  CCTM <- CC[CC$CompleteCases>Threshold,]$ID
  Filenames <- paste(Directory,"/", formatC(CCTM, width = 3, flag = "0"),".csv", sep = "")
  cor <- numeric()
  for (i in 1:length(CCTM)) {
    Read = read.csv(Filenames[i])
    DF = Read[complete.cases(Read), ]
    cor = c(cor, cor(DF$sulfate, DF$nitrate))
  }
  return(cor)
}

Cor("specdata", 200)

