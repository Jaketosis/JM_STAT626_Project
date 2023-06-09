library(xts)
library(astsa)

df<-read.csv('C:/Users/Jaketosis/OneDrive/TAMU/MS Stats/STAT626/Project/transformed_data.csv')
df_agg<-read.csv('C:/Users/Jaketosis/OneDrive/TAMU/MS Stats/STAT626/Project/aggregated_daily.csv')
colnames(df_agg)
par(mfrow=c(4,1))
tsplot(as.Date(df_agg$Date),df_agg$mean)
tsplot(as.Date(df_agg$Date),df_agg$min)
tsplot(as.Date(df_agg$Date),df_agg$max)
tsplot(as.Date(df_agg$Date),df_agg$sum)

