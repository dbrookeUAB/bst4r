data tea;
	input truth $ guess $ count;
	datalines;
milk	milk 3
milk	tea	1
tea		milk	1
tea		tea	3
;
run;

proc freq data=tea order=data ;
	weight count;
	table truth*guess/chisq;
	exact fisher;
	title 'Fisher Exact Test';
run; 




* use the hypergeometric distribution function to determine probabilities of the possible outcomes;
data hypergeometric_values;
	do i = 0 to 4;
		fx = pdf('hyper',i,8,4,4);  * identify the distribution, n11, N, n(1+), and n(+1);
		output;
	end;
run;
proc print data=hypergeometric_values; 
	title 'probabilities of each value of n11';
run;
