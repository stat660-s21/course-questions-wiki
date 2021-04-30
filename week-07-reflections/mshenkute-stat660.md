

# Questions about Assigned Quiz Problems and Recipes



Chapter 8
[Course Structure Quiz, Problem 1]
* Question(mshenkute-stat660): What are First and Last Variables?
* Answer(mshenkute-stat660): They are temporary variables created in a data 
step

[Course Structure Quiz, Problem 3]
* Question(mshenkute-stat660): What are _N_ and _ERROR variables?
* Answer(mshenkute-stat660): They are automatic variables created by every
Data step. _N_ represents iterations or number of loops and _Error_ represents 
an error when the value is 1.
					
[Course Structure Quiz, Problem 4]
* Question(mshenkute-stat660): What is the default sort for the by statement.
* Answer(mshenkute-stat660): It is ascending.

[Course Structure Quiz, Problem 5]
* Question(mshenkute-stat660): How is a BY statement used?
* Answer(mshenkute-stat660): It is used under the set statement to group variable 
indicated in the set statement dataset.

[Course Structure Quiz, Problem 6]
* Question(mshenkute-stat660): How does SAS code for First and Last variables?
* Answer(mshenkute-stat660): The first observation in a BY group is set to 1 for 
First.variable and the others are set to 0. Similarly, the last observation is set 
to 1 in Last.variable

Chapter 13
[Course Structure Quiz, Problem 1]
* Question(mshenkute-stat660): How are SAS date values calculated?
* Answer(mshenkute-stat660): dates before January 1, 1960 are negative.

[Course Structure Quiz, Problem 2]
* Question(mshenkute-stat660): How are SAS date and time values different from
other numeric values in SAS?
* Answer(mshenkute-stat660): They can be used the same way in that they can be
sorted and arithmetic operations can be calculated on them. 

[Course Structure Quiz, Problem 4]
* Question(mshenkute-stat660): How does Date8. differ from MMDDYY8. formating?
* Answer(mshenkute-stat660): If we are looking at the date April 29, Date8. would
format it as 29Apr21, and MMDDYY8. would format it as 04/29/21.

Chapter 14
[Course Structure Quiz, Problem 2]
* Question(mshenkute-stat660): What do the input and put functions do?
* Answer(mshenkute-stat660): The input function converts character data to numeric 
and the put function numeric data to charcter values.


[Course Structure Quiz, Problem 7]
* Question(mshenkute-stat660): What is the correct syntax for the trim function?
* Answer(mshenkute-stat660): The trim function removes blanks and has the following 
syntax. /*FullName = trim(First) || trim(Middle) || Last;*/


# Recipes Exploration Results



```SAS


data iris_with_all_text_columns(
		drop=
			SepalLength_int
			SepalWidth_int
			PetalLength_int
			PetalWidth_int
	);
	set sashelp.iris(
		rename-(
				SepalLength=SepalLength_int
				SepalWidth=Sepalwidth_int
				PetalLength=PetalLength_int
				PetalWidth=PetalWidth_int
			)
		);
	SepalLength=put(SepalLength_int,z3.);
	SepalWidth=put(SepalWidth_int,z3.);
	PetalLength=put(PetalLength_int,z3.);
	PetalWidth=put(PetalWidth_int,z3.);
run;


/*Question: Why do we need to convert variables like SepalLength
from one data type to another?
Answer: We format our data as character for when we work with 
composite IDs that begin with 0s.*/

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
  
/* Question: How are First.variable and Last.Variable being used here?
Answer: First.variable will be one for the first observation of a 
desired SepalWidth and zero for the rest. Similarly, Last.variable
will be one for the last observation of a SepalWidth and zero for the rest.*/



```
