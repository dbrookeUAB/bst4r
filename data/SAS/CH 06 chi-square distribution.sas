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




*******************************************************************************************************;
* look at the plots of different chi-square distributions, depending on their degrees of freedom       ;
*******************************************************************************************************;

%let df = 50;

data temp;
	do x = 0 to 50 by .01;
	fx = pdf('CHISQARE',x,&df);
	cx = cdf('CHISQARE',x,&df);;
	output;
	end;
run;

ods rtf file = "U:\BST 621\2015\notes\chisquare distribution example &df..rtf";
axis1 minor=none label=(angle=90 "f(x)") order=(0 to 0.5 by 0.05);
symbol1 c=black w=2 i=join;
symbol2 c=red w=2 i=join;
proc gplot data=temp;
	plot fx*x/vaxis=axis1 ;;
	title "pdf of the chi-square distribution";
	title2 "degrees of freedom &df";
run;
ods rtf close;
