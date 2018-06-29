libname in 'U:\BST 621\data';

data temp;
	set in.malignant_melanoma;
run;

* by default, SAS will plot a "+" for each (x,y) pair;
proc gplot data=temp;
	plot mortality*latitude;
run; quit;

* use the symbol option to display a dot instead;
symbol1 value=dot;
proc gplot data=temp;
	plot mortality*latitude;
	title 'Malignant Melanoma Example';
run; quit;

* procedure for determining correlation;
proc corr data=temp;
	var mortality latitude;
	title 'Correlation';
run; quit;

* procedure for ordinary least squares regression;
proc reg data=temp;
	model mortality = latitude;
	title 'regression model';
run; quit;

* examine residuals versus x;
symbol1 value=dot;
proc reg data=temp;
	model mortality = latitude;
	plot residual.*latitude ;
	title 'Residual * X';
run; quit;

* examine residuals versus predicted values of y;
symbol1 value=dot;
proc reg data=temp;
	model mortality = latitude;
	plot residual.*predicted. ;
	title 'Residual * Predicted';
run; quit;

****************************************;
* prepare dataset for the ocean variable;
****************************************;
proc freq data=temp;
	table ocean;
	title 'distribution of the ocean variable';
run;

data temp2;
	set temp;
	if ocean = 'yes' then oceandum=1;
	if ocean = 'no' then oceandum=0;
run;

* procedure for ordinary least squares regression;
proc reg data=temp2;
	model mortality = latitude oceandum;
	title 'regression model with latitude and ocean';
run; quit;



******************************************************;
* plot separate lines for the ocean and non-ocean data;
******************************************************;
data temp3;
	set temp2;
	if ocean='yes' then mr1 = mortality; else mr1 = .;
	if ocean='no' then mr2 = mortality; else mr2 = .;
run;
proc sort data=temp3;
	by latitude mr1 mr2;
run;
symbol1 value=dot color=red i = rl;   * red line is ocean;
symbol2 value=dot color=black i=rl;
proc gplot data=temp3; 
	plot mr1*latitude mr2*latitude/overlay;
	title 'overlaid plots';
run; quit;
	
