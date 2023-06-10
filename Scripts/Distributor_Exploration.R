library(xts)
library(astsa)

df<-read.csv('C:/Users/Jaketosis/OneDrive/TAMU/MS Stats/STAT626/Project/Data/Intermediate/transformed_data.csv')
df_agg<-read.csv('C:/Users/Jaketosis/OneDrive/TAMU/MS Stats/STAT626/Project/Data/Intermediate/studio_agg_aggregated_daily.csv')
colnames(df_agg)
par(mfrow=c(4,4))
df_agg<-df_agg[df_agg$Producer_Rank<5,]
i=1
for (studio in unique(df_agg$Distributor))
{
	temp_agg<-df_agg[df_agg$Distributor==studio,]
	tsplot(as.Date(temp_agg$dt),temp_agg$mean,main=paste(studio, "mean earnings", sep=" "),col=i,ylab="Dollars")
	tsplot(as.Date(temp_agg$dt),temp_agg$min,main=paste(studio, "min earnings", sep=" "),col=i,ylab="Dollars")
	tsplot(as.Date(temp_agg$dt),temp_agg$max,main=paste(studio, "max earnings", sep=" "),col=i,ylab="Dollars")
	tsplot(as.Date(temp_agg$dt),temp_agg$sum,main=paste(studio, "total earnings", sep=" "),col=i,ylab="Dollars")
	i=i+1
}





