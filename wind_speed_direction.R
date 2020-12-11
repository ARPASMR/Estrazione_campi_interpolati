#Lettura del file CSV costruito attraverso l'estrazione in Python
df <- read.csv("C:\\Users\\mazanetti\\Downloads\\Basiano\\Concorezzo\\Dati\\agosto_2020\\concorezzo_202008.csv", sep=";",header=FALSE,col.names=c("Date","","U_ms","V_ms"))

#estrazione di due cifre dalla data per l'orario
hour <- substr(df$Date, 9, 10)

#Aggiustamento formato per l'orario
hour <- as.POSIXlt(hour,format="%H")
hour <- strftime(hour, format="%H")

#Calcolo del modulo del vento (m/s) e della direzione (360 gradi)
speed_ms = sqrt(df$U_ms^2 + df$V_ms^2)
dir_degree = (270-(atan2(df$V_ms, df$U_ms)*(180/pi)))%%360

#Creazione di un dataframe con tutte le informazioni
data <- data.frame(df$Date,hour,df$U_ms,df$V_ms,speed_ms,dir_degree)
colnames(data)=c("Date","Hour","U_ms","V_ms","speed_ms","dir_degree")
data <- transform(data, Date = as.Date(as.character(Date), "%Y%m%d%H"))

#Scrittura file CSV 
write.csv(data,"Vento_Concorezzo_202008.csv",row.names=FALSE)
