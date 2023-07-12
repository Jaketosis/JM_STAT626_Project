library(xts)
library(astsa)

df<-read.csv('C:/Users/Jaketosis/OneDrive/TAMU/MS Stats/STAT626/Project/Data/Intermediate/transformed_data.csv')
df_agg<-read.csv('C:/Users/Jaketosis/OneDrive/TAMU/MS Stats/STAT626/Project/Data/Intermediate/total_agg_aggregated_daily.csv')
colnames(df_agg)
df_agg$dty<-format(as.Date(df_agg$dt),'%Y')
df_agg<-df_agg[df_agg$dty==2019,]

par(mfrow=c(1,1))
tsplot(as.Date(df_agg$dt),df_agg$mean,main="Industry Mean Earnings Per Day (2019)",ylab="Dollars",col=4)
tsplot(as.Date(df_agg$dt),df_agg$min,main="Industry Min Earnings Per Day",ylab="Dollars",col=4)
tsplot(as.Date(df_agg$dt),df_agg$max,main="Industry MaxEarnings Per Day",ylab="Dollars",col=4)
tsplot(as.Date(df_agg$dt),df_agg$sum,main="Industry Total Earnings Per Day",ylab="Dollars",col=4)

head(df_agg)
mean(df_agg$mean)