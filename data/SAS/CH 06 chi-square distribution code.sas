***************************************************;
* demonstrate the chi-square distribution function ;
***************************************************;

* use the CDF function to find cumulative probabilities under the curve         ;
* this finds the area between -infinity to the specified value of x (left tail) ;

data cumulative;
	x = 28.54;
	area = cdf('CHISQUARE',x,47);    *specify distribution, value, mean, and standard deviation;
	uppertail = 1-area;
run;
proc print data=cumulative;
	title 'value of x and cumulative probability';
	title2 ' ';
run;


********************************************************************************;
* use the CINV function to find Xp, such that the area to the left of Xp is p   ;
********************************************************************************;
data inverse;
	area = 0.975;                 * specify the area to the left of x;
	x = cinv(area,50);            * find x;
run;
proc print data=inverse;
	title 'value of x and area to its left';
	title2 ' ';
run;
