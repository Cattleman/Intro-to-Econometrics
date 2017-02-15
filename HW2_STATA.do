log using "C:\Users\abc.log", replace

use "C:\HW2_A.DTA", clear

*A describe the data and get general summary statistics
describe
summarize earnings IQ educ

*B
*proportion of sample that live in the south
tab south

*Proportion living urban
tab urban

*Proportion that is married
tab married

*look for correlation 
corr earnings married south urban

*C - regress with earnings (salary) as dependent and IQ as independent

regress earnings IQ

*avplots plots the regressors and best fit line
avplots

*D - compare wages and IQ
*need to create a new variable 'wages' = weekly earnings/hours
gen weekly_earn = earnings/4
gen wages = weekly_earn / hours
label variable wages "= weekly earnings/hours"

*do regress agian to compare. Wages is dependent and IQ is independent
regress wages IQ
avplots
*finds yhat value. xb means to use variables used in the regress above


*E - Predicted earnings of an individual having an IQ score of 120
*Using predicted values from C. 
gen fitted_earnings =  116.9916 + 8.303064*120
tab fitted_earnings

*Predicted Wage
gen fitted_wage = 1.177245+0.0434747*120
tab fitted_wage

