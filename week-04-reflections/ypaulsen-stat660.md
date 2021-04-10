
# Questions about Assigned Quiz Problems and Recipes

[Chapter 5, Problem 2]
* Question (ypaulsen-stat660): What do the options (label double noobs) do in the PROC PRINT statement? 
* Answer (ypaulsen-stat660): 
Noobs removes the OBS column from the output. 
I can't see any difference in the output when only one of the other two options is used. 

[Chapter 5, Problem 6]
* Question (ypaulsen-stat660): What is the output of PROC SORT? 
* Answer (ypaulsen-stat660): 
Sorted data. If no OUT specified, then the original file is overwritten, else a new file is created. Use PROC PRINT to see sorted data. 

[Chapter 6, Problem 1]
* Question (ypaulsen-stat660): What are some interesting options for PROC PRINT? 
* Answer (ypaulsen-stat660): 
Var: Allows user to select variable in output
noobs: drops the "Obs" column 
id: allows user to specify the id column; otherwise the default ("Obs") is used. (Works well with data that has been sorted with PROC SORT BY)
where: filters rows (e.g. WHERE age>30)
	Contians: e.g where firstname CONTAINS 'Jon' 
	and/or: where age<=55 and pulse>75;
			where fee=124.80 or fee=178.20
SUM *colnames*; adds column total to end of report for selected columns  
	BY sums by selected categories. (Sort BY in a proc sort step first)
LABEL renames columns eg: LABEL *oldcolumnname*=*newcolumnname*; -> output has new column name (Used in data step this creates a permantent change.)	
	
[Chapter 6, Problem 3]
* Question (ypaulsen-stat660): Which syntax is correct for selecting a list of attributes? 
* Answer (ypaulsen-stat660): E.G: 
proc print data=lung;
	where cell in ('Large', 'Squamous'); 
run;

[Chapter 6, Problem 4]
* Question (ypaulsen-stat660): What are the options for the PROC SORT procedure? 
* Answer (ypaulsen-stat660): 
BY Specifies variable to sort by
	DESCENDING specifies descending sort. Default = ascending 

[Chapter 6, Problem 6]
* Question (ypaulsen-stat660): Does that program print all of the information for all of the female entries?
* Answer (ypaulsen-stat660): 
Yes it does, exactly as one would expect. 

[Chapter 6, Problem 7]
* Question (ypaulsen-stat660): What is the sum option doing here? 
* Answer (ypaulsen-stat660): 
The sum option adds sum of column to end of data for selected variables. 

[Chapter 6, Problem 8]
* Question (ypaulsen-stat660): How does the correct syntax here differ from R? 
* Answer (ypaulsen-stat660): 
It differs in that you may use the word 'and' or you may use the symbol '&'. The same is true for 'or' (|) and 'contains' (?)

[Chapter 7, Problem 7]
* Question (ypaulsen-stat660): Does SAS just add the new column to the end of the list? 
* Answer (ypaulsen-stat660): 
Yes, and it preserves the original order. 


[Chapter 7, Problem 9]
* Question (ypaulsen-stat660): Doesn't the $ create character variables? 
* Answer (ypaulsen-stat660):
I believe this is the proble with the given program. 

[Chapter 7, Problem 11]
* Question (ypaulsen-stat660): What is the PDV?
* Answer (ypaulsen-stat660):
The program data vector is the art of the memory wherein SAS builds a dataset. 


[Chapter 5, General Q]
* Question (ypaulsen-stat6660): Why would I ever get an error for a missing run statement? (Earlier in the book I think I read that the statement is unecessary.)  
* Answer (ypaulsen-stat6660): 
Run statements are not necessary after a step that is followed by another step. The last step requires a run or quit statement or SAS does not recognize the end of the step. 


***


# Recipes Exploration Results

[Recipe 1]
* Question (ypaulsen-stat6660): How are various options used in this code?  
* Answer (ypaulsen-stat6660): Results of exploration below. ID specifies two columns as ids, var specifies a variable to include. I also used the option "where" for trial purposes. 

```SAS

proc print data=sashelp.iris(obs=20); 
	id SepalLength SepalWidth; 
	var Species; 
run; 

proc print data=sashelp.iris(obs=20); 
	*id SepalLength SepalWidth; 
	var Species; 
run; 

proc print data=sashelp.iris(obs=20); 
	*id SepalLength SepalWidth; 
	*var Species; 
run; 

proc print data=sashelp.iris; 
	id SepalLength SepalWidth; 
	var Species; 
run; 

proc print data=sashelp.iris; 
	id SepalLength SepalWidth; 
	var Species; 
run; 

proc print data=sashelp.iris; 
	where SepalLength>10;
run; 

```

[Recipe 2]
* Question (ypaulsen-stat6660): Why is the style of the code different in this example? 
* Answer (ypaulsen-stat6660): Seemingly because helps to understand the processing at each step. 

```SAS

proc sort 
		data=sashelp.iris
		out=Work.iris_sorted
	;
	by
		descending SepalLength 
		SepalWidth 
	;
run; 


proc sort 
		data=sashelp.iris
		out=Work.iris_sorted
	;
	by
		descending SepalLength 
		SepalWidth 
	;
proc print data=iris_sorted;
run; 


proc sort 
		data=sashelp.iris
		out=Work.iris_sorted
	;
	by
		SepalLength 
		SepalWidth 
	;
proc print data=iris_sorted;
run; 

proc sort 
		data=sashelp.iris
		out=Work.iris_sorted
	;
	by
		Species
		SepalLength 
		SepalWidth 
	;
proc print data=iris_sorted;
run;
```

[Recipe 3]
* Question (ypaulsen-stat6660): What happens if I run this code without the out=_null_ option?   
* Answer (ypaulsen-stat6660): An error is returned. This is explained in the "incomplete" version on Blackboard. 

```SAS

proc sort 
		nodupkey
		data=sashelp.iris
		out=_null_
	;
	by
		SepalLength
		Sepal Width 
	; 
run; 


proc sort 
		
		data=sashelp.iris
		out=_null_
	;
	by
		SepalLength
		Sepal Width 
	; 
run; 

proc sort 
		nodupkey
		data=sashelp.iris
		
	;
	by
		SepalLength
		Sepal Width 
	; 
run; 

```

