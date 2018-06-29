
* illustrate the relationship between tail probabilities and degrees of freedom;
data pvalue;
	df1 = 2;
	df2 = 23;
	x = 10.23;                       * designate a value of F;
	lowertail = CDF('F',x,df1,df2); * get the cumulative probability of the F distribution (left tail) at this value of F;
	uppertail = 1 - lowertail;      * get the right tail probability: P(F > x| df1 and df2);

	* now find the lower tail probability P(F < 1/x| df2 and df1);
	flipit = 1/x;
	lowertail_flip = CDF('F',flipit,df2,df1);  * note here that df1 and df2 are reversed;

run;
proc print; run;

data inverse;
	area = 0.95;                 * specify the area to the left of x;
	x = finv(area,2,23);            * find x;
run;
proc print; run;

* illustrate the relationship between tail probabilities and degrees of freedom;
data pvalue;
	df1 = 11;
	df2 = 9;
	x = 1.34;                       * designate a value of F;
	lowertail = CDF('F',x,df1,df2); * get the cumulative probability of the F distribution (left tail) at this value of F;
	uppertail = 1 - lowertail;      * get the right tail probability: P(F > x| df1 and df2);

	* now find the lower tail probability P(F < 1/x| df2 and df1);
	flipit = 1/x;
	lowertail_flip = CDF('F',flipit,df2,df1);  * note here that df1 and df2 are reversed;

run;
proc print; run;



* illustrate the relationship between tail probabilities and degrees of freedom;
data pvalue;
	df1 = 9;
	df2 = 11;
	x = 2.90;                       * designate a value of F;
	lowertail = CDF('F',x,df1,df2); * get the cumulative probability of the F distribution (left tail) at this value of F;
	uppertail = 1 - lowertail;      * get the right tail probability: P(F > x| df1 and df2);

	* now find the lower tail probability P(F < 1/x| df2 and df1);
	flipit = 1/x;
	lowertail_flip = CDF('F',flipit,df2,df1);  * note here that df1 and df2 are reversed;

run;
proc print; run;
