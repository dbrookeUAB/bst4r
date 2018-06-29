libname in 'U:\BST 621\data';

*******************************************************************;
** Programmer: Jeff Szychowski                                     ;
** Date: 1/14/16                                                   ;
** Purpose: This program illustrates the difference in conclusions ;
**          that can be made when correlation between 2 correlated ;
**          samples is ignored and an independent-sample t-test is ;
**          used when a paired t-test should be used.              ;
*******************************************************************;

data pairedsamples;
	seed1 = 12345;
	do i = 1 to 40;
		call rannor (seed1,y); 
		call rannor (seed1,error);
		x1 = 161 + y*8.5;
		x2 = -3 + x1 + error;
		output;
	end;
run;

data temp (rename = (x1 = evaluation1 x2=evaluation2 i=id));
	set pairedsamples;
	keep x1 x2 i;
run;

proc ttest data=pairedsamples;
	paired x1*x2;
run;

proc means data=pairedsamples;
	var x1 x2;
run;

data set1 (rename = (x1 = y  i=id));
	set pairedsamples;
	evaluation = 1;
	keep evaluation x1 i;
run;
data set2 (rename = (x2 = y  i=id));
	set pairedsamples;
	evaluation = 2;
	keep evaluation x2 i;
run;

data indsamples;
	set set1 set2;
run;


* use PROC TTEST to perform the t-test ;
proc ttest data=indsamples;
	class evaluation;    * identify the groups being compared;
	var y;               * identify the variable whose mean is being evaluated;
	title '2-sample ttest for outcome by evaluation period';
run;

data in.LDLexample_paired;
	set temp;
run;
data in.LDLexample_ind;
	set indsamples;
run;
