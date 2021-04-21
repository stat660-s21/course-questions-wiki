
# Questions about Assigned Quiz Problems and Recipes



[TextBook Chapter12 Quiz, Problem 3]
* Question (rbian-stat660): What is the difference between the format names applied to numeric data and character data?
* Answer (rbian-stat660): A format name must begin with a dollar sign if the format applies to character data.


[TextBook Chapter12 Quiz, Problem 4]
* Question (rbian-stat660): Where do we need to put a semicolon in FORMAT procedure?
* Answer (rbian-stat660): Every format statement begins with the keyword VALUE and ends with a semicolon after all the labels have been defined.



[TextBook Chapter12 Quiz, Problem 5]
* Question (rbian-stat660): What type of values can not the VALUE range support?
* Answer (rbian-stat660): A combination of character and numeric values.



[TextBook Chapter12 Quiz, Problem 6]
* Question (rbian-stat660): What do we need to pay attention to while specifying a label?
* Answer (rbian-stat660): 1)Enclose the label in quotation marks; 2)Limit the label to 32,767 characters.



[TextBook Chapter12 Quiz, Problem 7]
* Question (rbian-stat660): Does the keyword LOW not include missing values under any occasions?
* Answer (rbian-stat660): No, unless applied to a numeric format.



[TextBook Chapter15 Quiz, Problem 4]
* Question (rbian-stat660): What is the prerequisite before using BY statement?
* Answer (rbian-stat660): BY-group processing requires that your data already be sorted or indexed in the order of the BY variables.



[TextBook Chapter15 Quiz, Problem 5]
* Question (rbian-stat660): Can BY and CLASS statement produce the same output?
* Answer (rbian-stat660): No, BY statement creates multiple small tables and CLASS statement  produces a single large table.



[TextBook Chapter15 Quiz, Problem 6]
* Question (rbian-stat660): Is the PROC MEANS output the same with the PROC PRINT output?
* Answer (rbian-stat660): NO.



[TextBook Chapter15 Quiz, Problem 9]
* Question (rbian-stat660): How to decide the rows and columns of a two-way FREQ table?
* Answer (rbian-stat660): The statement TABLES col1 * col2, col1 specifies the rows and col2 specifies the columns.



[TextBook Chapter15 Quiz, Problem 10]
* Question (rbian-stat660): How to customize the contents of a FREQ table?
* Answer (rbian-stat660): By using the nofreq, norow, nocol, nopercent options.



[summarizing-qualitative-values Week 5 SAS Recipe]
* Question (rbian-stat660): If we want to get the colpercent value of a two-way frequency table, should we use the list option or not?
* Answer (rbian-stat660): No, the default statistics computed in the table with list option are freq, pct, cumfreq and cumpct.



[summarizing-quantitative-values Week 5 SAS Recipe]
* Question (rbian-stat660): Can we use the by option to replace class option?
* Answer (rbian-stat660): Yes only when we use the proc sort statement and by option before the proc means statement.



[temporarily—binning-values Week 5 SAS Recipe]
* Question (rbian-stat660): Can we specify several values and convert them to one formatted value?
* Answer (rbian-stat660): Yes, and character values must be in quotation marks.



***



# Recipes Exploration Results


```SAS
* Recipe: summarizing-qualitative-values;

* original recipe;
proc freq
        nlevels
        data=sashelp.iris
    ;
    table
        Species*PetalWidth
        /missing norow nocol nopercent
    ;
run;

* modified to use the list option;
%let className = STAT 660;
proc freq
        nlevels
        data=sashelp.iris
    ;
    table
        Species*PetalWidth
        /missing list
    ;
run;
```


```SAS
* Recipe: summarizing-quantitative-values;

* original recipe;
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

* modified to compute additional median;
proc means
        data=sashelp.iris
        mean min max median
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
```


```SAS
* Recipe: temporarily—binning-values;

* original recipe;
proc format
        value $Species_bins
            “Versicolor”, “Virginica” = “Versicolor & Virginica (combined)”
            other=“Not Versicolor or Virginica”
        ;
        value PetalWidth_bins
            Low-9 = “Small Petal Width”
            10-18 = “Small Petal Width”
            19-high = “Large Petal Width”
        ;
Run;
proc freq
        nlevels
        data=sashelp.iris
    ;
    table
        Species*PetalWidth
        /missing list
    ;
    format
        Species $Species_bins.
        PetalWidth PetalWidth_bins.
    ;
run;


* modified to create additional graphic;
ods graphics on
proc format
        value $Species_bins
            “Versicolor”, “Virginica” = “Versicolor & Virginica (combined)”
            other=“Not Versicolor or Virginica”
        ;
        value PetalWidth_bins
            Low-9 = “Small Petal Width”
            10-18 = “Small Petal Width”
            19-high = “Large Petal Width”
        ;
Run;
proc freq
        nlevels
        data=sashelp.iris
    ;
    table
        Species*PetalWidth
        /missing plot=freqplot
    ;
    format
        Species $Species_bins.
        PetalWidth PetalWidth_bins.
    ;
run;
```
