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
png(filename = "Plot3.png",width  = 480, height = 480, bg="transparent")
with(Mydate, plot(Datetime, as.numeric(Sub_metering_1), type = "l", 
                 col="black", main="", 
                 ylab="Energy Sub Metering", xlab=""))
with(Mydate,lines(Datetime, as.numeric(Sub_metering_2), type = "l", col="red"))
with(Mydate,lines(Datetime, as.numeric(Sub_metering_3), type = "l", col="blue"))
legend("topright", lty=1, col=c("black","red","blue"), 
       legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
dev.off()