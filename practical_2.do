///////////////////////////////////////////////////
// Linear regression
///////////////////////////////////////////////////

cd C:\users\a0050726\Downloads
log using pr_oct05.smcl, replace
use "C:\Users\a0050726\Downloads\SCCS2.dta", clear
// scattergram between hdl and weight
twoway (scatter hdl weight)
// pearson correlation coefficient
pwcorr hdl weight, sig obs
// spearman correlation coefficient
spearman hdl weight, stats(rho obs p)
// linear regression
regress hdl weight
// plot regression line on scattergram
twoway (scatter hdl weight) (lfit hdl weight)
// residual vs predictor plot
rvpplot weight, yline(0)
// residula vs fitted
rvfplot, yline(0)
// predicted values
// xb:calculate linear prediction
predict pred, xb
// predicted residuals
predict residuals, residuals
// residuals histogram, normal density plot 
histogram residuals, normal
// summarize residuals
summarize residuals
// qqplot
qnorm residuals

///////////////////////////////////////////////////
// exercise
///////////////////////////////////////////////////

// Q1
use "C:\Users\a0050726\Downloads\Contoli.dta", clear
// a. Plot a scatter diagram showing the relationship between reduction in FEV1
// and IFN-?.
twoway (scatter Interpgml FEV1)
// Fit a simple linear regression model
regress Interpgml FEV1
// Reproduce a plot of the percentage reduction in FEV1 against IFN-?
// according to the health status of the individuals (ie. asthma versus healthy
// individuals).
regress Interpgml FEV1 if (group==1)
twoway (scatter Interpgml FEV1, mlabel(group)) if (group==1)

// Comment on the appropriateness of the linear regression model generated
// in (b), and suggest an alternative way of examining the data.
// seemingly different trend
// Generate a scatter plot and fit the linear regression line confining only to
// the eight healthy individuals without asthma. What does the plot suggest
twoway (scatter Interpgml FEV1, mlabel(group)) (lfit Interpgml FEV1) if (group==0)
// For the data on eight healthy volunteers, conduct a sensitivity analysis by
// excluding the outlying observation.
twoway (scatter Interpgml FEV1, mlabel(group)) (lfit Interpgml FEV1) if (group==0 & FEV1>-15)
regress Interpgml FEV1 if (group==0 & FEV1>-15)



// Q2
use "C:\Users\a0050726\Downloads\Ng etal.dta", clear
// Suggest why log(ACR) rather than ACR was considered as a dependent
// variable in their model
histogram acr, normal
histogram lg_acr, normal
// Show graphically the bivariate relationship between log(ACR) and TNF-a.
twoway (scatter lg_acr TNFscore, mlabel(Studyno))
// Summarise the relationship between log(ACR) and TNF-a using an
// appropriate index.
spearman lg_acr TNFscore, stats(rho obs p)
// Fit a simple linear regression model and interpret the results.
regress lg_acr TNFscore 
// Comment on the adequacy of this model.
// plot regression line on scattergram
twoway (scatter lg_acr TNFscore) (lfit lg_acr TNFscore)
// residual vs predictor plot
rvpplot TNFscore, yline(0)
// residula vs fitted
rvfplot, yline(0)
// predicted values
// xb:calculate linear prediction
predict pred, xb
// predicted residuals
predict residuals, residuals
// residuals histogram, normal density plot 
histogram residuals, normal
// summarize residuals
summarize residuals
// qqplot
qnorm residuals
// Data in generally do not deviate too much from the assumptions of equal variance, linearity
