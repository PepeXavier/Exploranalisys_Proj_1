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
png(filename = "Plot2.png",width  = 480, height = 480, units = "px", bg="transparent")
with(Mydate, plot(Datetime, as.numeric(Global_active_power), type = "s",
                 main="",
                 ylab="Global active power (kilowatts)", 
                 xlab=""))
dev.off()