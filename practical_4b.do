cd C:\users\a0050726\Downloads
log using pr_oct26.smcl, replace
use "C:\Users\a0050726\Downloads\Sridhar et al (26Oct13)", clear

stset time, failure(status==1) scale(1)
// survivor function
sts list, by(extent)
// summarys
stsum, by(extent)
// logrank test
sts test extent, logrank

sts graph, by(extent) risktable risktable(, failevents) ytitle(cumulative survival probability) xtitle(Survival time(years))

// log rank trend test
use "C:\Users\a0050726\Downloads\Chong et al (26Oct13)", clear
sts test TarDy, logrank trend
sts graph, failure by(TarDy) xtitle(survival time(years)) ylabel(0(0.05)0.25)
