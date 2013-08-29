// Task 1: open new log file
log using pr_aug29.smcl, replace
// change directory
cd C:\Users\a0050726\Downloads\CO5103
// import myopia.csv
import delimited C:\Users\a0050726\Downloads\CO5103\myopia.csv, clear 
// Task 2: change variable label
label variable ptno "Patient identification number" 
label variable age "Year" 
label variable gender "Gender"
label variable nearwk "Hours spent on near work activities" 
label variable height "Height(m)" 
label variable weight "Weight(kg)"
label variable myopia "presence of myopia" 
label variable grade "Severity of myopia"
// Task 3: Provide value labels for myopia where code 1 = Yes and 0 = No, and gender where code
// 1 = Male and 2 = Female.
label define myopia 1 "Yes" 0 "No"
label values myopia myopia
label define gender 1 "Mail" 0 "Female"
label values gender gender
// Task 4: Recode nearwk = 2 hours to nearwkgrp = 1 and nearwk < 2 hours to nearwkgrp = 2.
// Create value labels and variable label for nearwkgrp.
recode nearwk (min/1.99=2) (2/max=1), generate(nearwkgrp)
// Task 5: Summarise the following characteristics of study subjects using appropriate statistics and
// graphical representation:
// 5.i
summarize age, detail
histogram age
// 5.ii
generate bmi=weight/height/height
summarize bmi, detail
histogram bmi
// 5.iii
tab myopia
graph pie, over(myopia)
// 5.iv
tab gender
graph pie, over(gender)
// 5.v
summarize nearwk
histogram nearwk, percent normal xlabel(,valuelabel)
// Task 6: Summarise the following characteristics according to whether or not the subjects have
// myopia using appropriate statistics and graphical representation
// i
by myopia, sort:summarize age, detail
histogram age, percent normal xlabel(,valuelabel) by(myopia)
// ii
by myopia, sort:summarize nearwk, detail
histogram nearwk, percent normal xlabel(,valuelabel) by(myopia)
