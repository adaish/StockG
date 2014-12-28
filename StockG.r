# Stock Graph creator
#---------------------------------------------------------------------------------------------------------------------------------------------------------------------
#Function Aim: Creates graphs for fish stock data on Total biomass, Spawning stock Biomass and Fishing mortality, including where availuable the Bmsy, SSBlim and Fmsy
#----------------------------------------------------------------------------------------------------------------------------------------------------------------------
#Interface section:-

#Copy and paste from here
#####rm(list=ls()) #remove everything previous
#CHANGE DIRECTORY TO WHERE THIS FUNCTION (stockgraphcreator) is locate or save copy to local directory this is where your pdf of graphs will be saved to.

#####fish<-read.csv('ICES2012forgraph.csv',header=T)                                  #CHANGE NAME OF EXCEL FILE but keep csv at the end within the ''

#Load excel file saved as csv file with correct associated headers of FishStock (Fishstock name), TBiomass (Total Biomass), SSB (Spawning Stock Biomass), 
#MeanF( mean fish mortality), including where available the Bmsy, SSBlim and Fmsy which should be in a column.

#Example header of the excel information format
#   FishStock CertYear Year  TBiomass     SSB    MeanF    Bmsy SSBlim Fmsy
#  cod-arct     2012  1946  4168882   1112776    0.1857 2568700 220000  0.4
#  cod-arct     2012  1947  3692801   1165059    0.3047 2568700 220000  0.4
#  cod-arct     2012  1948  3665819   1019114    0.3398 2568700 220000  0.4
#  cod-arct     2012  1949  3065111    729879    0.3619 2568700 220000  0.4
#  cod-arct     2012  1950  2830103    615339    0.3566 2568700 220000  0.4
#  cod-arct     2012  1951  3141009    568705    0.3966 2568700 220000  0.4

#Remember to check data fill in all possible data. Make sure the data is all in the same format i.e for each column the same numerical decimals, no commas.
#For fish stock names make sure there are no gaps i.e. 'cod art' chould be 'cod_art' and that they are consist for all the the rows otherwise the function wouldn't 
# be able to recognise when the species has change to make new set of graphs.

# What is created? 3 graphs of the time series given for each fish stocks- total biomass, spawning stock biomass and fishing mortality with the correlated reference points. 
 
#####names(fish)   #Show names of file headers
#####attach(fish)  #Attach titles
#####dev.off()     #close
#####pdf('Stocki') #name of PDF file                                                 #CHANGE NAME OF PDF FILE

#####source('stockgraphcreator.r') #Load function

#####exceltitle<-rbind(FishStock,CertYear,Year,TBiomass,SSB,MeanF,Bmsy,SSBlim,Fmsy)  #CHANGE HEADER NAMES IF DIFFERENT FROM THESE LISTED, KEEP IN SAME ORDER
#####NF<-17 #Number of stock/fishery                                                 #CHANGE THE NUMBER OF STOCK YOU WHAT TO CREATE GRAPHS FOR if you don't know copy and paste 'unique(FishStock)'.

#####FISHSTOCK(NF,exceltitle)  #run function which creates the pdf of fish stock graphs

#Now find pdf file in selected directory folder
#Copy and paste interface ends here

#-----------------------------------------------------------------------------------------------------------------------------------------------------------------------
#Function section:-

