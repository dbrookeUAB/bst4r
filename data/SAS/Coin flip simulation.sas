********************************************************************************************;
* This program illustrates the long-term chances of observing 'Heads' on a coin flip.       ;
* Randomly sample from a Bernoulli (0.50) distribution and record the number of 1's.  Then  ;
* determine the proportion of 1's observed.  Keep a running total so that it may be plotted ;
*                                                                                           ;
* Programmer: Jeff Szychowski                                                               ;
* Date: 8/29/11                                                                             ;
* For: BST 621 notes, Fall 2011                                                             ;
********************************************************************************************;

%let seed = 20110829;   * start with some random seed number so that results can be replicated;
%let size = 1000;     * change the total number of coin tosses you want to consider;

data temp;
	seed = &seed;
	count = 0;           * start with 0 total 1's;
	do i = 1 to &size;
		toss = i;
		call ranbin(seed, 1, .5, flip);	 * toss the coin;
		count = count + flip;            * total 1's;
		prop = count/toss;	                 * determine the running proportion of 1's;
		l = .5;	                         * keep a contant at 0.50 for plotting a reference line;
		output;
	end;
run;

/*
proc print data=temp; 
run;
*/

* the GOPTIONS are all variable.  PNG files are easier than TIFF files to deal with;
GOPTIONS RESET=ALL
         DEVICE=png
         GSFMODE=REPLACE
         gsfname=GRAPH01
         ftext='Arial'
         htext=12pt
		 lfactor=3
		 xpixels=7200 ypixels=4800 xmax=6 in ymax=4 in;

FILENAME GRAPH01 "U:\BST 621\notes\cointoss &size..tif";

axis1 minor=none label=(angle=90 "Proportion of Heads") order=(0 to 1 by .10);
axis2 minor=none label=("Total Coin Tosses");

symbol1 value=none  c=red i=line w=1;
symbol2 value=none c=black i=join w=.5;

proc gplot data=temp;
	plot prop*toss l*toss/overlay vaxis=axis1 haxis=axis2;
	title "Long-Term Proportion of Heads Tossed";
	title2 "Total of &size Coin Tosses";
run;
