## Description
This file is a standalone R function for calculating the mean absolute scaled error (MASE) of a forecast series. The MASE, in English, is the average absolute value of the differences between forecast and actual values, divided by a scaling factor. The scaling factor is simply the average absolute value of differences between observed values. [See the equation here](http://robjhyndman.com/papers/foresight.pdf) (on page 3).

The reason I wrote my own function instead of using the `accuracy` command in Hyndman's `forecast` package is that `accuracy` requires a `forecast` object which includes the training data used to make the forecast. In practice, we sometimes have to evaluate forecasts that others have made, where their method is unknown, or it incorporates judgments which are impossible to codify.

With the `computeMASE` function, you don't need to explicitly have the forecast algorithm. All that's required is a forecast, the actual values over the forecast horizon, and the actual values leading up to the forecast period.

## Example
```{r}
observed <- c(75,95,105,85,105,115)
forecast <- c(100,110,120)

computeMASE(forecast=forecast, actual=observed[4:6], trainingdata=observed[1:3])
```

