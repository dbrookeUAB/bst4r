libname in 'U:\BST 621\data';
options pageno=1;

*******************************************************************;
** Programmer: Jeff Szychowski                                     ;
** Date: 1/14/16                                                   ;
** Purpose: This program illustrates the difference in conclusions ;
**          that can be made when correlation between 2 correlated ;
**          samples is ignored and an independent-sample t-test is ;
**          used when a paired t-test should be used.              ;
*******************************************************************;

*********************************;
** the proper analysis           ;
*********************************;
proc means data=in.LDLexample_paired;
	var evaluation1 evaluation2;
	title ' ';
run;


proc ttest data=in.LDLexample_paired;
	paired evaluation1*evaluation2;
	title 'paired ttest for LDL change over evaluation periods';
run;


*********************************;
** the wrong analysis            ;
*********************************;
proc ttest data=in.LDLexample_ind;
	class evaluation;    * identify the groups being compared;
	var y;               * identify the variable whose mean is being evaluated;
	title '2-sample ttest for LDL differences between evaluation periods';
run;

