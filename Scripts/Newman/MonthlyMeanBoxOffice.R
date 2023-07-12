library(xts)
library(astsa)

df<-read.csv("C:/Users/samue/Documents/Texas A&M/STAT 626/Project/transformed_data.csv")
df_agg<-read.csv("C:/Users/samue/Documents/Texas A&M/STAT 626/Project/total_agg_aggregated_daily.csv")
colnames(df_agg)
#df_agg$dty<-format(as.Date(df_agg$dt),'%Y')
#df_agg<-df_agg[df_agg$dty==2019,]

par(mfrow=c(1,1))
tsplot(as.Date(df_agg$dt),df_agg$mean,main="Industry Mean Earnings Per Day (2019)",ylab="Dollars",col=4)
tsplot(as.Date(df_agg$dt),df_agg$min,main="Industry Min Earnings Per Day",ylab="Dollars",col=4)
tsplot(as.Date(df_agg$dt),df_agg$max,main="Industry MaxEarnings Per Day",ylab="Dollars",col=4)
tsplot(as.Date(df_agg$dt),df_agg$sum,main="Industry Total Earnings Per Day",ylab="Dollars",col=4)

head(df_agg)

hist(log(df_agg$mean),main="Industry Mean Earnings Per Day",ylab="Dollars",col=4)

df_agg_split <- df_agg #Create new df to aggregate by month

df_agg_split$dt <- as.Date(df_agg_split$dt) #Set the date column format

df_agg_split$year <- strftime(df_agg_split$dt,"%Y") #Split year into its own column

df_agg_split$month <- strftime(df_agg_split$dt,"%m") #split month into its own column

df_agg_month <- aggregate(df_agg_split$sum ~ month + year, df_agg_split, FUN=mean) #aggregate by month

colnames(df_agg_month) <- c('month','year','mean_box_office')

head(df_agg_month)

#Create time series object

monthly_boxoffice <- ts(df_agg_month$mean_box_office,,start=2005, end=2019,frequency=12)

hist(monthly_boxoffice)  #Data appears normally distributed.

tsplot(monthly_boxoffice, main='Monthly Mean Box Office', ylab='Dollars',col=4)  

#Data appears stationary, no transformation appears necessary. 

pacf(monthly_boxoffice)

#PACF shows virtually 0 correlation after 12 months, implying a SARIMA model. 

