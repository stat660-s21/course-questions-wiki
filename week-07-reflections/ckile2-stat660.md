# Questions about Problems and Recipes



[Chapter 8 Quiz, Problem 1]
* Question (ckile2-stat660): When would you need to use the BY statement with the SET statement? Also what do these statements combined do together? Do they sort columns and variables? 


[Chapter 8 Quiz, Problem 3]
* Question (ckile2-stat660): When doing BY-group processing why does it create a temporary FIRST.variable and LAST.variable? Why can’t the program run without these temporary variables? 


[Chapter 8 Quiz, Problem 4]
* Question (ckile2-stat660): If you are using the BY statement do you need use it with PROC SORT prior to it? Why can’t you say proc print data=cert.credit; by type; run;? 


[Chapter 8 Quiz, Problem 5]
* Question (ckile2-stat660): Does the BY group sort the observations by variables or values? Can you use more than one variable in the BY statement? 


[Chapter 8 Quiz, Problem 6]
* Question (ckile2-stat660): Why does SAS set the value of the FIRST.variable to 1 if the value of the variable changes from the previous observation? And for all other variables the value of the FIRST.variable is 0? Are these values temporary or are the stored in the data set afterwards? 


[Chapter 13 Quiz, Problem 1]
* Question (ckile2-stat660): What is special about January 1, 1960? Why does SAS need date values? Why can’t it use regular dates we use on the calendar? 


[Chapter 13 Quiz, Problem 2]
* Question (ckile2-stat660): What would be an example of when you would need to calculate the numeric SAS date and time values for a dataset? Does it factor in timezones? 

[Chapter 13 Quiz, Problem 4]
* Question (ckile2-stat660): Is the SAS format MMDDYY8 the same as MMDDYYYY ? What does the 8 stand for? Is 10222001 the same as October 22, 2001? 


[Chapter 14 Quiz, Problem 2]
* Question (ckile2-stat660): When creating the variable TargetNo for 123,456 why is TargetNo=input(target,comma6.); not the answer? We have 6 character spaces in 123,456. 


[Chapter 14 Quiz, Problem 6]
* Question (ckile2-stat660):What does the SUBSTR function do in this program? Is it extracting the numbers 1 and 3 in this statement: substr(phone,1,3)? 


[Chapter 14 Quiz, Problem 7]
* Question (ckile2-stat660): When using the TRIM statement, do you need to create the absolute value lines (or parallel lines) used in this example, trim(firstname)||’’||trim(lastname);? Will it run without those lines? 


[drop-and-swap Week 7 SAS Recipe]
* Question (ckile2-stat660): What is this program supposed to be doing? Why are the columns PetalLength and PetalLength_int empty with no values? Is this program sorting the values in the columns, smallest to largest? 


[isolating-all-duplicates Week 7 SAS Recipe]
* Question (ckile2-stat660): How is this program isolating the duplicates? All I see is 5 columns that have been sorted. Is it removing any duplicate values of SepalWidth or SepalLength? 


***



# Recipes Exploration Results




```
* Recipe: drop-and-swap;

* original recipe;
data iris_with_all_text_columns(
		drop=
			SepalLength_int
			SepalWidth_int
			PetalLenght_int
			PetalWidth_int
	);
	set sashelp.iris(
		rename=(
				SepalLength=SepalLength_int
				SepalWidth=SepalWidth_int
				PetalLength=PetalLenght_int
				PetalWidth=PetalWidth_int
			)
		);
	SepalLength=put(SepalLength_int,z3.);
	SepalWidth=put(SepalWidth_int,z3.);
	PetalLength=put(PetalLength_int,z3.);
	PetalWidth=put(PetalWidth_int,z3.);
run;
* modified to remove PetalLength_int and PetalWidth_int in order to see the columns the program would create and how it would run;
data iris_with_all_text_columns(
		drop=
			SepalLength_int
			SepalWidth_int
	);
	set sashelp.iris(
		rename=(
				SepalLength=SepalLength_int
				SepalWidth=SepalWidth_int
			)
		);
	SepalLength=put(SepalLength_int,z3.);
	SepalWidth=put(SepalWidth_int,z3.);
run;




* Recipe: isolating-all-duplicates ;

* original recipe;
proc sort
		data=sashelp.iris
		out=iris_sorted
	;
	by
		Species
		SepalLength
		SepalWidth
	;
run;
data iris_sorted_dups;
	set iris_sorted;
	by
		Species
		SepalLength
		SepalWidth
	;
	if 
		first.SepalWidth*last.SepalWidth = 0
	then
		do;
			output;
		end;
run;
* modified to remove Species under the by statement in order to see if there would be a change to the output;
proc sort
		data=sashelp.iris
		out=iris_sorted
	;
	by
		SepalLength
		SepalWidth
	;
run;
data iris_sorted_dups;
	set iris_sorted;
	by
		SepalLength
		SepalWidth
	;
	if 
		first.SepalWidth*last.SepalWidth = 0
	then
		do;
			output;
		end;
run;


```

