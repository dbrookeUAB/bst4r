libname in 'U:\BST 621\data';
title ' ';
data fam;
	set in.family;
run;

proc freq data=fam;
	table city;
run;

proc univariate data=fam normal;
	var  income_1;
	histogram;
	where city = 1;
	title 'income for city 1';
run;
proc univariate data=fam normal;
	var  income_1;
	histogram;
	where city = 2;
	title 'income for city 2';
run;


data fam2;
	set fam;
	ln_income1 = log(income_1);
run;
proc univariate data=fam2 normal;
	var  ln_income1;
	histogram;
	where city = 1;
	title 'ln(income) for city 1';
run;
proc univariate data=fam2 normal;
	var  ln_income1;
	histogram;
	where city = 2;
	title 'ln(income) for city 2';
run;

proc ttest data=fam;
	class city;
	var income_1;
	where city in (1,2);
	title 't-test for income';
run;
proc ttest data=fam2;
	class city;
	var ln_income1;
	where city in (1,2);
	title 't-test for ln(income)';
run;
