
# Questions about Assigned Quiz Problems and Recipes



[Chapter 12 Quiz, Problem 3]
* Question (anguyen82-stat660): What happens when I forget to add $ if the data is character data? 



[Chapter 12 Quiz, Problem 4]
* Question (anguyen82-stat660): What does the option lib = formtlib do?



[Chapter 12 Quiz, Problem 5]
* Question (anguyen82-stat660): Why are numeric and character values combined in response d? This
looks to be the odd one out of the four responses.



[Chapter 12 Quiz, Problem 6]
* Question (anguyen82-stat660): Where did the 32,767 character limit come from? I wonder what case
prompted this.



[Chapter 12 Quiz, Problem 7]
* Question (anguyen82-stat660): What is considered a missing numeric value?



[Chapter 15 Quiz, Problem 4]
* Question (anguyen82-stat660): Why do the variables needed to be indexed or sorted first with BY-group
processing?



[Chapter 15 Quiz, Problem 5]
* Question (anguyen82-stat660): Why does class produce a single table and By-group produce multiple tables?



[Chapter 15 Quiz, Problem 6]
* Question (anguyen82-stat660): How would the table change of I changed the order of "age height weight", say
I want "age weight height"?



[Chapter 15 Quiz, Problem 9]
* Question (anguyen82-stat660): What is the difference between responses c and d? d looks to be weight by height.



[Chapter 15 Quiz, Problem 10]
* Question (anguyen82-stat660): What does / character do?
* Answer (anguyen82-stat660): / allows for additional options such as surpressing some information for a cleaner table.



[summarizing-qualitative-values SAS Recipe]
* Question (anguyen82-stat660): What does the line "/ missing norow nocol nopercent" do?
* Answer (anguyen82-stat660): / initiates additional options and the norow nocol nopercent suppresses certain info.



[summarizing-quantitative-values SAS Recipe]
* Question (anguyen82-stat660): What are the blue words "class" and "var" doing?
* Answer (anguyen82-stat660): "class" is the list of the columns for classification and "var" is the columns to calculate.



[temporarily-binning-values SAS Recipe]
* Question (anguyen82-stat660): What's the difference between $Species_bins and value PetalWidth_bins? Why does one have $?
* Answer (anguyen82-stat660): Species is a qualitative value sorted into categories and the other is quantitative.



***



# Recipes Exploration Results



```SAS


* Recipe: summarizing-qualtitative-values;

* original recipe;
proc freq
        nlevels
		data=sashelp.iris
	;
	table
	    Species*PetalWidth
		/ missing norow nocol nopercent
	;
run;



* Recipe: summarizing-quantitative-values;


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


* Recipe: temporarily-binning-values;


* original recipe;

proc format;
    value $Species_bins
	    "Versicolor","Virginia"="Versicolor & Virginia (combined)"
		other="Not Versicolor or Virginia"
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


```
