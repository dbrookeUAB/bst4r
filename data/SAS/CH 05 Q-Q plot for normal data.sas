*************************************************************************;
** this program is used to create a Q-Q plot for the death rate variable ;
** in the dataset titled "bthdth92"                                      ;
*************************************************************************;

libname in 'U:\BST 621\data';

* input the dataset with birth and infant death rates for all US states in 1992;
data temp;
	set in.bthdth92;
run;


********************************************************;
* are the data normally distributed?                    ;
********************************************************;
proc sort data=temp;
	by death;
run;

data temp2;
	set temp;
	by death;
	i = _n_;                       * denote 'i' as the ordered value     ;
	p = (i - .5)/51;               * determine the cumulative probability;
	q = quantile('NORMAL',p,0,1);  * determine the quantile              ;
run;

ods rtf file='U:\BST 621\2015\QQplot example.rtf';
symbol1 v=dot c=blue w=2;
proc gplot data=temp2;
	plot death*q;
	title 'Q-Q plot for infant death rate';
run; quit;
ods rtf close;



















* PROC UNIVARIATE can be used to produce the plot, but restricted to the normal distribution;
proc univariate data=temp;
	var death;
	qqplot;
	title 'q-q plot for death rate';
run;

