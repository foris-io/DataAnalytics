soilCropData <- read.csv("soilcropdata.csv")
soilCropData


getResult <- function(cropType, soilType, moisture, temperature, humidity, salinity)
{
  result <- soilCropData[with(soilCropData, ct == cropType 
                                          & st == soilType),]
  result$moistdev = moisture/lag(result$ism) - 1
  result$tempdev = temperature/lag(result$iat) - 1
  result$humdev = humidity/lag(result$ih) - 1
  result$saldev = salinity/lag(result$is) - 1
  return(result)
}

# Same data result ->
res <- getResult("grapes","Clay and silt", 1022, 29, 55, 2003)
res






