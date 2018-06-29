data signdat;
	input x;
	datalines;
20.2
40
32.2
30.5
26.5
42.1
39
45.6
42.1
29.9
40.9
;
run;
proc univariate data=signdat;
	var x;
	title 'Sign Test for M=0';
run;


data signdat2;
	set signdat;
	x2 = x-40;
run;
proc univariate data=signdat2;
	var x2;
	title 'Sign Test for M=40';
run;
proc univariate data=signdat2 mu0=40;
	var x;
	title 'Sign Test for M=40';
run;


data binomvals;
	lowertail = CDF('BINOMIAL',4,.5,10);
	pval = 2*lowertail;
run;
proc print data=binomvals;
	title 'binomial distribution values';
run;
