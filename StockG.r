# Stock Graph creator
#---------------------------------------------------------------------------------------------------------------------------------------------------------------------
#Function Aim: Creates graphs for fish stock data on Total biomass, Spawning stock Biomass and Fishing mortality, including where availuable the Bmsy, SSBlim and Fmsy
#----------------------------------------------------------------------------------------------------------------------------------------------------------------------
#-----------------------------------------------------------------------------------------------------------------------------------------------------------------------
#Function section:-

FISHSTOCK<-function(NF,exceltitle)
{

#name the title  and content of excel file 
FishStock<-as.character(exceltitle[1,])
AssessmentYear<-as.numeric(exceltitle[2,])
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
    mtext(paste(AssessmentYear[II], " ",format(Sys.time(), "%d-%m-%Y")),cex=0.75, line=0, side=SOUTH<-1, adj=0, outer=TRUE) 
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

