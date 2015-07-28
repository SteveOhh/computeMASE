# Written July 24, 2015. Formula found at: http://stats.stackexchange.com/questions/116267/time-series-forecasting-accuracy-measures-mape-and-mase (put different link if I share this with public)

computeMASE <- function(forecast, actual, trainingdata){
  
  # Set important variables from input data
  fullSeries <- c(trainingdata, actual)
  n <- length(fullSeries)
  
  # This is used to calculate naive errors & forecast errors
  stepAheadError <- function(obs, estimate) {
    # So, 'estimate' is either period T-1 or a forecast
    abs(obs-estimate)
  }
  
  # The mean of these naive errors for the FULL series is the scaling factor (see below)
  naiveErrors <- stepAheadError(fullSeries[2:n], fullSeries[1:n-1])
                   
  # This is simply the absolute value of the difference
  forecastErrors <- stepAheadError(actual, forecast)
  
  # And then we scale it and find the mean             
  MASE <- mean(forecastErrors/mean(naiveErrors))
                   
  return(MASE)
}