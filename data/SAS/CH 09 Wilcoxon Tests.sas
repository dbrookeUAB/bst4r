data signdat;
	input x;
	datalines;
20.2
40
32.2
30.5
26.5
42.1
39
45.6
42.1
29.9
40.9
;
run;
proc univariate data=signdat;
	var x;
	title 'Signed Rank Test for M=0';
run;


data signdat2;
	set signdat;
	x2 = x-40;
run;
proc univariate data=signdat2;
	var x2;
	title 'Signed Rank Test for M=40';
run;
proc univariate data=signdat2 mu0=40;
	var x;
	title 'Signed Rank Test for M=40';
run;


* Dr. A and Dr. B both count palpable lymph nodes on the same patients;
data lymphnodes;
	input A B diff;
	datalines;
4	1	3
17	9	8
3	2	1
11	13	-2
12	9	3
5	2	3
5	6	-1
6	3	3
3	0	3
5	0	5
9	6	3
1	1	0
5	4	1
8	4	4
7	7	0
8	6	2
4	1	3
12	9	3
10	7	3
9	11	-2
5	0	5
3	0	3
12	12	0
5	1	4
13	9	4
12	6	6
6	9	-3
19	9	10
8	4	4
15	9	6
6	1	5
5	4	1
;
run;
proc univariate data=lymphnodes;
	var diff;
	title 'Signed Rank Test for large sample';
run;












data temp3;
	input x group;
	datalines;
112	1
105	1
83	1
102	1
144	1
85	1
50	1
91	2
183	2
141	2
219	2
105	2
138	2
146	2
84	2
134	2
106	2
;
run;

proc npar1way data=temp3 wilcoxon;
	class group;
	var x;
	title 'Rank Sum Test for Independent Groups';
run;
