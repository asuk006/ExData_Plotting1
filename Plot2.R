##loading the required packages:
        library(data.table)

##reading the data and subsetting it to contain only data from the dates 2007-02-01 and 2007-02-02:

        power_consumption <- fread("household_power_consumption.txt", header = T, na.strings = "?", stringsAsFactors = F)
        dates <- c("1/2/2007", "2/2/2007")
        power_consumption <- power_consumption[Date %in% dates, ]
        
##creating a new variable datetime that combines Date and Time and converts them into Date-Time class.
        
        power_consumption[, ':=' (datetime = strptime(paste(Date, Time), "%d/%m/%Y %H:%M:%S"))]
        power_consumption[, c("Date", "Time") := NULL]
        col_order = c(8, 1:7)
        setcolorder(power_consumption, col_order)

##constructing the plot 2:
        
        par(bg = NA)
        plot(power_consumption$Global_active_power ~ power_consumption$datetime, xlab = "", ylab = "Global Active Power (kilowatts)", type = "l")
        
##saving the plot to a 480 * 480 png file:

        dev.copy(png, file = "plot2.png", height = 480, width = 480)
        dev.off()
        