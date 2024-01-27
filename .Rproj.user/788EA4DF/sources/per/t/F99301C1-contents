#include <Rcpp.h>
using namespace Rcpp;

// Function to perform simple linear regression
// [[Rcpp::export]]
List SimpLinCpp(NumericVector x, NumericVector y) {
  // Compute the regression coefficients
  int n = x.size();
  double mean_x = Rcpp::mean(x);
  double mean_y = Rcpp::mean(y);
  double ss_x = sum(pow(x - mean_x, 2));
  double beta1 = sum((x - mean_x) * (y - mean_y)) / ss_x;
  double beta0 = mean_y - beta1 * mean_x;
  
  // Compute residuals
  NumericVector residuals = y - (beta0 + beta1 * x);
  
  // Compute standard errors
  double s_sq = sum(pow(residuals, 2)) / (n - 2);
  double se_beta0 = sqrt((s_sq * sum(pow(x, 2))) / (n * ss_x));
  double se_beta1 = sqrt(s_sq / ss_x);
  
  // Compute confidence intervals (95%)
  double z_value = R::qnorm(0.975, 0.0, 1.0, 1, 0);
  NumericVector ci_beta0 = NumericVector::create(beta0 - z_value * se_beta0, beta0 + z_value * se_beta0);
  NumericVector ci_beta1 = NumericVector::create(beta1 - z_value * se_beta1, beta1 + z_value * se_beta1);
  
  // Compute predicted values
  NumericVector predicted_values = beta0 + beta1 * x;
  
  // Return results as a list
  return List::create(
    Rcpp::Named("beta0") = beta0,
    Rcpp::Named("beta1") = beta1,
    Rcpp::Named("se_beta0") = se_beta0,
    Rcpp::Named("se_beta1") = se_beta1,
    Rcpp::Named("ci_beta0") = ci_beta0,
    Rcpp::Named("ci_beta1") = ci_beta1,
    Rcpp::Named("residuals") = residuals,
    Rcpp::Named("predicted_values") = predicted_values
  );
}



