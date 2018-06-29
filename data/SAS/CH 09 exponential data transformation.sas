data expondat;
	do i = 1 to 1000;
	x = ranexp(5);
	output;
	end;
run;


proc univariate data=expondat plots normal;
	var x;
run;

data transformdat;
	set expondat;
	lnx = log(x);
	sqrtx = sqrt(x);
	invx = 1/x;
run;

proc univariate data=transformdat plots normal;
	var lnx;
	title 'log x';
run;
proc univariate data=transformdat plots normal;
	var sqrtx;
	title 'square root x';
run;
proc univariate data=transformdat plots normal;
	var invx;
	title 'inverse x';
run;
