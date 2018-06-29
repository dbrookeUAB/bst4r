**************************************************************************;
** Eight volunteers were divided into equally sized groups of 4 to see if ;
** a telescopic sight improves the ability to hit a target under twilight ;
** conditions.  Group A used the telescopic sites while Group B used      ;
** open sites.  After training, all volunteers were given a shooting test ;
** and their scores were recorded (0-100 with 100 being perfect).         ;
** Determine whether the telescopic sites result in improved performance  ;
** over open sites.                                                       ;
**************************************************************************;

data sites;
	input x group $;
	datalines;
96	A
93	A
88	A
85	A
89	B
83	B
80	B
77	B
;
run;

proc npar1way data=sites wilcoxon;
	class group;
	var x;
	title 'Rank Sum Test for Independent Groups';
run;
