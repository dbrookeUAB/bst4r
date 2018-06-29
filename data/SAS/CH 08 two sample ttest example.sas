libname in 'U:\BST 621\data';

* dataset student_test_data includes information on student demographics ;
* and standardized test scores                                           ;
data temp;
	set in.student_test_data;
run;

* examine the distributions of the 2 variables of interest (check for outliers and missing values);
proc freq data=temp;
	table female read;
run;

* we must first sort by the variable used to identify the different groups before we can use ;
* PROC MEANS to compute the sample statistics separately                                     ;
proc sort data=temp;
	by female;
run;

* get the sample mean and standard deviation for each group;
proc means data=temp;
	by female;       * use this 'by' statement to indicate the groups.  the datset should be sorted by this variable;
	var read;
run;

* test equality of population variances using the folded F statistic;
data pvalue;
	x = 1.091;                      * determine the value of the folded F statistic by ratio of sample variances;
	lowertail = CDF('F',x,90,108);  * get the cumulative probability of the F distribution (left tail) at this value of F;
	uppertail = 1 - lowertail;      * get the right tail probability;
	pvalue = uppertail*2;           * multiply by 2 to get the p-value;
run;
proc print; run;


* use PROC TTEST to perform the t-test so that we don't have to do it by hand;
proc ttest data=temp;
	class female;    * identify the groups being compared;
	var read;        * identify the variable whose mean is being evaluated;
	title '2-sample ttest for reading score by gender';
run;



****************************************;
* here consider the writing scores      ;
*                                       ;
* note that you will see a significant  ;
* result for the F test and the t-test  ;
****************************************;

* examine the distributions of the 2 variables of interest (check for outliers and missing values);
proc freq data=temp;
	table female write;
run;

ods graphics on;       * this is graphics option is available only in version >= 9.2;
proc ttest data=temp;
	class female;      * identify the groups being compared;
	var write;         * identify the variable whose mean is being evaluated;
	title '2-sample ttest for writing score by gender';
run;
ods graphics off;

* The graphics can be accessed by examining the results tab on the left hand side.  Open the menus so that they ;
* reveal the Summary Panel and Q-Q Plots.  These will allow for a visual assessment of the normality assumption ;
* for each of the samples.                                                                                      ; 












data temp2;
	set temp;
	if female=0 then female=2;
run;
proc ttest data=temp2;
	class female;
	var read;
	title '2-sample ttest for reading by gender, coding reversed - F statistic the same';
run;
