

libname bst621 'U:\BST 621\data';

*************************************************************;
* value    = fasting serum insulin (microunits per mililiter ;
*          = number actually refer to ranges if x to x+1     ;
* gender   = gender of patient                               ;
*************************************************************;

data temp;
	set  bst621.vanbelle_t_3_15;
run;

proc freq data=temp;
	table value*gender/norow nocol nopercent ;   * omit the percentages from output;
	title 'distribution of serum insulin values';
run;

proc sort data=temp;
	by gender;
run;

proc univariate data=temp;
	by gender;
	var value;
	histogram;
	title 'histograms showing distribution of serum insulin by gender';
run;


***************************************************************;
* transform the values by taking natural logarithm             ;
***************************************************************;
data temp2;
	set temp;
	by gender;
	lvalue = log(value);            * the log() function performs the natural logarithm in SAS;
run;
proc univariate data=temp2;
	by gender;
	var lvalue;
	histogram;
	title 'histograms showing distribution of ln(serum insulin) by gender';
run;

	













*************************************************************;
* Data may be entered directly, see example below            ;
*************************************************************;

*************************************************************;
* insulint = fasting serum insulin (microunits per mililiter ;
*          = counts actually refer to ranges if x to x+1     ;
* males    = number of males                                 ;
* females  = number of females                               ;
*************************************************************;
data serum_insulin_3_15;
	input insulin males females;
	datalines;
	7	1	3
	9	9	3
	11	20	9
	13	32	21
	15	32	23
	17	22	39
	19	23	39
	21	19	23
	23	20	27
	25	13	23
	27	8	19
	29	8	14
	31	8	11
	33	4	10
	35	4	8
	37	3	7
	39	1	2
	41	1	3
	43	1	1
	45	6	11
;
run;

proc freq data=serum_insulin_3_15;
	weight males;
	table insulin;
run;
proc freq data=serum_insulin_3_15;
	weight females;
	table insulin;
run;

proc sort data=serum_insulin_3_15;
	by insulin;
run;
