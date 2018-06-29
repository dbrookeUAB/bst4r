data painmeds;
	input drug minutes;
	datalines;
1	30
1	35
1	40
1	25
1	35
2	25
2	20
2	30
2	25
2	30
3	15
3	20
3	25
3	20
3	20
;
run;

proc boxplot data=painmeds;
	plot minutes*drug;
run;
proc means data=painmeds;
	class drug;
	var minutes;
run;

proc anova data=painmeds;
	class drug;
	model minutes = drug;
run; quit;

proc glm data=painmeds;
	class drug;
	model minutes = drug;
run; quit;


proc anova data=painmeds;
	class drug;
	model minutes = drug;
	means drug/lsd cldiff;
run; quit;

proc glm data=painmeds;
	class drug;
	model minutes = drug;
	means drug/lsd cldiff;
	contrast '1 vs 2' drug 1 -1 0;
	contrast '1 vs 3' drug 1 0 -1;
	contrast '2 vs 3' drug 0 1 -1;
run; quit;

proc glm data=painmeds;
	class drug;
	model minutes = drug;
	means drug/lsd cldiff;
	contrast '3 = mean of 1 and 2' drug .5 .5 -1;
	contrast '3 = mean of 1 and 2 b' drug 1 1 -2;
run; quit;


data tval;
	t = 3.80;
	*t = 2.425;
	lowertail = cdf('T',t,12);
	uppertail = 1-lowertail;
	p = 2*uppertail;
run;
proc print; run;


data fval;
	f = 14.44;
	lowertail = cdf('F',f,1,12);
	uppertail = 1-lowertail;
run;
proc print; run;




proc glm data=painmeds;
	class drug;
	model minutes = drug;
	means drug/lsd cldiff;
	contrast 'trend 1' drug -1 0 1;
	contrast 'trend 2' drug 1 0 -1;
run; quit;
