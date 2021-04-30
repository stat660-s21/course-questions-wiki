
# Questions about Problems and Recipes



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
