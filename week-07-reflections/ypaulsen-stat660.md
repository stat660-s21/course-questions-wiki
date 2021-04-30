# Questions about Problems and Recipes


[Chapter 8 Quiz, Problem 1]
* Question (ypaulsen-stat660): How does the by statement interact with the set statement?
* Answer (ypaulsen-stat660): In a data step, the by statement applies only to the set statement. 


[Chapter 8 Quiz, Problem 3]
* Question (ypaulsen-stat660): What are the _N_ and _ERROR variables?  
* Answer (ypaulsen-stat660): Useful debugging tools. These can be displayed using putlog 


[Chapter 8 Quiz, Problem 4]
* Question (ypaulsen-stat660): Does by use ascending or descending as default? 
* Answer (ypaulsen-stat660): Ascending


[Chapter 8 Quiz, Problem 5]
* Question (ypaulsen-stat660): What is a "by" group? 
* Answer (ypaulsen-stat660): A group that contains all of the observations with the same value for the by-variable. 


[Chapter 8 Quiz, Problem 6]
* Question (ypaulsen-stat660): What is the FIRST.*variable* 
* Answer (ypaulsen-stat660): A variable SAS creates for each by-variable. It tells sas where a group starts. 


[Chapter 13 Quiz, Problem 1]
* Question (ypaulsen-stat660): The answer is C 
* Answer (ypaulsen-stat660): The answer here is still C


[Chapter 13 Quiz, Problem 2]
* Question (ypaulsen-stat660): Does "SAS numeric date and time values" mean the eight digit integer date format? 
* Answer (ypaulsen-stat660): A SAS time value is the number seconds that have passed today. A SAS datetime value represents the number of seconds that have passed since 1960. It means the number of days since Jan 1, 1960


[Chapter 13 Quiz, Problem 4]
* Question (ypaulsen-stat660): Which is the correct format, and what is the function of the period? 
* Answer (ypaulsen-stat660): MMDDYY8.; the period is a delimiter.    


[Chapter 14 Quiz, Problem 2]
* Question (ypaulsen-stat660): What is the difference between 'put' and 'input'
* Answer (ypaulsen-stat660): Input converts character variables to numeric, put converts numeric to character. 


[Chapter 14 Quiz, Problem 6]
* Question (ypaulsen-stat660): How do these code chunks work?
* Answer (ypaulsen-stat660): 


[Chapter 14 Quiz, Problem 7]
* Question (ypaulsen-stat660): How does this concatenation work? 
* Answer (ypaulsen-stat660): B is the answer here. A doesn't perform the trim correctly; C trims both names, leaving no delimiter; and D will probably return an error. 



[drop-and-swap Week 7 SAS Recipe]
* Question (ypaulsen-stat660): What is PUT doing here?  
* Answer (ypaulsen-stat660): Here, PUT puts the value back as a character. It puts it into a new column with the same nae as the now defunct column. Alternatively, INPUT could be used to force it to stay as an integer. 

[isolating-all-duplicates Week 7 SAS Recipe]
* Question (ypaulsen-stat660): What is happening in that if statement? 
* Answer (ypaulsen-stat660): *I think* if there is no duplicate then first\*last should equal 1 (ie, 1X1=1). But if a duplicate exists then the value of first\*last for the first would be 1X0, for the last it would be 0X1, and for all others it would be 0X0. So all duplicates should =0. 


***


# Recipes Exploration Results


[combining-data-horizontally-with-data-step Week 6 SAS Recipe]

```SAS
* Original code;
data iris_with_all_text_cols(
		drop=
			SepalLength_int
			SepalWidth_int
			PetalLength_int
			PetalWidth_int
	);
	set sashelp.iris(
		rename=(
			SepalLength=SepalLength_int
			SepalWidth=SepalWidth_int
			PetalLength=PetalLength_int
			PetalWidth=PetalWidth_int
			)
		);
	SepalLength=put(SepalLength_int,z3.);
	SepalWidth=put(SepalWidth_int,z3.);
	PetalLength=put(PetalLength_int,z3.);
	PetalWidth=put(PetalWidth_int,z3.);
run;
	
* Keep petals as integers - use INPUT; 
data iris_with_some_text_cols(
		drop=
			SepalLength_int
			SepalWidth_int
			PetalLength_int
			PetalWidth_int
	);
	set sashelp.iris(
		rename=(
			SepalLength=SepalLength_int
			SepalWidth=SepalWidth_int
			PetalLength=PetalLength_int
			PetalWidth=PetalWidth_int
			)
		);
	SepalLength=put(SepalLength_int,z3.);
	SepalWidth=put(SepalWidth_int,z3.);
	PetalLength=input(PetalLength_int,w.);
	PetalWidth=input(PetalWidth_int,w.);
run;

* Same as above, but widen character strings to same length as integers; 
data iris_with_some_text_cols(
		drop=
			SepalLength_int
			SepalWidth_int
			PetalLength_int
			PetalWidth_int
	);
	set sashelp.iris(
		rename=(
			SepalLength=SepalLength_int
			SepalWidth=SepalWidth_int
			PetalLength=PetalLength_int
			PetalWidth=PetalWidth_int
			)
		);
	SepalLength=put(SepalLength_int,z8.);
	SepalWidth=put(SepalWidth_int,z8.);
	PetalLength=input(PetalLength_int,w.);
	PetalWidth=input(PetalWidth_int,w.);
run;	
```

```SAS
*Original code;
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
		first.SepalWidth*last.SepalWidth=0
	then 
		do;
			output;
		end;
run; 

* Sum all sepal widths within species;
data iris_sorted_sums;
	set iris_sorted;
    keep
        Species
        TotalSepalWidth
    ; 
	by 
		Species 
	;
	if first.Species then TotalSepalWidth=0;
        TotalSepalWidth+SepalWidth;
    if last.Species;
run;
```