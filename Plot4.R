# Loading data
# Previosly file downloaded from  the UC Irvine Machine Learning Repository,
# was unziped and saved in the Working Directory.
Mydate <- read.table("household_power_consumption.txt", 
                     header=TRUE,sep=";",colClasses="character")

# The "Data" variable was convert to Date classe, solving the format circunstance
Mydate[,1] <- as.Date(Mydate$Date, "%d/%m/%Y")

# Selecting the rows to work
Th <- Mydate$Date=="2007-02-01"
Fr <- Mydate$Date=="2007-02-02"
Thursday <- Mydate[Th, ]
Friday <- Mydate[Fr, ]
Mydate <-rbind(Thursday, Friday)

# Adding a Datatime variable, pasting the Data and the Time variables
Mydate$Datetime <- as.POSIXct(paste(Mydate$Date, Mydate$Time), 
                              format="%Y-%m-%d %H:%M:%S")

# Plotting and Saving the plot in a PNG file
png(filename = "Plot4.png",width  = 480, height = 480, units = "px", bg="transparent")
par(mfrow = c(2,2), cex = .75)
with(Mydate, plot(Datetime, as.numeric(Global_active_power), type = "s",
                 main="",
                 ylab = "Global active power (kilowatts)", 
                 xlab=""))
with(Mydate, plot(Datetime, as.numeric(Voltage), type = "s",
                 main="",
                 ylab = "Voltage",
                 xlab = "Datetime"))
with(Mydate, plot(Datetime, as.numeric(Sub_metering_1), type = "s",
                 col="black", 
                 main="",
                 ylab = "Energy Sub Metering", 
                 xlab=""))
with(Mydate,lines(Datetime, as.numeric(Sub_metering_2), type = "s", col="red"))
with(Mydate,lines(Datetime, as.numeric(Sub_metering_3), type = "s", col="blue"))
legend("topright", lty=1, col=c("black","red","blue"), bty = "n", 
       legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
with(Mydate, plot(Datetime,as.numeric(Global_reactive_power), type = "s",
                  main="",
                  ylab = "Global reactive power (kilowatts)", 
                  xlab = "Datetime"))
dev.off()