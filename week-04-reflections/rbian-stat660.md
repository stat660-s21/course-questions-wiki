
# Questions about Assigned Quiz Problems and Recipes



[TextBook Chapter5 Quiz, Problem 2]
* Question (rbian-stat660): If there are unbalanced quotation marks in your code, can the program run successfully?
* Answer (rbian-stat660): No, there will be a warning in SAS log.


[TextBook Chapter5 Quiz, Problem 6]
* Question (rbian-stat660): What is a syntax error?
* Answer (rbian-stat660): Syntax errors occur when program statements do not conform to the rules of the SAS language.


[TextBook Chapter6 Quiz, Problem 1]
* Question (rbian-stat660): What do we need to pay attention to while creating a label?
* Answer (rbian-stat660): We should always use the LABEL option in the PROC PRINT statement to specify that the labels be displayed.


[TextBook Chapter6 Quiz, Problem 3]
* Question (rbian-stat660): If we want to test for multiple values of the same variable, is there any convenient alternative?
* Answer (rbian-stat660): Yes, we can use the IN operator.


[TextBook Chapter6 Quiz, Problem 4]
* Question (rbian-stat660): Is the WORK library a temporary or permanent library?
* Answer (rbian-stat660): It is a temporary library. Every time when a SAS session ends, it will be deleted.


[TextBook Chapter6 Quiz, Problem 6]
* Question (rbian-stat660): What is necessary in a PROC SORT statement?
* Answer (rbian-stat660): PROC SORT DATA=input-table; BY col-name(s); RUN;.


[TextBook Chapter6 Quiz, Problem 7]
* Question (rbian-stat660): Can we sort the rows by several columns?
* Answer (rbian-stat660): Yes, the BY statement can specify one or more columns in the input table.


[TextBook Chapter6 Quiz, Problem 8]
* Question (rbian-stat660): How to decide the order of several conditions?
* Answer (rbian-stat660): We should first execute the expressions in parentheses.


[TextBook Chapter7 Quiz, Problem 7]
* Question (rbian-stat660): How to decide the order of variables stored in a new SAS data set?
* Answer (rbian-stat660): The order in which variables are defined in the DATA step determines the order in which the variables are stored in the data set.


[TextBook Chapter7 Quiz, Problem 9]
* Question (rbian-stat660): What is the difference between determining length for a character and a numeric variable?
* Answer (rbian-stat660): We should add a sign $ after a character variable.


[TextBook Chapter7 Quiz, Problem11]
* Question (rbian-stat660): What items are created during the compilation phase?
* Answer (rbian-stat660): Program data vector and descriptor information.


[printing-a-dataset Week 2 SAS Recipe]
* Question (rbian-stat660): In the PROC PRINT procedure, can we print the ID by ascending/descending order?
* Answer (rbian-stat660): Yes, we need to use PROC SORT statement before printing the data.


[sorting-a-dataset Week 2 SAS Recipe]
* Question (rbian-stat660): What happened if we don’t put the OUT command in the PROC SORT statement?
* Answer (rbian-stat660): The new sorted data will overwrite the original data.


[checking-for-duplicates Week 2 SAS Recipe]
* Question (rbian-stat660): Can we take a look at the removed duplicates?
* Answer (rbian-stat660): Yes, with the DUPOUT= option.





***



# Recipes Exploration Results

```SAS

* Recipe: printing-a-dataset;
* original recipe;
proc print data=sashelp.iris(obs=20);
     id SepalLength SepalWidth;
     var Species;
run;

* modified to take a look at the largest SepalLength of each specie;
proc sort 
    data=sashelp.iris
    out=Work.iris_sorted;
    by Species
       descending SepalLength
       descending SepalWidth;
run; 

proc sort 
    nodupkey
    data=Work.iris_sorted
    out=Work.iris_removed;
    by Species;
run; 

proc print data=Work.iris_removed;
run;

```

```SAS

* Recipe: sorting-a-dataset;

* original recipe;
proc sort 
    data=sashelp.iris
    out=Work.iris_sorted;
    by descending SepalLength
       SepalWidth;
run; 

* modified to take a look at the sum of SepalLength of each specie;
proc sort 
    data=sashelp.iris
    out=Work.iris_sorted;
    by Species
       descending SepalLength;

proc print
    data=Work.iris_sorted;
    sum SepalLength;
    by Species;
    id Species;
run;
```

```SAS

* Recipe: checking-for-duplicates;

* original recipe;
proc sort 
    nodupkey
    data=sashelp.iris
    out=_null_;
    by SepalLength
       SepalWidth;
run; 

* modified to remove rows that are entirely duplicated;
proc sort 
    nodupkey
    data=sashelp.iris
    out=_null_;
    by _ALL_;
run; 

```
