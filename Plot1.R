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

# Plotting and Saving the plot in a PNG file
png(filename = "Plot1.png",width  = 480, height = 480, units = "px", bg="transparent")
with(Mydate, hist(as.numeric(Global_active_power), 
                 col = "red", main="Global active power",
                 xlab = "Global active power (kilowatts)",
                 ylab = "Frequency"))
dev.off()