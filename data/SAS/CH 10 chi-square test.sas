data afterlife_2;
     input gender $ Belief $ count;
	 datalines;
	 female no/undec 116
	 female yes 509
	 male no/undec 104
	 male yes 398
	 ;
run; quit;

proc freq data = afterlife_2 order = data;
	     weight count;
		 tables gender*belief / chisq expected deviation cellchi2;
		 title 'belief in afterlife and gender';
run; quit;























data data1;
     input race $ job $ count;
	 datalines;
	 white	assembler	21
	 white	machinist	34
	 white	tech	63
	 black	assembler	23
	 black	machinist	25
	 black	tech	26
	 asian	assembler	3
	 asian	machinist	4
	 asian	tech	1
	 ;
run; quit;

proc freq data = data1 order = data;
	     weight count;
		 tables race*job/nocol norow expected chisq;
		 title 'Job/Race Investigation';
run; quit;
proc freq data = data1 order = data;
	     weight count;
		 tables race*job/ chisq;
		 exact chisq;
		 title 'Job/Race Investigation';
run; quit;



********************************************;
* illustration of collapsing rows           ;
* black and asian are grouped into minority ;
********************************************;
data data2;
     input race $ job $ count;
	 datalines;
	 white	assembler	21
	 white	machinist	34
	 white	tech	63
	 minority	assembler	26
	 minority	machinist	29
	 minority	tech	27
	 ;
run; quit;
proc freq data = data2 order = data;
	     weight count;
		 tables race*job/chisq norow nocol expected   ;
		 title 'Job/Race Investigation';
run; quit;
proc freq data = data2 order = data;
	     weight count;
		 tables race*job/chisq  expected   deviation;
		 title 'Job/Race Investigation';
run; quit;
proc freq data = data2 order = data;
	     weight count;
		 tables race*job/chisq  expected   deviation;
		 title 'Job/Race Investigation';
run; quit;











data afterlife_3;
     input gender $ Belief $ count;
	 datalines;
	 female yes 509
	 female no/undec 116
	 male yes 398
	 male no/undec 104
	 ;
run; quit;

proc freq data = afterlife_3 order = data;
	     weight count;
		 tables gender*belief / riskdiff ;
		 title 'belief in afterlife and gender';
run; quit;
proc freq data = afterlife_3 order = data;
	     weight count;
		 tables gender*belief /  riskdiffc;
		 title 'belief in afterlife and gender';
run; quit;
