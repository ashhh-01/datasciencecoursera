# Reproducible Research:Project 1

# # Activity monitoring data

## Loading and preprocessing the data

    unzip("repdata_data_activity.zip")
    data<-read.csv("activity.csv")

## Mean and Median of the total number of steps taken per day

    totalsteps<-tapply(data$steps,data$date,FUN=sum,na.rm=T)
    stepsmean<-mean(totalsteps)
    stepsmedian<-median(totalsteps)

Mean of total steps taken is 9354.2295082 and median is 10395

### plot

    hist(totalsteps)

![](PA1_template_files/figure-markdown_strict/unnamed-chunk-3-1.png) ##
Average daily activity pattern

    library(ggplot2)
    average<-aggregate(x=list(steps=data$steps),by=list(interval=data$interval),FUN=mean,na.rm=T)
    ggplot(data=average,aes(x=interval,y=steps))+geom_line()+xlab("intervals")+ylab("steps")

![](PA1_template_files/figure-markdown_strict/unnamed-chunk-4-1.png) ##
Total number of missing values

    missing<-is.na(data$steps)
    table(missing)

    ## missing
    ## FALSE  TRUE 
    ## 15264  2304

## Replace each missing value

    fill.value <- function(steps, interval) {
        filled <- NA
        if (!is.na(steps))
            filled <- c(steps)
        else
            filled <- (average[average$interval==interval, "steps"])
        return(filled)
    }
    filled.data <- data
    filled.data$steps <- mapply(fill.value, filled.data$steps, filled.data$interval)

### Mean and median of steps with Histogram

    totalsteps<-tapply(filled.data$steps,filled.data$date,FUN=sum)
    mean(totalsteps)

    ## [1] 10766.19

    median(totalsteps)

    ## [1] 10766.19

    hist(totalsteps)

![](PA1_template_files/figure-markdown_strict/unnamed-chunk-7-1.png) ###
Activity patterns between weekdays and weekends

    weekday.or.weekend <- function(date) {
        day <- weekdays(date)
        if (day %in% c("Monday", "Tuesday", "Wednesday", "Thursday", "Friday"))
            return("weekday")
        else if (day %in% c("Saturday", "Sunday"))
            return("weekend")
        else
            stop("invalid date")
    }
    filled.data$date <- as.Date(filled.data$date)
    filled.data$day <- sapply(filled.data$date, FUN=weekday.or.weekend)
    averages <- aggregate(steps ~ interval + day, data=filled.data, mean)
    ggplot(averages, aes(interval, steps)) + geom_line() + facet_grid(day ~ .) +xlab("5-minute interval") + ylab("Number of steps")

![](PA1_template_files/figure-markdown_strict/unnamed-chunk-8-1.png)
