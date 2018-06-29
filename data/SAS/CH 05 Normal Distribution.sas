***********************************************;
* demonstrate the normal distribution function ;
***********************************************;

* use the CDF function to find cumulative probabilities under the curve         ;
* this finds the area between -infinity to the specified value of x (left tail) ;

data cumulative;
	x = 75;
	area = cdf('NORMAL',x,100,15);    *specify distribution, value, mean, and standard deviation;
run;
proc print data=cumulative;
	title 'value of x and cumulative probability';
	title2 ' ';
run;


* use the CDF function to find cumulative probabilities under the curve ;
* this finds the area between the specified value of x and infinity     ;

data righttail;
	x = 75;
	area = cdf('NORMAL',x,100,15);    *specify distribution, value, mean, and standard deviation;
	uppertail = 1-area;
run;
proc print data=righttail;
	title 'value of x, cumulative probability, and right tail';
	title2 ' ';
run;


















********************************************************************************;
* use the PROBIT function to find Zp, such that the area to the left of Zp is p ;
* note that this only works for the standard normal distribution                ;
********************************************************************************;
data inverse;
	area = 0.875;                 * specify the area to the left of x;
	z = probit(area);             * find x;
run;
proc print data=inverse;
	title 'value of z and area to its left';
	title2 ' ';
run;



************************************************************************;
* use the CDF function to find cumulative probabilities under the curve ;
* between two points.                                                   ;
************************************************************************;

data cumulative;
	x1 = 110;
	x2 = 40;
	area1 = cdf('NORMAL',x1,70,15);    *specify distribution, value, mean, and standard deviation;
	area2 = cdf('NORMAL',x2,70,15);
	diff = area1 - area2;
run;
proc print data=cumulative;
	title 'value of x and cumulative probability';
	title2 ' ';
run;









**********************************************************************************************;
* look at the plots of different normal distributions, depending on their means and variances ;
**********************************************************************************************;

%let mu = 0;                            * define global variables mu and sigma - no need to respecify below;
%let sigma = 1;                         * define global variables mu and sigma - no need to respecify below;

data temp;
	do x = -5 to 5 by .01;
	fx = pdf('NORMAL',x,&mu,&sigma);    * uses the global values mu and sigma from above;
	cx = cdf('NORMAL',x,&mu,&sigma);    * uses the global values mu and sigma from above;
	output;
	end;
run;

symbol c=blue w=5 i=join;
proc gplot data=temp;
	plot fx*x;
	title "pdf of the normal distribution";
	title2 "mean &mu and standard deviation &sigma";
run;

symbol c=red w=5 i=join;
proc gplot data=temp;
	plot cx*x;
	title "cdf of the normal distribution";
	title2 "mean &mu and standard deviation &sigma";
run;
