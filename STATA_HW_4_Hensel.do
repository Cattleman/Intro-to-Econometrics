log using "C:\Users\Ian\OneDrive\EC 469\HW_4_Hensel.log", replace

use "C:\Users\Hensel\OneDrive\EC 469\PROJECT\HW4_1.DTA", clear

/*summarize the variables voteA is the dependent variable
democA is a dummy variable, can have 1 or 0 value. if 1 then it is a dem.*/ 

sum voteA prtystrA expendA expendB lexpendA lexpendB shareA democA
corr voteA prtystrA expendA expendB lexpendA lexpendB shareA democA


/* 1) reg log expenditures of both canidates,and past party votes 
use democA as dummy to explore interactions */

/*reg voteA expendA expendB prtystrA if democA==0
reg voteA expendA expendB prtystrA if democA==1*/

reg voteA lexpendA lexpendB prtystrA if democA==0
reg voteA lexpendA lexpendB prtystrA if democA==1

/* 2) Goal: Explore percent votes for dem. as a function of share of 
district expend.*/
reg voteA shareA if democA==0
reg voteA shareA if democA==1

/* Goal: create a set of democrat variables.*/
gen dem_A = voteA if democA==1
label variable dem_A "percent vote for democrat canidate"

gen dem_expend = expendA if democA==1
label variable dem_expend "expend. by democrat campaign, $1000s"

gen dem_lexpend = lexpendA if democA==1
label variable dem_lexpend "log expend by democrat"

gen dem_prtystrA = prtystrA if democA==1 
label variable dem_prtystrA "percent of dist.voted for democrat pres. canidate"

gen dem_shareA = shareA if democA==1
label variable dem_shareA "Share of spending that is democrat"


/* explore democrat votes by how the district voted in the past and the share 
of democrat spending in the district. */

reg dem_A dem_prtystrA dem_shareA
reg voteA prtystrA shareA if democA==0

/* 3) Goal: explore expenditure efficiency for percent of votes */

gen dem_expend_eff = dem_expend / dem_A 
label variable dem_expend_eff "$1000s expend per % vote dem."

gen non_dem_expendA = expendA if democA==0
label variable non_dem_expendA "non dem camp. expend. $1000s"

gen non_dem_voteA = voteA if democA==0
label variable non_dem_voteA "non dem. % votes"

gen non_dem_expend_eff = non_dem_expendA
label variable non_dem_expend_eff "$1000 expend / % vote non-dem"

sum  non_dem_expend_eff dem_expend_eff
