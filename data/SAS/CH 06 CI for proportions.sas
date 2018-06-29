*********************************************;
** text example 6.48, 6.49                   ;
**                                           ;
** we want to estimate the rate of bladder   ;
** cancer in rats fed a high saccharin diet. ;
** Consider a CI for the population rate.    ;
*********************************************;

options pageno=1;

data temp;
	input outcome $ count;
	datalines;
	yes 2
	no	18
	;
run; 

** default confidence limits are the asymptotic and Exact      ;
**(Clopper-Pearson) confidence limits for a binomial proportion;
proc freq data=temp order=data;
	weight count;
	table outcome/binomial  ;
	title 'observe the 95% confidence interval';
run;

proc freq data=temp order=data;
	weight count;
	table outcome/binomial  alpha=.01;
	title 'observe the 95% confidence interval';
run;
