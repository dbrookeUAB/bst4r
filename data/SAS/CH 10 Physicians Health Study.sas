***********************************;
* physician's health study example ;
***********************************;

data heart_study;
  input drug $ MI $ count;
	 datalines;
	 placebo yes 189
	 placebo no  10845
	 aspirin yes 104
	 aspirin no  10933
	 ;
run; quit;

proc freq data = heart_study order = data;
	weight count;
	tables drug*MI /  riskdiff;
	title 'Physicians Health Study';
run; quit;

proc freq data = heart_study order = data;
	weight count;
	tables drug*MI /  riskdiffc;
	title 'Physicians Health Study';
run; quit;

proc freq data = heart_study order = data;
	weight count;
	tables drug*MI / relrisk;
	title 'Physicians Health Study';
run; quit;



* switch the order of yes and no;
data heart_study2;
  input drug $ MI $ count;
	 datalines;
	 placebo no  10845
	 placebo yes 189
	 aspirin no  10933
	 aspirin yes 104
	 ;
run; quit;
proc freq data = heart_study2 order = data;
	weight count;
	tables drug*MI / relrisk;
	title 'Physicians Health Study - reversed';
run; quit;




proc freq data = heart_study order = data;
	weight count;
	tables drug*MI / chisq;
	title 'Physicians Health Study';
run; quit;
