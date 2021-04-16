

# Questions about Assigned Quiz Problems and Recipes


Chapter 12
[Course Structure Quiz, Problem 3]
* Question(mshenkute-stat660): What is a value statement?
* Answer(mshenkute-stat660): The value statement is used with proc format 
procedure to define a format for displaying one or more values. It can be used to 
create formatting for variables such as gender (M,F), color etc.

[Course Structure Quiz, Problem 4]
* Question(mshenkute-stat660): What is the correct syntax for value under proc 
format? 
* Answer(mshenkute-stat660): It’s proc format
					                            Value cuisine
					                            1=’Thai’
					                            2=’Indian’
					                            3=’Chinese’
					                            4=’Ethiopian’
				                           run;

[Course Structure Quiz, Problem 5]
* Question(mshenkute-stat660): What are the ranges in the VALUE statement?
* Answer(mshenkute-stat660): It specifies the ranges for a single value, numeric 
values, character values or a list of unique values. 

[Course Structure Quiz, Problem 6]
* Question(mshenkute-stat660): How do I specify a label in SAS? 
* Answer(mshenkute-stat660): Use a quotation mark, limit the label to 32,767 
characters, and use ’’ instead of an apostrophe.

[Course Structure Quiz, Problem 7]
* Question(mshenkute-stat660): What are the two different uses of the keyword low?
* Answer(mshenkute-stat660): It can be used to label a missing value when used as 
a character format, or to indicate values not in a specified range

Chapter 15
[Course Structure Quiz, Problem 4]
* Question(mshenkute-stat660): What does a BY-group processing do? How is it 
different from the CLASS statement?
* Answer(mshenkute-stat660): It categorizes variables that are already sorted. 
It is used with proc means procedure. 

[Course Structure Quiz, Problem 5]
* Question(mshenkute-stat660): What is the difference between class survive sex 
and by survive sex?
* Answer(mshenkute-stat660): The output of a class statement prints one table, 
whereas the By statement would print two separate tables. This output is for class 
survive sex.

[Course Structure Quiz, Problem 6]
* Question(mshenkute-stat660): What is the difference between choice a and choice b?
* Answer(mshenkute-stat660): proc means calculates all the descriptive statistics 
whereas proc freq makes a frequency table. 

[Course Structure Quiz, Problem 9]
* Question(mshenkute-stat660): How do you print a two way frequency table?
* Answer(mshenkute-stat660): We can use variable a*variable b with proc freq procedure.

[Course Structure Quiz, Problem 10]
* Question(mshenkute-stat660): What does nofreq norow nocol do?
* Answer(mshenkute-stat660): nofreq suppresses cell frequencies, nopercent suppresses 
cell percentages, norow suppresses row percentages, nocol suppresses column percentages.


***


# Recipes Exploration Results



```SAS


/*Question: What is this code computing?
Answer: It is creating a frequency table or cross tabulation 
for Species and PetalWidth variables for the iris dataset. */
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


```
