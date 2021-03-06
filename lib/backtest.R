

backtest <- function(wP,data = data_final[,-1]){
  n = dim(data)[1]
  return = data[2:n,]/data[1:(n-1),]
  weight <- matrix(rep(0,250*482),ncol=482,nrow=250)
  weight_mat_nrow <- floor((nrow(data)-250)/60)
  for(i in 1:weight_mat_nrow){
    weight <- rbind(weight, matrix(rep(wP[i,],60),ncol=ncol(data),nrow = 60,byrow = T))
  }
  test_daily_return <-  diag(weight %*% t(return[1:nrow(weight),]))
  return(test_daily_return)
}
