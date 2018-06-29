options pageno=1;

data temp2;
	input outcome $ count;
	datalines;
	yes 6
	no	4
	;
run; 

** default confidence limits are the asymptotic and Exact ;
**(Clopper-Pearson) confidence limits for a binomial proportion;
proc freq data=temp2 order=data;
	weight count;
	table outcome/binomial  ;
	title 'test whether probability of success is 0.50';
run;

** EXACT option	gives the exact confidence limits ;
proc freq data=temp2 order=data;
	weight count;
	table outcome/binomial  ;
	exact binomial ;
	title 'test whether probability of success is 0.50';
run;





data binomial_pdf;
	n = 10;
	pi = .5;
	do i = 0 to 10;
		x = i;
		prob = pdf('Binomial',x,pi,n);
	output;
	end;
run;
proc print; 
	title 'individual probabilities';
run;















** perform the test for a different population probability under the null hypothesis ;
** here we consider 0.60                                                             ;
proc freq data=temp2 order=data;
	weight count;
	table outcome/binomial(p=.6);
	exact binomial ;
	title 'test whether probability of success is 0.60';
run;


/*
data temp;
	wald = 1-cdf('chisq',.417,1);
	score = 1 - cdf('chisq',.40,1);
	lrt = 1 - cdf('chisq',.403,1);
run;
proc print; title ' '; run;
