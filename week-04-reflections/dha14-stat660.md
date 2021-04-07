
# Questions about Assigned Quiz Problems and Recipes

[TB Chapter 5, Question 2 ] 
* Question (dha14-stat6660): what does LABEL and DOUBLE do? 
* Answer (dha14-stat6660): DOUBLE writes a blank space between observation. LABEL uses variables' labels as column headings

[TB Chapter 5, Question 6 ] 
* Question (dha14-stat6660): Does proc sort alternate the original dataset? 
* Answer (dha14-stat6660): Yes, the original dataset will be overwritten with the results of the sorting process. 

[TB Chapter 6, Question 1] 
* Question (dha14-stat6660): How to rename variables in the output using PROC PRINT?
* Answer (dha14-stat6660): The LABEL statement will display the variable as specified in the output.

[TB Chapter 6, Question 3 ] 
* Question (dha14-stat6660): What is equivalent to the correct answer to Question 3  on the quiz? (where style in ('RANCH','SPLIT','TWOSTORY') );
* Answer (dha14-stat6660): where style ='RANCH' or style='SPLIT' or style= 'TWOSTORY'

[TB Chapter 6, Question 4 ] 
* Question (dha14-stat6660): Where does SAS store temporary files if library WORK is not called?
* Answer (dha14-stat6660): SAS will still store temporary files in library WORK if no other libraries are specified.  

[TB Chapter 6, Question 6 ] 
* Question (dha14-stat6660): Would PROC SORT work without the BY statement?
* Answer (dha14-stat6660): No, PROC SORT would fail and stop running. 

[TB Chapter 6, Question 7 ] 
* Question (dha14-stat6660): What is NOOBS in PROC PRINT?
* Answer (dha14-stat6660): NOOBS suppresseses the observation number in the output (there is no OBS column in the output table).

[TB Chapter 6, Question 8 ] 
* Question (dha14-stat6660): When to use the parentheses in conditional statement?
* Answer (dha14-stat6660): Use parentheses to group observations when you want to make sure the compound expression evaluated correctly.

[TB Chapter 7, Question 7 ] 
* Question (dha14-stat6660): What order are the variables stored in the new SAS data set from DATA step?
* Answer (dha14-stat6660): The order in which variables are defined in the DATA step determines the order in which the variables are stored in the data set.

[TB Chapter 7, Question 9 ] 
* Question (dha14-stat6660): How does SAS proceed when it encounters inappropriate variable type?
* Answer (dha14-stat6660): When there is an incorrect variable type, SAS attempts to automatically convert to the correct variable type. If it cannot, SAS continues processing and produces output with missing values.

[TB Chapter 7, Question 11 ] 
* Question (dha14-stat6660): What happens in DATA step during the compilation process?
* Answer (dha14-stat6660): SAS checks syntax and compiles statements, as well as creates a program data vector (PDV) and descriptor information portion of the new dataset.

[Recipe Printing a Dataset ] 
* Question (dha14-stat6660): How does SAS process 2 variables in ID statement?
* Answer (dha14-stat6660): SAS treats the 2 variables specified in the ID statement as a lookup ID for each row instead of Obs column.

[Recipe Sorting a Dataset ] 
* Question (dha14-stat6660): Can you sort the dataset by many variables in different order?
* Answer (dha14-stat6660): Yes, you can. When more than one variable is listed in the BY statement, SAS will first sort the observations based on the values of the first variable, then sort observations by the values of the second variable within eah category of the first variable, and so on.

[Recipe Checking for Duplicates] 
* Question (dha14-stat6660): What variable is processed first and how is each variable process?
* Answer (dha14-stat6660): Observations in SepalLength will be processed first in ascending order, and within SepalLength, observations in SepalWidth will also be sorted in ascending order unless specified otherwise.

***



# Recipes Exploration Results



```SAS


* SAS Recipe: printing-a-dataset ;

PROC PRINT data=sashelp.iris (obs=20); 
	id SepalLength SepalWidth; 
	var Species; 
run; 

*SAS Recipe: sorting-a-dataset;

proc sort 
	data=sashelp.iris
	out=Work.iris_sorted
	; 
	by
		descending SepalLength
		SepalWidth
	; 
run;

*SAS Recipe: checking-for-duplicates;

proc sort 
		nodupkey 
		data=sas.help.iris
		out=_null_
	; 
	by
		SepalLength
		SepalWidth
	; 
run; 

```
