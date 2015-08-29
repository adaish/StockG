
# StockG "Stock Assessment Graph creator"
#---------------------------------------------------------------------------------------------------------------------------------------------------------------------
#Function Aim: Creates graphs for ICES fish stock assessment data on Total biomass, Spawning stock Biomass and Fishing mortality, including where availuable the Bmsy, SSBlim and Fmsy
#----------------------------------------------------------------------------------------------------------------------------------------------------------------------
#Interface section:-

#Copy and paste from here...


rm(list=ls()) #remove everything previous
#CHANGE DIRECTORY TO WHERE THIS FUNCTION (StockG) is locate or save copy to local directory this is where your pdf of graphs will be saved to.
#getwd() #find working directory
#setwd() #set working directory

#EXAMPLE OF OLD DATA 
fish<-read.csv('fishdata.csv',header=T)
#CHANGE NAME OF EXCEL FILE but keep csv at the end within the ''

#DOWNLOAD ICES STOCK ASSESSEMENTS DATABASE
#Citition: "ICES Stock Database , 2012, 12. ICES, Copenhagen."
#http://ices.dk/marine-data/Documents/CatchStats/Disclaimer_Stock_Database.pdf
#http://standardgraphs.ices.dk/stockList.aspx
#Cut columns that are not necessary ... 
#Rename column names to match input names
#Load excel file saved as csv file with correct associated headers of FishStock (Fishstock name), TBiomass (Total Biomass), SSB (Spawning Stock Biomass), 
#MeanF( mean fish mortality), including where available the Bmsy, SSBlim and Fmsy which should be in a column.

#Example header of the excel information format
#   FishStock AssessmentYear Year  TBiomass     SSB    MeanF    Bmsy SSBlim Fmsy
#  cod-arct     2012  1946  4168882   1112776    0.1857 2568700 220000  0.4
#  cod-arct     2012  1947  3692801   1165059    0.3047 2568700 220000  0.4
#  cod-arct     2012  1948  3665819   1019114    0.3398 2568700 220000  0.4
#  cod-arct     2012  1949  3065111    729879    0.3619 2568700 220000  0.4
#  cod-arct     2012  1950  2830103    615339    0.3566 2568700 220000  0.4
#  cod-arct     2012  1951  3141009    568705    0.3966 2568700 220000  0.4

#Remember to check data is fill as much as possible. Make sure the data is all in the same format i.e for each column the same numerical decimals, no commas.
#For fish stock names make sure there are no gaps i.e. 'cod art' chould be 'cod_art' and that they are consist for all the the rows otherwise the function wouldn't 
# be able to recognise when the species has change to make new set of graphs.

# What is created? 
#3 graphs of the time series given for each fish stocks- total biomass, spawning stock biomass and fishing mortality with the correlated reference points. 
 
names(fish)   #Show names of file headers
attach(fish)  #Attach titles
dev.off()     #close
pdf('Stock_plot1.pdf') #name of PDF file #CHANGE NAME OF PDF FILE

source('StockG.r') #Load function

exceltitle<-rbind(as.character(FishStock),AssessmentYear,Year,TBiomass,SSB,MeanF,Bmsy,SSBlim,Fmsy)  #CHANGE HEADER NAMES IF DIFFERENT FROM THESE LISTED, KEEP IN SAME ORDER

NF<-53 #Number of stock/fishery    #53 means all 53 ICES fish stocks
#CHANGE THE NUMBER OF STOCK YOU WHAT TO CREATE GRAPHS FOR if you don't know copy and paste 'unique(FishStock)'.

FISHSTOCK(NF,exceltitle)  #run function which creates the pdf of fish stock graphs

#Now find pdf file in selected directory folder

#The red dot represent the most up to date time point value and the previous time step i.e. the previous year is represented by a black dot.
#The dates on the bottom of each of the pdf pages represent the Certified year of data and the second date is the full current date when the graphs were produced. 
#If a graph does not appear it is because the data is not existant.
#If the function does not run, it is most likely due to inconsistances in the data load, its worth re-formating cells to make them consist, if not send me your data and I will fix it.
#Copy and paste interface ends here
dev.off()