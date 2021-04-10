
# Questions about Assigned Quiz Problems and Recipes


[Textbook Chapter 5, Problem 2]
* Question (slin51-stat660): Does the label double noobs replace the column maxrates?
* Answer (slin51-stat660): no, noobs stands for no observations and removes the obs column

[Textbook Chapter 5, Problem 6]
* Question (slin51-stat660):  Is sort by default in ascending or descending order?


[Textbook Chapter 6, Problem 1]
* Question (slin51-stat660): Why is noobs and label specified after the proc print statement instead of on a separate line?


[Textbook Chapter 6, Problem 3]
* Question (slin51-stat660):  Is in evaluating the vector of values as logicals?


[Textbook Chapter 6, Problem 4]
* Question (slin51-stat660): When referring to a data set, do we always need to use DATA=?
* Answer (slin51-stat660): yes, it specifies the data to be read


[Textbook Chapter 6, Problem 6]
* Question (slin51-stat660): Is it necessary to specify OUT=?
* Answer (slin51-stat660): no, if out= is not specified, PROC SORT overwrites the data set that is specified in DATA=


[Textbook Chapter 6, Problem 7]
* Question (slin51-stat660): Is there a way to call the sum function to all the selected variables?


[Textbook Chapter 6, Problem 8]
* Question (slin51-stat660):  Is eq an appropriate substitute for =?
* Answer (slin51-stat660): yes


[Textbook Chapter 7, Problem 7]
* Question (slin51-stat660): Can new columns be added to the beginning of the data set instead of the end?


[Textbook Chapter 7, Problem 9]
* Question (slin51-stat660):  What does the length function do?


[Textbook Chapter 9, Problem 11]
* Question (slin51-stat660): Are observations initially set to missing and then with each iteration, the observations are filled in?


***



# Recipes Exploration Results



```
* Recipe: printing-a-dataset ;

proc print data=sashelp.iris(obs=20);
    id SepalLength SepalWidth; 
    var Species;
run;


```

* Question (slin51-stat660): Can you also specify in the options that obs=20?


```

* Recipe: sorting-a-dataset ;

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

* Question (slin51-stat660): Why is there a Work. in front of the iris_sorted?



```
* Recipe: checking-for-duplicates ;

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


```

* Question (slin51-stat660): What does the output _null_ mean?


