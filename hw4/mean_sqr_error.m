function mse = mean_sqr_error(given, prediction)
  mse = (1/length(given)) * sumsqr(given - prediction);
end