FISHSTOCK<-function(NF,exceltitle)
{

#name the title  and content of excel file 
FishStock<-as.character(exceltitle[1,])
CertYear<-as.numeric(exceltitle[2,])
Year<-as.numeric(exceltitle[3,] )
TBiomass<-as.numeric(exceltitle[4,] )
SSB<-as.numeric(exceltitle[5,])
MeanF<-as.numeric(exceltitle[6,] )
Bmsy<-as.numeric(exceltitle[7,]  )
SSBlim<-as.numeric(exceltitle[8,] )
Fmsy<-as.numeric(exceltitle[9,]  )

#storage
ssb<-matrix(NA,length(FishStock),NF)
MF<-matrix(NA,length(FishStock),NF)
TB<-matrix(NA,length(FishStock),NF)
Y1<-matrix(NA,length(FishStock),NF)
Y2<-matrix(NA,length(FishStock),NF)
Y3<-matrix(NA,length(FishStock),NF)
Fmsy1<-matrix(NA,length(FishStock),NF)
ssblim1<-matrix(NA,length(FishStock),NF) 
Bmsy1<-matrix(NA,length(FishStock),NF)

FishS<-as.character(FishStock)
FS<-unique(FishS)
N<-1

for (i in 1:length(FishS))                                                      
{                                                                               
          if(i<=(length(FishS)-1))
              {
              if(FishS[i]==FishS[i+1])                                          
              {
              
              if(!is.na(TBiomass[i]))
              {
              TB[i,N]<-TBiomass[i]
              Bmsy1[i,N]<-Bmsy[i]
              Y1[i,N]<-Year[i]
              }
                else
                  {
                  TB[i,N]<-NA
                  Bmsy1[i,N]<-NA
                  Y1[i,N]<-NA
                  } 
      
             if(!is.na(SSB[i])) 
              {
              ssb[i,N]<-SSB[i]
              ssblim1[i,N]<-SSBlim[i]
              Y2[i,N]<-Year[i] 
              }
                else
                  {
                  ssb[i,N]<-NA
                  ssblim1[i,N]<-NA
                  Y2[i,N]<-NA
                  }
                   
             if(!is.na(MeanF[i]))   
              {
               MF[i,N]<-MeanF[i]
               Fmsy1[i,N]<-Fmsy[i]
               Y3[i,N]<-Year[i]
              }
                else
                  {
                  MF[i,N]<-NA
                  Fmsy1[i,N]<-NA
                  Y3[i,N]<-NA
                  }            
              }
              
              if(FishS[i]!=FishS[i+1])                                           
              {
                  if(!is.na(TBiomass[i]))
                  {
                  TB[i,N]<-TBiomass[i]
                  Bmsy1[i,N]<-Bmsy[i]
                  Y1[i,N]<-Year[i]
                  }
                      else
                      {
                      TB[i,N]<-NA
                      Bmsy1[i,N]<-NA
                      Y1[i,N]<-NA
                      }
                  
                  if(!is.na(SSB[i]))
                  {
                  ssb[i,N]<-SSB[i]
                  ssblim1[i,N]<-SSBlim[i]
                  Y2[i,N]<-Year[i]
                  }
                      else
                      {
                      ssb[i,N]<-NA
                      ssblim1[i,N]<-NA
                      Y2[i,N]<-NA
                      }
                  
                  if(!is.na(MeanF[i]))
                  {
                  MF[i,N]<-MeanF[i]
                  Fmsy1[i,N]<-Fmsy[i]
                  Y3[i,N]<-Year[i]
                  }
                        else
                        {
                        MF[i,N]<-NA
                        Fmsy1[i,N]<-NA
                        Y3[i,N]<-NA
                        }
                  N<-N+1
              }
          }
    
        if(i==(length(FishS)))
        {
          if(!is.na(TBiomass[i]))
                    {
                    TB[i,N]<-TBiomass[i]
                    Bmsy1[i,N]<-Bmsy[i]
                    Y1[i,N]<-Year[i]
                    }
                      else
                      {
                      TB[i,N]<-NA
                      Bmsy1[i,N]<-NA
                      Y1[i,N]<-NA
                      }
                  
                  if(!is.na(SSB[i]))
                  {
                  ssb[i,N]<-SSB[i]
                  ssblim1[i,N]<-SSBlim[i]
                  Y2[i,N]<-Year[i]
                  }
                        else
                        {
                        ssb[i,N]<-NA
                        ssblim1[i,N]<-NA
                        Y2[i,N]<-NA
                        }
                  
                  if(!is.na(MeanF[i]))
                  {
                  MF[i,N]<-MeanF[i]
                  Fmsy1[i,N]<-Fmsy[i]
                  Y3[i,N]<-Year[i]
                  }
                        else
                        {
                        MF[i,N]<-NA
                        Fmsy1[i,N]<-NA
                        Y3[i,N]<-NA
                        }
              
        }
    }
      
  
         
for (II in 1:NF)
    { 
    
    Y11<-Y1[!is.na(Y1[,II]),II]
    Y22<-Y2[!is.na(Y2[,II]),II]
    Y33<-Y3[!is.na(Y3[,II]),II]

    TBcurrent<-TB[!is.na(TB[,II]),II]
    ssbcurrent<-ssb[!is.na(ssb[,II]),II]
    MFcurrent<-MF[!is.na(MF[,II]),II]
 
     
    FmsyC<-Fmsy1[!is.na(Fmsy1[,II]),II]
    ssblimC<-ssblim1[!is.na(ssblim1[,II]),II] 
    BmsyC<-Bmsy1[!is.na(Bmsy1[,II]),II] 
                                                                                          
    par(mfrow=c(2,2),mar=c(4,4,2,2), oma=c(4,4,2,2))
                                
    if(!is.na(TBcurrent[1])) # GRAPH Total Biomass
    {
    plot(Y11,TBcurrent,type='l',lwd=2, xlab='Year',ylab='Total Biomass',main=c('Total Biomass of',FS[II]),ylim=c(0,(max(as.numeric(TBcurrent))+150000)),cex=1.5,cex.lab=1, cex.axis=1, cex.main=1)
    mtext(paste(CertYear[II], " ",format(Sys.time(), "%d-%m-%Y")),cex=0.75, line=0, side=SOUTH<-1, adj=0, outer=TRUE) 
    mtext(c('Stock Status update'),NORTH<-3, line=0, adj=0.5, cex=1, col="dark blue", outer=TRUE)
    points(Y11[length(Y11)],TBcurrent[length(Y11)],col='red',pch=16,cex=1.5) 
    points(Y11[length(Y11)-1],TBcurrent[length(Y11)-1],col='black',pch=16,cex=1.5)     
   }
    if(!is.na(BmsyC[1]))
    {abline(BmsyC,0,lty=5,lwd=1)
    legend('topright',c('Bmsy'),lty=5,cex=0.5,lwd=1)
    }
    
    
    if(!is.na(ssbcurrent[1]))  #GRAPH SSB
    {
    plot(Y22,ssbcurrent,type='l',lwd=2, xlab='Year',ylab='Spawning Stock Biomass',main=c('Spawning Stock Biomass of',FS[II]),ylim=c(0,max(as.numeric(ssbcurrent))+150000),cex=1,cex.lab=1, cex.axis=1, cex.main=1)
    points(Y22[length(Y22)],ssbcurrent[length(Y22)],col='red',pch=16,cex=1.5)
    points(Y22[length(Y22)-1],ssbcurrent[length(Y22)-1],col='black',pch=16,cex=1.5)
    }
   if(!is.na(ssblimC[1]))
   { abline(ssblimC,0,lty=5,lwd=1)
    legend('topright',c('SSBlim'),lty=5,cex=0.5,lwd=1) } 
  
   if(!is.na(MFcurrent[1]))    #GRAPH Mean fish mortality
   {  
    plot(Y33,MFcurrent,type='l',lwd=2, xlab='Year',ylab='Mean Fishing Mortality',main=c('Mean Fishing Mortality of',FS[II]),ylim=c(0,max(as.numeric(MFcurrent))+1),cex=1,cex.lab=1, cex.axis=1, cex.main=1)
    points(Y33[length(Y33)],MFcurrent[length(Y33)],col='red',pch=16,cex=1.5)  
    points(Y33[length(Y33)-1],MFcurrent[length(Y33)-1],col='black',pch=16,cex=1.5)    
  }
   if (!is.na(FmsyC[1]))
   {abline(FmsyC,0,lty=5,lwd=1)
    legend('topright',c('Fmsy'),lty=5,cex=0.5,lwd=1)} 
  
  
 }
dev.off()
}  
    
#######################################################################################################################END

