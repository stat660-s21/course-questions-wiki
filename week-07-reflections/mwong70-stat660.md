
# Questions about Problems and Recipes



[TB Ch 8 Quiz, Problem 1]
* Question (mwong70-stat660): Compare the BY statement in DATA Step with the CLASS and STRATA statements used in PROC.



[TB Ch 8 Quiz, Problem 3]
* Question (mwong70-stat660): How can FIRST.variable and LAST.variable be useful?
* Answer (mwong70-stat660): For quick inspection during data exploration.



[TB Ch 8 Quiz, Problem 4]
* Question (mwong70-stat660): What is the default order in SORT Procedure?
* Answer (mwong70-stat660): The ascending order.



[TB Ch 8 Quiz, Problem 5]
* Question (mwong70-stat660): What would happen if the variable containing missing values?
* Answer (mwong70-stat660): BY Statement would organize this in Other.



[TB Ch 8 Quiz, Problem 6]
* Question (mwong70-stat660): What suggestion would you offer if we wanted to eliminate the zeroes from first observations?
* Answer (mwong70-stat660): Remove it in a subsequent DATA step.



[TB Ch 13 Quiz, Problem 1]
* Question (mwong70-stat660): Why is it important to know that SAS date values begins since January 01, 1960 in the Gregorian calendar? 
* Answer (mwong70-stat660): It would be useful information when performing date calculations.



[TB Ch 13 Quiz, Problem 2]
* Question (mwong70-stat660): How do you like the numeric format in SAS?
* Answer (mwong70-stat660): It is lovely not having to install additional packages to perform computation on date values.



[TB Ch 13 Quiz, Problem 4]
* Question (mwong70-stat660): What does "informat" means? For example, "An input data file has date expressions in the form 10222001. Which SAS information should you use to read these dates?"



[TB Ch 14 Quiz, Problem 2]
* Question (mwong70-stat660): Can we separate commas in PDV since it is not a nice format to work with when exported into .CSV file.



[TB Ch 14 Quiz, Problem 6]
* Question (mwong70-stat660): How does the SUBSTR function work?
* Answer (mwong70-stat660): The SUBSTR function replaces variable values if it is placed on the left side of an assignment statement. The SUBSTR function extracts a substring if it is placed on the right side.



[TB Ch 14 Quiz, Problem 7]
* Question (mwong70-stat660): How does the TRIM function work?
* Answer (mwong70-stat660): The TRIM function removes trailing blanks from character values.



[drop-and-swap Week 7 SAS Recipe, Problem 1]
* Question (mwong70-stat660): What are other types of numeric values can we format the column with? And, what are some examples of the statement?



[isolating-all-duplicates Week 7 SAS Recipe, Problem 1]
* Question (mwong70-stat660): What would the alternative SQL procedure look like?
* Answer (mwong70-stat660): An SQL procedure with a BY statement.



***




# Recipes Exploration Results




```
*******************************************************************************;
* SAS Recipe: drop-and-swap                                                    ;
*******************************************************************************;
* Original Recipe;
data <output dataset name>(drop=<temp new variable name>);
    set <input dataset name>
        (rename=(<old variable name> = <temp new variable name>))
    ;
    <transform old variable into new variable>;
run;



* Modified to restructure each variable to have 3-digit integer;
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
    SepalLength=put(SepalLength_int,z3.);
    SepalWidth=put(SepalWidth_int,z3.);
    PetalLength=put(PetalLength_int,z3.);
    PetalWidth=put(PetalWidth_int,z3.);
run;



*******************************************************************************;
* SAS Recipe: isolating-all-duplicates                                         ;
*******************************************************************************;
* Original Recipe;
proc sort
        data=<input dataset name>
        out=<output dataset name1>
    ;
    by <list of one or more columns comprising unique id:
        column-1 column-2 ... column-n>;
run;
data <output dataset name2>;
    set <output dataset name1>;
    by column-1 column-2 ... column-n;
    if
        first.column-n*last.column-n = 0
    then
        do;
            output;
        end;
run;



* Modified recipe to 
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
