# Questions about Problems and Recipes



[LS 2, Problem 1]
* Question (mwong70-stat660): In the Compilation phase, we create Program Data Vector (PDV), is the term "vector" used here indicative of the vectors in the matrix data structures? 



[LS 2, Problem 2]
* Question (mwong70-stat660): Does the SAS Enterprise have a debugger?
* Answer (mwong70-stat660): No. In lieu of the interactive DATA Step debugger in SAS Studio, we use PUTLOG statement.



[TB Ch 5 Quiz, Problem 2]
* Question (mwong70-stat660): What are some common types of error?
* Answer (mwong70-stat660): syntax error and semantic error.



[TB Ch 5 Quiz, Problem 6]
* Question (mwong70-stat660): What are some common types of syntax errors?
* Answer (mwong70-stat660): mispellings, missing RUN Statement, missing semicolon at the end of a statement, unbalanced quotation mark, and invalid options in statements.



[TB Ch 6 Quiz, Problem 1]
* Question (mwong70-stat660): How to select certain observations with similar attributes in the columns?
* Answer (mwong70-stat660): Use WHERE and specify the <column=attributes>.



[TB Ch 6 Quiz, Problem 3]
* Question (mwong70-stat660): In what situations should we omit the OBS column?



[TB Ch 6 Quiz, Problem 4]
* Question (mwong70-stat660): How do we choose which to execute first when processing data between PROC SORT and WHERE in PROC PRINT Statement?



[TB Ch 6 Quiz, Problem 6]
* Question (mwong70-stat660): How can sorting OBS help us inspect if sampling was randomized?



[TB Ch 6 Quiz, Problem 7]
* Question (mwong70-stat660): What is an example of taking a cumulative sum in the PROC PRINT Statement?



[TB Ch 6 Quiz, Problem 8]
* Question (mwong70-stat660): Can the WHERE Statement also be used in the PDV?



[TB Ch 7 Quiz, Problem 7]
* Question (mwong70-stat660): Can we create a sliding scale of a Raise rates using the DO LOOP Statement?



[TB Ch 7 Quiz, Problem 9]
* Question (mwong70-stat660): What does it mean when the _ERROR_ counter stays at 1 when the _N_ counter increases in the error log: NewSalary=34650 Bonus=. _ERROR_=1 _N_=5 ?



[TB Ch 7 Quiz, Problem 11]
* Question (mwong70-stat660): How frequent do SAS specialists use the term Program Data Vector (PDV)?



[SP1 Ls 1, Problem 1]
* Question (mwong70-stat660): How different is SAS Studio from SAS Viya? 



[SP1 Ls 3, Problem 1]
* Question (mwong70-stat660): Does PROC UNIVARIATE get its name from one response variable?



[printing-a-dataset Week 4 SAS Recipe]
* Question (mwong70-stat660): How can we modify the PRINT Statement to omit the results?
* Answer (mwong70-stat660): PROC PRINT data=dataset1 NOOBS;



[sorting-a-dataset Week 4 SAS Recipe]
* Question (mwong70-stat660): How does SAS determine the SORT order between variables?
* Answer (mwong70-stat660): Unless specified, the SORT places the observations in descending order. First, the output will sort the order by the OBS column. Then, the variables in alphabetical order. Also, starting the variable name with a numeric value or non-alphabetical symbol (except _underscore) would violate the naming convention.



[checking-for-duplicates Week 4 SAS Recipe]
* Question (mwong70-stat660): Why can't everything have macros? In other words, what does it take to create or modify macros?



***



# Recipes Exploration Results




```
* SAS Recipe: printing-a-dataset ;

* original recipe;
proc print data=<input dataset name>;
    id <list of one ore more columns to highlight as "index" values>;
    var <list of columns to additionally include in output>;
run;

* modified to show output in the RESULTS VIEWER of the first 20 observations from the data set SASHELP.IRIS for exploratory steps;
proc print data=sashelp.iris(obs=20);
    id SepalLength SepalWidth;
    var Species;
run;



* SAS Recipe: sorting-a-dataset ;

* original recipe;
proc sort
        data=<input dataset name>
        out=<output dataset name>
    ;
    by <list of one ore more columns to sort data w.r.t., with "descending"
        preceding any column that should be sorted in descending order>;
run;


* modified to sort the variables selected in BY Statement and store the sorted data set as WORK.IRIS_SORTED;
proc sort 
        data=sashelp.iris
        out=Work.iris_sorted
    ;
    by
        descending SepalLength
        SepalWidth
    ;
run;



* SAS Recipe: sorting-a-dataset ;

* original recipe;
proc sort
        nodupkey
        data=<input dataset name>
        dupout=<output dataset name for duplicate rows w.r.t. the unique id>
        out=_null_
    ;
    by <list of one or more columns comprising unique id>;
run;


* modified to remove individuals with the same key in unique id and store the data set as temporary _NULL_;
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


