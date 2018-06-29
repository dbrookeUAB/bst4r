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

data inverse2;
	area = 0.975;                 * specify the area to the left of x;
	q = quantile('T',area,47);    * determine the quantile              ;

run;
proc print data=inverse2;
	title 'value of x and area to its left';
	title2 ' ';
run;

**********************************************************************************************;
* look at the plots of different t-distributions, depending on their degrees of freedom       ;
**********************************************************************************************;

%let df = 50;

data temp;
	do x = -10 to 10 by .01;
	fx = pdf('T',x,&df);
	cx = cdf('T',x,&df);
	normval = pdf('NORMAL',x,0,1);
	output;
	end;
run;

symbol c=black w=2 i=join;
proc gplot data=temp;
	plot fx*x;
	title "pdf of the t-distribution";
	title2 "degrees of freedom &df";
run;

symbol c=red w=5 i=join;
proc gplot data=temp;
	plot cx*x;
	title "cdf of the t-distribution with &df degrees of freedom";
run;


ods rtf file = "U:\BST 621\2015\notes\t distribution example &df..rtf";
axis1 minor=none label=(angle=90 "f(x)") order=(0 to .40 by 0.05);
symbol1 c=black w=2 i=join;
symbol2 c=red w=2 i=join;
proc gplot data=temp;
	plot fx*x normval*x/overlay vaxis=axis1 ;
	title "pdf of the t-distribution with &df degrees of freedom (black) ";
	title2 "compared to standard normal (red)";
run;
ods rtf close;
