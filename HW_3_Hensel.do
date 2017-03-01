log using "C:\Users\...\STATA\HW3_NAME.log", clear

use "C:\Users\...\STATA\TRUMPet.DTA", clear


*A 

sum prpblck income

*B 
reg psoda prpblck income

*C
reg psoda prpblck

*D 
reg lpsoda prpblck income

*E
reg lpsoda prpblck income prppov

*F remember default Confidence is 95% p-value = alpha
reg lpsoda prpblck lincome prppov

test prpblck 

test prpblck lincome prppov

*G test the null that log income and poverty prop. 
*are jointly stat insignificant.
test lincome prppov
