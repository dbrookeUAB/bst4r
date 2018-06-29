*********************************************************;
* Fisher's exact test example: infant tooth misalignment ;
*********************************************************;


data teeth;
	input group $ teeth $ count;
	datalines;
	breast-fed	normal_teeth 4
	breast-fed	malocclusion 16
	bottle-fed	normal_teeth 1
	bottle-fed	malocclusion 21
	;
run;

proc freq data=teeth order=data ;
	weight count;
	table group*teeth/chisq;
	exact fisher;
	title 'Fisher Exact Test';
run; 




* use the hypergeometric distribution function to determine probabilities of the possible outcomes;
data hypergeometric_values;
	do i = 0 to 5;
		fx = pdf('hyper',i,42,20,5);  * identify the distribution, n11, N, n(1+), and n(+1);
		output;
	end;
run;
proc print data=hypergeometric_values; 
	title 'probabilities of each value of n11';
run;
