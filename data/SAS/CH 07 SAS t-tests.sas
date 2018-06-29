libname in 'U:\BST 621\data';

***************************************************************************;
* the birthweight dataset demonstrates the birthweights (in ounces) for 100;
* consecutive deliveries at a hospital.                                    ;
***************************************************************************;
data temp;
	set in.birthweight;
run;

* use this to determine the name of the variable of interest;
proc contents; 
run;

***************************************************************************;
* get the descriptive statistics                                           ;
***************************************************************************;
proc univariate data=temp;
	var bwt;
	title 'PROC UNIVARIATE OUTPUT';
run;

***************************************************************************;
* perform the t-test using PROC TTEST                                      ;
***************************************************************************;
proc ttest data=temp;
	var bwt;
	title 'PROC TTEST OUTPUT';
run;


***************************************************************************;
* is the mean different from 100?                                          ;
* 
* create a new variable for X-Mu(0)                                        ;
* then perform the t-test using PROC TTEST                                 ;
***************************************************************************;
data temp2;
	set temp;
	bwt_minusmu = bwt-100;
run;

proc ttest data=temp2;
	var bwt_minusmu;
	title 'PROC TTEST OUTPUT for new hypothesis test';
run;
proc univariate data=temp2;
	var bwt_minusmu;
	*title 'PROC univariate OUTPUT for new hypothesis test';
run;
quit;


***************************************************************************;
* is the mean different from 100?                                          ;
* 
* specify mu=100 in the null hypothesis                                    ;
* then perform the t-test using PROC TTEST                                 ;
***************************************************************************;
proc ttest data=temp h0=100;
	var bwt;
	title 'PROC TTEST OUTPUT for new hypothesis test';
run;
