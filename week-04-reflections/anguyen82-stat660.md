
# Questions about Assigned Quiz Problems and Recipes



[Chapter 5 Quiz, Problem 2]
* Question (anguyen82-stat660): Looks like an quotation mark is missing on 'Recovery Heart Rate;, I wonder what specific error message will appear.



[Chapter 5 Quiz, Problem 6]
* Question (anguyen82-stat660): When is it appropriate to make a proc declaration and then a line of code ended with a semicolon?



[Chapter 6 Quiz, Problem 1]
* Question (anguyen82-stat660): What is the difference between PROC PRINT and PROC CONTENTS?



[Chapter 6 Quiz, Problem 3]
* Question (anguyen82-stat660): Answer a) looks to be incorrect since it lacks = for the last two elements. Why does b-d have 'in' operator?



[Chapter 6 Quiz, Problem 4]
* Question (anguyen82-stat660): How can I check the contents of a temporary data set?



[Chapter 6 Quiz, Problem 6]
* Question (anguyen82-stat660): I don't see any additional lines between proc sort line and run;, are there default sort options (i.e. alphabetical)?



[Chapter 6 Quiz, Problem 7]
* Question (anguyen82-stat660): If I omit the proc sort step, how would the data be printed? Would there be any order to it?



[Chapter 6 Quiz, Problem 8]
* Question (anguyen82-stat660): Is it possible to make two statements to satisfy both conditions or is using the and operator preferred for two separate
conditions?



[Chapter 7 Quiz, Problem 7]
* Question (anguyen82-stat660): I don't see any variables specified, can the order be specificed inside the DATA step or do I need to do a PROC Sort first?



[Chapter 7 Quiz, Problem 9]
* Question (anguyen82-stat660): I think the error is mixed data type, I wonder what kind of error message will be thrown?



[Chapter 7 Quiz, Problem 11]
* Question (anguyen82-stat660): How can I monitor what does on in the PDV?



[checking-for-duplicates SAS Recipe]
* Question (anguyen82-stat660): What function does nodupkey perform in the sample code?



[printing-a-dataset SAS Recipe]
* Question (anguyen82-stat660): What does obs=20 do in sashelp.iris(obs=20)? Is it only taking 20 obervations from the sample data set?



[sorting-a-dataset SAS Recipe]
* Question (anguyen82-stat660): When I type in the code from the picture I am not getting the same letter highlighting such as Work.iris_sorted,
where Work is in blue. But it looks like the program is still printing fine. Am I missing a SAS 9.4 option for formatting keywords? Also, is it
possible to overwrite a data set with the out =?
***



# Recipes Exploration Results



```SAS


* checking-for-duplicates


proc sort
        nodupkey
        data=<input dataset name>
        dupout=<output dataset name for duplicate rows w.r.t. the unique id>
        out=_null_
    ;
    by <liste of one or more columns comprising unique id>;
run;

*/

*Example;

proc sort
        nodupkey
		data=sashelp.iris
		out=_null_
	;
	by
        SepalLength
		SepalWidth
	;
run;



* printing-a-dataset


/*
Scenario: Data in a SAS dataset should be printed in tabular form

Approach: Tell SAS which columns to include in output, including optional
columns to treat as index values for rows.

Recipe <with everything in square brackets to be filled in for actual use; the
only parts that can be left out, if not needed, are the id and var statements>:

proc print data=<input dataset name>;
    id <list of one ore more columns to highlight as "index" values>;
    var <list of columns to additionally include in output>;
run;

*/

*Example;


proc print data=sashelp.iris(obs=20);
    id SepalLength SepalWidth;
	var Species;
run;


* sorting-a-dataset

/*
Scenario: Data in a SAS dataset should be sorted with respect to (w.r.t.) a
a list of one or more columns

Approach: Tell SAS how to sort the dataset by specifying columns, optionally
specifying whether to sort in ascending or descending order for each.

Recipe <with everything in square brackets to be filled in for actual use; the
only part that can be left out, if not needed, is the out option>:

proc sort
        data=<input dataset name>
        out=<output dataset name>
    ;
    by <list of one ore more columns to sort data w.r.t., with "descending"
        preceding any column that should be sorted in descending order>;
run;

*/

*Example;



proc sort
        data=sashelp.iris
		out=Work.iris_sorted
	;
	by
	    descending SepalLength
		SepalWidth
	;
run;

```
