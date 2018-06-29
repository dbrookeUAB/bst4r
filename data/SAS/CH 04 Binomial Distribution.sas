*************************************************;
* determine binomial probabilities using the PDF ;
* and CDF functions.                             ;
*************************************************;

data binomial_pdf;
	total = 10;
	pi = .5;
	x = 0;
	prob = pdf('Binomial',x,pi,total);
run;
proc print; 
	title 'individual probabilities';
run;
/* 
equivalent R code for cumulative probability function, of the form dbinom(x,n,pi)dbino

> # Use this for Binomial Cumulative Probabilities
> dbinom(3,10,.5)

end comment about R
*/



data binomial_cdf;
	n = 10;
	pi = .5;
	x = 3;
	cprob = cdf('Binomial',x,pi,n);
	uppertail = 1-cprob;
run;
proc print; 
	title 'cumulative probabilities';
run; quit;

/* 
equivalent R code for cumulative probability function, of the form pbinom(x,n,pi)dbino

> # Use this for Binomial Cumulative Probabilities
> pbinom(3,10,.5)

end comment about R
*/


data binomial_pdf;
	n = 10;
	pi = .5;
	x = 3;
	prob = pdf('Binomial',x,pi,n);
run;
proc print; 
	title 'individual probabilities';
run;





data binomial_pdf;
	n = 10;
	pi = .5;
	x = 2;
	prob = pdf('Binomial',x,pi,n);
run;
proc print; 
	title 'individual probabilities';
run;
data binomial_pdf;
	n = 10;
	pi = .5;
	x = 1;
	prob = pdf('Binomial',x,pi,n);
run;
proc print; 
	title 'individual probabilities';
run;
data binomial_pdf;
	n = 10;
	pi = .5;
	x = 0;
	prob = pdf('Binomial',x,pi,n);
run;
proc print; 
	title 'individual probabilities';
run;










*************************************************;
* determine Poisson probabilities using the PDF  ;
* and CDF functions.                             ;
*************************************************;

data Poisson_pmf_cdf;
	mu = 5;
	x = 1;
	pmf = pdf('Poisson',x,mu);   * Poisson pmf;
	cprob = cdf('Poisson',x,mu);  * Poisson cdf;
	uppertail = 1-cprob;
run;
proc print; 
	title 'exact and cumulative Poisson probabilities';
run; quit;
