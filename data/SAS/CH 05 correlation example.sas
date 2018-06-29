*********************************************************************;
* look at the correlation between income and debt                    ;
*********************************************************************;

libname in 'U:\BST 621\data';

proc corr data=in.family;
	var totaldebt income_1;
	title 'correlation between total debt and primary income';
run;

proc gplot data=in.family;
	plot totaldebt*income_1;
	title 'scatterplot of total debt by primary income';
run; quit;



** redefine what the plotting symbols look like;
symbol v=dot c=blue w=2;
proc gplot data=in.family;
	plot totaldebt*income_1;
	title 'scatterplot of total debt by primary income';
run; quit;
