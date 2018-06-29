* Infant Malformation Example ;

data drinking;
     length malformation drinks $12 count 8;
     input malformation drinks count;
	 datalines;
	 absent  0  17066
	 absent <1  14464
	 absent >=1 951
	 present  0  48
	 present <1  38
	 present >=1 7
	 ;
run;

* general form of the test for trend;
proc freq data = drinking order=data;
     weight count;
	 tables malformation*drinks/chisq;
run;
