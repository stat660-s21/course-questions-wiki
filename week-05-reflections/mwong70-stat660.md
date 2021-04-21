
# Questions about Assigned Quiz Problems and Recipes



[TB Ch 12 Quiz, Problem 3] 
* Question (mwong70-stat660): Contrast the naming of a character variable for VALUE statement in the FORMAT procedure and VAR Statement in DATA step.
* Answer (mwong70-stat660): For VALUE statement in PROC FORMAT, we add $ in the start of the name for character variable; for VAR statement in DATA step, we add $ at the end of the column name for character variable.



[TB Ch 12 Quiz, Problem 4] 
* Question (mwong70-stat660): How many statements are in the following code:
```SAS
PROC FORMAT lib=formtlib;
    VALUE colorfmt;
          1='Red'
          2='Green'
          3='Blue';
RUN;
```
* Answer (mwong70-stat660): There are 3 statements, each of which ends with a semicolon in the code stanza above.



[TB Ch 12 Quiz, Problem 5]
* Question (mwong70-stat660): How can we properly create the ranges in a VALUE statement?
* Answer (mwong70-stat660): We can specify a single numeric value or a character value enclosed with single quotation marks. We can create a range of numeric values e.g. 0-9. We can create a range of characer values e.g. 'A'-'J'. we can list values separated by commas when the list contains either all numeric values or character values.



[TB Ch 12 Quiz, Problem 6]
* Question (mwong70-stat660): What will be shown in the results viewer when two or more labels are assigned with the same variable name?



[TB Ch 12 Quiz, Problem 7]
* Question (mwong70-stat660): In what situations should we consider labeling values as OTHER?
* Answer (mwong70-stat660): One example is when we want to compare the values that were not captured in the prespecified labels including the missing values.


[TB Ch 15 Quiz, Problem 4]
* Question (mwong70-stat660): Why does the BY statement in the MEANS procedure require an indexed or sorted variable?



[TB Ch 15 Quiz, Problem 5]
* Question (mwong70-stat660): In the MEANS procedure, can we swap the order between the CLASS statement and the BY statement?
* Answer (mwong70-stat660): No changes, SAS will assign the rows according to the CLASS variables and the columns according to the BY variables. However, it is good to be consistent with order of CLASS and BY when writing a code.



[TB Ch 15 Quiz, Problem 6]
* Question (mwong70-stat660): Is the MEANS procedure wiht a CLASS statement and a BY statement considered as a cross-tabulations? If not, explain their difference.



[TB Ch 15 Quiz, Problem 9]
* Question (mwong70-stat660): Typically, the FREQ procedure is used to summarize qualitative data. What would happen if we use the FREQ procedure to generate a two-way table of quantitative values?



[TB Ch 15 Quiz, Problem 10]
* Question (mwong70-stat660): Can we use the FREQ procedure to create a two-way table for continuous numeric variables? If so, provide an example of a two-way table for a continuous numeric variable.



[SP1 Ls 5, Problem 1]
* Question (mwong70-stat660): What modification needed to display label in the output when using the PROC PRINT Statement?
* Answer (mwong70-stat660): We must add label option i.e. PROC PRINT DATA=data1 label noobs;



[SP2 Ls 4, Problem 1]
* Question (mwong70-stat660): True/False. The numeric range in FORMAT Statement is inclusive.
* Answer (mwong70-stat660): True. When you specify ranges in a custom format, a dash next to a number includes the value. For example, 0-9 includes the value 0 and all values up to and including 9.



[summarizing-qualitative-values Week 5 SAS Recipe]
* Question (mwong70-stat660): For numeric categorical data e.g. binary or non-ordinal numeric values, should we use FREQ or MEANS procedures to summarize?



[summarizing-quantitative-values Week 5 SAS Recipe]
* Question (mwong70-stat660): Some of the standard deviation values are missing, what does it mean?
* Answer (mwong70-stat660): Those with the number of observation = 1 has missing standard deviation. SAS computes standard deviation when the number of observation > 1.



[temporarily-binning-values Week 5 SAS Recipe]
* Question (mwong70-stat660): What is an example of the FORMAT Statement when combined the DATA STEP?



***



# Recipes Exploration Results



```
*******************************************************************************;
* SAS Recipe: summarizing-qualitative-values                                   ;
*******************************************************************************;
* Original recipe;
proc freq
        <additional options; e.g., noprint causes no output to be printed and
         nlevels summarize the number of unique values for each variable>
        data=<input dataset name>
    ;
    tables
        <one or more columns to include in output; if column names are
         separated by spaces, then separate tables will be output for each;
         if column names are separated by asterisks, then cross-tabulations
         will be computed>
        / <additional opions, depending on whether cross-tabulations will be
           computed; missing can be used so that rows with missing for the
           variables being summarized are included; list can be used in a
           cross-tabulation to stack output; and norow, nocol, and nopercent
           can be used to suppress row-level percentages, column-level
           percentages, and table-level percentages in a cross-tabulation,
           respectively>
    ;
run;



* Modified recipe to summarize the number of unique values for  each levels from
  columns Species and PetalWidth in a cross-tabulation frequency table ;
proc freq
        nlevels
        data=sashelp.iris
    ;
    table
        Species*PetalWidth
        / missing norow nocol nopercent
    ;
run;



*******************************************************************************;
* SAS Recipe: summarizing-quantitative-values                                  ;
*******************************************************************************;
* Original recipe;
proc means
        <list of statistics to compute; if left out, then the default statistics
         computed are number of rows, mean, standard deviation, min, and max>
        <additional options; e.g., noprint causes no output to be printed,
         maxdec=<non-negative integer> sets the maximum decimal precision, and
         missing causes rows with missing values to still be included>
        data=<input dataset name>
    ;
    class <list of one or more columns to treat as classification values>;
    var <list of one or more columns to compute specified statistics for>;
    output out=<output dataset name, if computed values should be captured>;
run;



* Modified recipe to group by Species and PetalWidth of the values in the 
  columns SepalLength and SepalWidth;
proc means
        data=sashelp.iris
        maxdec=1
        missing
    ;
    class
        Species
        PetalWidth
    ;
    var
        SepalLength
        SepalWidth
    ;
run;



*******************************************************************************;
* SAS Recipe: temporarily-binning-values                                       ;
*******************************************************************************;
* Original recipe;
proc format;
    value <format name, starting with a dollar sign ($) if using character
           input values, and following all other SAS variable name rules>
        <list or range of input values>=<output value>
        ...
        <list or range of input values>=<output value>
    ;
run;



* Modified recipe to create temporary binning ;
proc format;
    value $Species_bins;
       "Versicolor","Virginica"="Versicolor & Virginica (combined)"
        other="Not Versicolor or Virginica"
    ;
    value PetalWidth_bins
        low-9="Small Petal Width"
        10-18="Medium Petal Width"
        19-high="Large Petal Width"
    ;
run;

proc freq
        nlevels
        data=sashelp.iris
    ;
    table
        Species*PetalWidth
        / missing list
    ;
    format
        Species $Species_bins.
        PetalWidth PetalWidth_bins.
    ;
run;



```
