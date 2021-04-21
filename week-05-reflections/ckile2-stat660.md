# Questions about Problems and Recipes



[Chapter 12 Quiz, Problem 3]
* Question (ckile2-stat660): What does the VALUE statement do? When would you need to use a VALUE statement? What procedure does it go with? 


[Chapter 12 Quiz, Problem 4]
* Question (ckile2-stat660): When would you need to use a FORMAT procedure? Does this apply to tables and graphs? 


[Chapter 12 Quiz, Problem 5]
* Question (ckile2-stat660): If you needed to list values that were both numeric and character, do you create two separate VALUE statements? 


[Chapter 12 Quiz, Problem 6]
* Question (ckile2-stat660): When would you need to specify labels? Is this for tables, charts and graphs? 


[Chapter 12 Quiz, Problem 7]
* Question (ckile2-stat660): If LOW does not include missing numeric values, does it include mission character values? When would you need to use MISS or MISSING keywords? 


[Chapter 15 Quiz, Problem 4]
* Question (ckile2-stat660): When must you use BY-group processing vs CLASS processing? If BY-group processing goes with the PROC MEANS procedure, what procedure does CLASS processing go with? 


[Chapter 15 Quiz, Problem 5]
* Question (ckile2-stat660): Is there any other difference between the BY-group processing vs CLASS processing other than producing a series of small tables vs a single large table? For the CLASS statement does it matter if the data is not indexed or sorted? 


[Chapter 15 Quiz, Problem 6]
* Question (ckile2-stat660): Under PROC MEANS do you have to specify “output out=“? Could you have run this same program using the BY statement(“by sex;”) instead of “class sex;”? 


[Chapter 15 Quiz, Problem 9]
* Question (ckile2-stat660): What does the “wtfmt” and “htfmt” do under format? Is there any other why to write this format so that the PROC FREQ procedure will run? 


[Chapter 15 Quiz, Problem 10]
* Question (ckile2-stat660): Will PROC FREQ procedure run without specifying format? Will PROC FREQ procedure run if your data is missing values? 


[summarizing-qualitative-values Week 5 SAS Recipe]
* Question (ckile2-stat660): What does “nlevels” do under the PROC FREQ procedure? Does “missing” under table take out missing values? 


[summarizing-quantitative-values Week 5 SAS Recipe]
* Question (ckile2-stat660): Can you use BY instead of CLASS in this procedure?  Why can’t you put SepalLength SepalWidth under CLASS statement? 


[temporarily-binning-values Week 5 SAS Recipe]
* Question (ckile2-stat660): Does this procedure work if the dataset is missing values?  Why does “value $Species_bins” need a $ in front of it and “value PetalLength_bins” doesn’t require a $? 

***


# Recipes Exploration Results

```
* Recipe: summarizing-qualitative-values;

* original recipe;
proc freq
		nlevels 
		data=sashelp.iris;
	;
	table
		Species*PetalWidth
		/missing norow nocol nopercent
	;
run;

* modified to take out “nlevels” as well as “/missing norow nocol nopercent” to compare the results with original recipe; 

proc freq
		data=sashelp.iris;
	;
	table
		Species*PetalWidth
	;
run;


* Recipe: summarizing-quantitative-values ;

* original recipe;
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


modified to make the decimal places to 3 places and removed SepalWidth variable from table 

proc means 
		data=sashelp.iris
		maxdec=3
		missing
	;
	class
		Species
		PetalWidth
	;
	var	
		SepalLength 
	;
run;

* Recipe: temporarily-binning-values ;

original recipe;
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

*modified to change table from PetalWidth to PetalLength
*also changed values for "Small Petal Length” to low-7, "Medium Petal Length” to 8-17 and "Large Petal Length” to 18-high; 


proc format;
	value $Species_bins
		 "Versicolor","Virginica"="Versicolor & Virginica (combined)"
		 other="Not Versicolor or Virginica"
	;
	value PetalLength_bins
		low-7="Small Petal Length"
		8-17="Medium Petal Length"
		18-high="Large Petal Length"
	;
run;
proc freq
		nlevels
		data=sashelp.iris
	;
	table
		Species*PetalLength
		/missing list
	;
	format
		Species $Species_bins.
		PetalLength PetalLength_bins.
	;
run;


```

