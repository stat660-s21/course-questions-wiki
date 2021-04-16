*******************************************************************************;
**************** 80-character banner for column width reference ***************;
* (set window width to banner width to calibrate line length to 80 characters *;
*******************************************************************************;


*******************************************************************************;
* SAS Recipe: summarizing-quantitative-values ;
*******************************************************************************;

/*Question: What is this code computing?
Answer: It is creating a frequency table or cross tabulation 
for Species and PetalWidth variables  */
proc freq
		nlevels
		data=sashelp.iris
	;
	table
		Species*PetalWidth
		/missing norow nocol nopercent
	;
run;

/*Question: What is this proc means code computing?
Answer: Since it was not specified, this code will print the default which
includes the number of observations, mean, standard deviation, minimum, maximum
upto one deciminal point including missing rows.*/

proc means
		data=sashelp.iris
		maxdec=1
		missing
	;
	class
		Species
		PetalWidth
	;
	var
		SepalLength
		SepalWidth
	;
run;
/*Question: What is this code computing?
Answer: It's formatting the values first for Species and PetalWidth 
before creating the cross tabulation.*/

proc format;
	value $Species_bins
		"Versicolor","Virginica"="Versicolor & Virginica (combined)"
		other="Not Versicolor or Virginica"
	;
	value PetalWidth_bins
		low-9="Small Petal Width"
		10-18="Medium Petal Width"
		19-high="Large Petal Width"
	;
run;
proc freq
		nlevels
		data=sashelp.iris
		;
		table
			Species*PetalWidth
			/missing list
		;
		format
			Species $Species_bins.
			PetalWidth PetalWidth_bins.
		;
run;
