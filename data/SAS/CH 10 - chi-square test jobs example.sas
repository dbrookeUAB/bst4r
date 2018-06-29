

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











