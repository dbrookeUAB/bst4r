*********************************************************************;
* import the data set from the appropriate library before proceeding ;
*********************************************************************;

libname in 'U:\BST 621\data';

* view details of the data file;
proc contents data=in.family;
run;


data in.temp1;
	set in.family;
	newvariable = income_1 + income_2;
run;

* assign labels to specific values to be used for the city variable;
proc format;
value city 1='Birmingham'
           2='Leeds'
		   3='Alabaster'
		   4='Irondale';
run;

data temp;
	set in.family;
	format city city.;
run;

proc contents data=temp;
run;

********************************************************;
* graphical displays - the crude way                    ;
* choose appropriate methods for display                ;
********************************************************;
proc chart data=in.family;
	vbar city;
	title "Bar Chart for City of Residence";
run; quit;

** same chart but label the values;
proc chart data=in.family;
	vbar city;
	title "Bar Chart for City of Residence";
	format city city.;
run; quit;


proc chart data=in.family;
	hbar city;
	title "Horizontal Chart for City of Residence";
run; quit;

proc chart data=in.family;
	pie city;
	title "Pie Chart for City of Residence";
run; quit;

proc chart data=temp;
	pie city;
	title "Pie Chart for City of Residence";
run; quit;


********************************************************;
* graphical displays - better looking figures           ;
* choose appropriate methods for display                ;
********************************************************;
proc gchart data=in.family;
	vbar city;
	title "Bar Chart for City of Residence";
run; quit;
proc gchart data=in.family;
	hbar city;
	title "Horizontal Chart for City of Residence";
run; quit;
proc gchart data=in.family;
	pie city;
	title "Pie Chart for City of Residence";
run; quit;






proc univariate data=in.family;
	var income_1;
	histogram;
	title 'distribution and histogram for primary wage earner';
run; quit;

proc univariate data=in.family;
	var totaldebt;
	histogram;
	title 'distribution and histogram for total debt';
run; quit;

* get stem and leaf and boxplot from PROC UNIVARIATE;
proc univariate data=in.family plot ;
	var income_1 totaldebt;
	title 'distributions of income and debt';
run;

* get stem and leaf and boxplot from PROC UNIVARIATE;
* in version 9.4, the default HTML output excludes the stem and leaf plot;
ods graphics off;
proc univariate data=in.family plot ;
	var income_1 totaldebt;
	title 'distributions of income and debt';
run;
ods graphics on;



proc gplot data=in.family;
	plot totaldebt*income_1;
	title 'scatterplot of total debt by primary income';
run; quit;


* modify histogram from PROC UNIVARIATE;
proc univariate data=in.family ;
	var totaldebt;
	histogram / midpoints =1500 to 20500 by 500;
	title 'distribution of total debt';
run;


* modify histogram from PROC UNIVARIATE;
proc univariate data=in.family ;
	var totaldebt;
	histogram / midpoints =1500 to 20500 by 1000;
	title 'distribution of total debt';
run;

* modify histogram from PROC UNIVARIATE;
proc univariate data=in.family ;
	var totaldebt;
	histogram / midpoints =1500 to 20500 by 1000;
	title 'distribution of total debt';
run;


* get stem and leaf and boxplot from PROC UNIVARIATE;
proc univariate data=in.family ;
	var totaldebt;
	histogram / midpoints =2000 to 20000 by 2000;
	title 'distribution of total debt';
run;
proc freq data=in.family;
	table totaldebt;
run;
proc freq data=in.family;
	table city;
run;
proc means data=in.family n q1 median q3;
	var totaldebt;
run;
proc means data=in.family;
	var totaldebt;
run;

proc means data=in.family;
	var totaldebt income_1 income_2;
run;
























** show differences between types of boxplots - added 9/1/15;
proc sort data=in.family;
	by city;
run;

** default style is "skeletal" where the whiskers are drawn from the quartiles to the extreme values;
proc boxplot data=in.family;
	plot totaldebt*city;
	title 'side by side boxplots with PROC BOXPLOT';
run;
** in the schematic style, whiskers are drawn to the most extreme values within the fence (defined by 1.5 IQRs beyond Q1 and Q3);
** observations beyond the fences are marked with symbols to indicate they lie beyond; 
proc boxplot data=in.family;
	plot totaldebt*city / boxstyle=schematic;
	title 'side by side boxplots with PROC BOXPLOT (schematic style)';
run;


data temp;
	set in.family;
	groupvar=1;
run;
proc boxplot data=temp;
	plot totaldebt*groupvar;
run;

axis1 label=none value=none major=none;
proc boxplot data=temp;
	plot totaldebt*groupvar/haxis=axis1;
run;
















****************************************************************;
* summary statistics for variables in the data set              ;
****************************************************************;


* the FREQ procedure is used for categorical (qualitative variables);
proc freq data=in.family;
	table city;
	title 'frequencies of each city';
run;

proc freq data=in.family;
	table own_home;
	title 'frequencies of home ownership';
run;

proc freq data=in.family;
	table city*own_home;
	title 'frequiencies of home ownership in each city';
run;

proc freq data=in.family;
	table income_1;
	title 'frequencies of primary income';
run;

* the MEANS procedure is used for quantitative variables;
* note what is presented as default output              ;
proc means data=in.family;
	var income_1 income_2 totaldebt;
	title 'means and standard deviations of income and debt';
run;

* we may specify alternative descriptive statistics ;
proc means data=in.family n median q1 q3;
	var income_1 income_2 totaldebt;
	title 'median and IQR of income and debt';
run;

* note that we can only get a few specific quantiles from PROC MEANS;
* if we want to view more quantiles, consider PROC UNIVARIATE       ;
proc univariate data=in.family;
	var income_1 income_2 totaldebt;
	title 'distributions of income and debt';
run;

proc format;
value yn 1 = 'yes'
         0 = 'no';
run;

ods rtf file= 'U:\BST 621\2014\proc freq example.rtf';
proc freq data=in.family;
	table city*own_home;
	format own_home yn.;
	title 'frequiencies of home ownership in each city';
run;
ods rtf close;
