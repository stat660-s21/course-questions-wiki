
# Questions about Assigned Quiz Problems and Recipes



[TextBook Chapter8 Quiz, Problem 3]
* Question (rbian-stat660): Can we use the WHERE statement to specify FIRST.variable and LAST. variable in the DATA step?
* Answer (rbian-stat660): No, because FIRST.variable and LAST. variable are not stored in the data set.


[TextBook Chapter8 Quiz, Problem 4]
* Question (rbian-stat660): Do we need to specify the ascending order in the BY statement in PROC SORT?
* Answer (rbian-stat660): No, it is by default.



[TextBook Chapter8 Quiz, Problem 5]
* Question (rbian-stat660): Can we use different BY value for different observations?
* Answer (rbian-stat660): Yes, but we need to place BY statement in each subgroup dataset.



[TextBook Chapter8 Quiz, Problem 6]
* Question (rbian-stat660): What is the function of FIRST.variable?
* Answer (rbian-stat660): It indicates the start of each group.



[TextBook Chapter13 Quiz, Problem 1]
* Question (rbian-stat660): What is the format of SAS date values?
* Answer (rbian-stat660): It is the number of days since January 1, 1960.



[TextBook Chapter13 Quiz, Problem 2]
* Question (rbian-stat660): Do we need to use additional function to do calculations of SAS numeric date and time values?
* Answer (rbian-stat660): No, they can be easily used in calculations.



[TextBook Chapter13 Quiz, Problem 4]
* Question (rbian-stat660): In the SAS informat MMDDYYw., how to decide the field width (w)?
* Answer (rbian-stat660): We must count the comma or any other signs, because it occupied a position in the output.



[TextBook Chapter14 Quiz, Problem 2]
* Question (rbian-stat660): What is the difference between INPUT and PUT statement?
* Answer (rbian-stat660): INPUT is used for converting character values to numeric values and PUT is used for converting numeric to character.



[TextBook Chapter14 Quiz, Problem 6]
* Question (rbian-stat660): What is the difference in layout while using SUBSTR function for replacement?
* Answer (rbian-stat660): We should place the SUBSTR function on the left side of an assignment statement.



[TextBook Chapter14 Quiz, Problem 7]
* Question (rbian-stat660): What can we do if we want to use the TRIM function to remove the leading and tailing blank of a character string?
* Answer (rbian-stat660): We can nest LEFT function within a TRIM function.



[drop-and-swap Week 7 SAS Recipe]
* Question (rbian-stat660): Why do we need to rename variables in the SET statement?
* Answer (rbian-stat660): Because we cannot create a new variable of the same name with the variable that we assign the PUT or INPUT statement to change the type.



[isolating-all-duplicates Week 7 SAS Recipe]
* Question (rbian-stat660): What dose the function coalesce do here?
* Answer (rbian-stat660): To return the first non-null value in a list.



***



# Recipes Exploration Results



```SAS
* Recipe: drop-and-swap;

* original recipe;
Data iris_with_all_text_columns(
        drop=
            SepalLength_int
            SepalWidth_int
            PetalLength_int
            PetalWidth_int
    );
    Set sashelp.iris(
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

* modified to use automatic conversion;
Data iris_with_all_text_columns(
        drop=
            SepalLength_int
            SepalWidth_int
            PetalLength_int
            PetalWidth_int
    );
    Set sashelp.iris(
        rename=(
                SepalLength=SepalLength_int
                SepalWidth=SepalWidth_int
                PetalLength=PetalLength_int
                PetalWidth=PetalWidth_int
            )
        );
    SepalLength=scan(SepalLength_int,1)
    SepalWidth=scan(SepalWidth_int,1)
    PetalLength=scan(PetalLength_int,1)
    PetalWidth=scan(PetalWidth_int,1)
run;
```

```SAS
* Recipe: isolating-all-duplicates;

* original recipe;
Proc sort
        data=sashelp.iris
        out=iris_sorted
    ;
    By
        Species
        SepalLength
        SepalWidth
    ;
Run;
Data iris_sortd_dups;
    Set iris_sorted;
    By
        Species
        SepalLength
        SepalWidth
    ;
    If
        First.SepalWidth*last.SepalWidth=0
    Then
        Do;
            Output;
        End;
run;

* modified to exclude duplicates;
Proc sort
        data=sashelp.iris
        out=iris_sorted
    ;
    By
        Species
        SepalLength
        SepalWidth
    ;
Run;
Data iris_sortd_nodups;
    Set iris_sorted;
    By
        Species
        SepalLength
        SepalWidth
    ;
    If
        First.SepalWidth*last.SepalWidth=0
    Then delete;
run;
```
