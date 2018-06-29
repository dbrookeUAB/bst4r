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
