
# Questions about Problems and Recipes



[Chapter 12 Quiz, Problem 3]
* Question (ypaulsen-stat660): What is a VALUE statement? 
* Answer (ypaulsen-stat660): The VALUE statement is used within PROC FORMAT to specify the display values to output: E.G. value gender 1='male' 2='female';


[Chapter 12 Quiz, Problem 4]
* Question (ypaulsen-stat660): What does the FORMAT procedure do? 
* Answer (ypaulsen-stat660): "Associates formats with variables." Affects only what is output, not what is stored.
*INFORMAT determines how values are stored. 

[Chapter 12 Quiz, Problem 5]
* Question (ypaulsen-stat660): What does the VALUE statement specify? 
* Answer (ypaulsen-stat660): It specifeis the output values displayed based on the values of the observations. 


[Chapter 12 Quiz, Problem 6]
* Question (ypaulsen-stat660): What is being labeled here?
* Answer (ypaulsen-stat660): Labels in that example are being applied to the variables in the VALUE statement. 


[Chapter 12 Quiz, Problem 7]
* Question (ypaulsen-stat660): What procedure or step are these keywords from? 
* Answer (ypaulsen-stat660): Those are being used in the VALUE statement to specify the ranges, etc of the values to dislpay.  


[Chapter 15 Quiz, Problem 4]
* Question (ypaulsen-stat660): Is this similar to group_by() in the R-package dplyr? 
* Answer (ypaulsen-stat660): Doesn't seem so, at least in as much as dplyr doesn'tr require sorted input. 


[Chapter 15 Quiz, Problem 5]
* Question (ypaulsen-stat660): How does by-group work with PROC MEANS?
* Answer (ypaulsen-stat660): It is similar to a CLASS statement except that the data must already be sorted into the relevant grouping and that it creates a table for each type of grouping whereas the CLASS statement produces just one table that summarizes the results. 


[Chapter 15 Quiz, Problem 6]
* Question (ypaulsen-stat660): Was that created with PROC FREQ or PROC MEANS?
* Answer (ypaulsen-stat660): It looks like an example that was given that was created with the means procedure. 


[Chapter 15 Quiz, Problem 9]
* Question (ypaulsen-stat660): What is the output of PROC FREQ?
* Answer (ypaulsen-stat660): Nicely displayed frequency tables and lists. 


[Chapter 15 Quiz, Problem 10]
* Question (ypaulsen-stat660): What are the differences here? 
* Answer (ypaulsen-stat660): A and C don't produce 2X2 contingency tables. It appears that the output included the code: nofreq norow nocol


[summarizing-qualitative-values Week 5 SAS Recipe]
* Question (ypaulsen-stat660): What does the nlevels option do here? 
* Includes an additional table with inforamation about the variables. 

[summarizing-qualitative-values Week 5 SAS Recipe]
* Question (ypaulsen-stat660): What does the var statement accomplish? 
* Selects variables to be displayed in the output. 

[temporarily-binning-values Week 5 SAS Recipe]
* Question (ypaulsen-stat660): Is PROC FORMAT storing some kind of global-level information that PROC FREQ recalls later? 

***


# Recipes Exploration Results


[summarizing-qualitative-values Week 5 SAS Recipe]

```
* Original code;   

proc freq 
		nlevels 
		data=sashelp.iris
	;
	table
		Species*PetalWidth
		/ missing norow nocol nopercent
	;
run;


* Remove options nocol nopercent; 

proc freq 
		nlevels 
		data=sashelp.iris
	;
	table
		Species*PetalWidth
		/ missing norow
	;
run;


* Remove option norow; 
* Very informative, if cluttered, output; 

proc freq 
		nlevels 
		data=sashelp.iris
	;
	table
		Species*PetalWidth
		/ missing 
	;
run;


* Create two tables: one for each variable;   

proc freq 
		nlevels 
		data=sashelp.iris
	;
	table
		Species PetalWidth
		/ missing norow nocol nopercent
	;
run;


* Create two tables: one for each variable - drop nocol, norow options;
* note: this does not change the output;  

proc freq 
		nlevels 
		data=sashelp.iris
	;
	table
		Species PetalWidth
		/ missing nopercent
	;
run;

* Original code minus nlevels statement ;   

proc freq 
		
		data=sashelp.iris
	;
	table
		Species*PetalWidth
		/ missing norow nocol nopercent
	;
run;

```

[summarizing-qualitative-values Week 5 SAS Recipe]

```


* Original code; 

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


* Original code: Remove CLASS statement; 
* Output here is a table with only two rows, one for each sekected variable;  

proc means 
		data=sashelp.iris
		maxdec=1
		missing
	;
	var
		SepalLength
		SepalWidth
	;
run; 


* Original code: remove VAR statement; 
* Output here matches original output except that it also includes the final variable: PetalLength; 

proc means 
		data=sashelp.iris
		maxdec=1
		missing
	;
	class
		Species
		PetalWidth
	;
run; 


* Original code: remove both CLASS and VAR statements; 
* A tabvle with four rows is created;  

proc means 
		data=sashelp.iris
		maxdec=1
		missing
	;
run; 


```

[temporarily-binning-values Week 5 SAS Recipe]

```

* Original code; 

proc format; 
	value $Species_bins 
		"Versicolor", "Virginica"="Versicolor & Virginica (combined)"
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
		/ missing list 
	;
	format
		Species $Species_bins. 
		PetalWidth PetalWidth_bins. 
	; 
run; 


* Original code: remove list option; 
* The output here is the same, but arranged differently;  

proc format; 
	value $Species_bins 
		"Versicolor", "Virginica"="Versicolor & Virginica (combined)"
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
		/ missing
	;
	format
		Species $Species_bins. 
		PetalWidth PetalWidth_bins. 
	; 
run; 


* Remove FORMAT statement from PROC FREQ step; 
* output unformatted;  

proc format; 
	value $Species_bins 
		"Versicolor", "Virginica"="Versicolor & Virginica (combined)"
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
		/ missing list 
	;
run; 




```