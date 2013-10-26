cd C:\users\a0050726\Downloads
log using pr_oct26.smcl, replace
use "C:\Users\a0050726\Downloads\SCCS2.dta", clear

// t-test for two independent groups
histogram hdl, by(sex)
sdtest hdl, by(sex)

// Man-U test
use "C:\Users\a0050726\Downloads\Ng et al (26Oct13)", clear
histogram lg_acr, normal by(gender)

use "C:\Users\a0050726\Downloads\aspirin", clear
ttest before == after

use "C:\Users\a0050726\Downloads\duration of oral contraceptive use", clear
signrank case = control

use "C:\Users\a0050726\Downloads\SCCS2_ethnic", clear
histogram hdl, normal by(ethnic)

oneway hdl ethnic, tabulate

use "C:\Users\a0050726\Downloads\headache activity", clear
kwallis reduction, by(group)
