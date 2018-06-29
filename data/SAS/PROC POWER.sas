**************************************************************;
* PROC POWER for sample size determination                    ;
* twosamplemeans identifies 2 sample t-test,                  ;
* test = diff indicates we want to test a difference in means ;
* meandiff  specifies the difference in the two means under H1;
* stddev allows listing of the group standard deviaitions     ;
**************************************************************;

** with a standard deviation of 50;
proc power;
	twosamplemeans 
	test=diff
	meandiff = 10
	stddev = 50
	alpha=0.05      
	power=.9
	npergroup=.; 
run;

* with a standard deviation of 60;
proc power;
	twosamplemeans 
	test=diff
	meandiff = 10
	stddev = 60
	alpha=0.05      
	power=.9
	npergroup=.; 
run;
