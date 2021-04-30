
# Questions about Assigned Quiz Problems and Recipes



[Chapter 8 Quiz, Problem 1]
* Question (anguyen82-stat660): What happens if I use a BY statement with the SET, but did not index or sort the data first?



[Chapter 8 Quiz, Problem 3]
* Question (anguyen82-stat660): If I wanted to save or check the temporary data during BY processing, how can I do so?



[Chapter 8 Quiz, Problem 4]
* Question (anguyen82-stat660): What happens if I use the BY statement with Type since it is the sorted in ascending order?
* Answer (anguyen82-stat660): I get the table shown!


[Chapter 8 Quiz, Problem 5]
* Question (anguyen82-stat660): What happens if I use more than one variable with a BY statement and one of the variables is unsorted?



[Chapter 8 Quiz, Problem 6]
* Question (anguyen82-stat660): What does it mean when an observation has the value of FIRST.variable is 0?



[Chapter 13 Quiz, Problem 1]
* Question (anguyen82-stat660): What was so significant about January 1, 1960?



[Chapter 13 Quiz, Problem 2]
* Question (anguyen82-stat660): In what case would it be an advantage to store dates and times as SAS numeric date and time values?



[Chapter 13 Quiz, Problem 4]
* Question (anguyen82-stat660): How do I change the field width for TIMEw. informat?



[Chapter 14 Quiz, Problem 2]
* Question (anguyen82-stat660): Do all characters and character strings have a unique numeric value? What about conversion of actual numbers?



[Chapter 14 Quiz, Problem 6]
* Question (anguyen82-stat660): Is the program comparing characters or numbers, that is '919' considered a string or a number?



[Chapter 14 Quiz, Problem 7]
* Question (anguyen82-stat660): What are other uses of the trim function besides removing extra blanks?



[drop-and-swap SAS Recipe]
* Question (anguyen82-stat660): Why do I need to rename SepalLength etc.?



[isolating-all-duplicates SAS Recipe]
* Question (anguyen82-stat660): What does the if else statement due, specifically why first.SepalWidth*last.SepalWidth = 0?



***



# Recipes Exploration Results



```SAS


* Recipe: drop-and-swap;

* original recipe;

data iris_with_all_text_columns(
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
	SepalLength=put(SeplaLength_int,z3.);
	SepalWidth=put(SepalWidth_int,z3.);
	PetalLength=put(PetalLength_int,z3.);
	PetalWidth=put(PetalWidth_int,z3.);
run;


* Recipe: isolating-all-duplicates;


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



```
