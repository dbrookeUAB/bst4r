***************************************************;
* demonstrate the t distribution function          ;
***************************************************;

* use the CDF function to find cumulative probabilities under the curve         ;
* this finds the area between -infinity to the specified value of x (left tail) ;

data cumulative;
	x = -3.99;
	area = cdf('T',x,47);    *specify distribution, t value, degrees of freedom;
	uppertail = 1-area;
run;
proc print data=cumulative;
	title 'value of x and cumulative probability';
	title2 ' ';
run;


********************************************************************************;
* use the TINV function to find Xp, such that the area to the left of Xp is p   ;
********************************************************************************;
data inverse;
	area = 0.975;                 * specify the area to the left of x;
	x = tinv(area,47);            * find x;
run;
proc print data=inverse;
	title 'value of x and area to its left';
	title2 ' ';
run;
