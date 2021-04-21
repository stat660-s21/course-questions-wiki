
# Questions about Assigned Quiz Problems and Recipes


[Textbook Chapter 12, Problem 3]
* Question (slin51-stat660): Is there a maximum character length to a new format's name?
* Answer (slin51-stat660): Yes, 32,767 characters


[Textbook Chapter 12, Problem 4]
* Question (slin51-stat660):  Why are commas not needed to separate each label?


[Textbook Chapter 12, Problem 5]
* Question (slin51-stat660): Why is the maximum numeric value 1500?


[Textbook Chapter 12, Problem 6]
* Question (slin51-stat660):  How was the number 32,767 decided?


[Textbook Chapter 12, Problem 7]
* Question (slin51-stat660): Why was the keyword OTHER picked instead of MISSING? MISSING is more intuitive.


[Textbook Chapter 15, Problem 4]
* Question (slin51-stat660): What is the purpose of BY if CLASS offers more flexibility and does the same thing?


[Textbook Chapter 15, Problem 5]
* Question (slin51-stat660):  Is there a limit to the number of variables the CLASS produced table will display?


[Textbook Chapter 15, Problem 6]
* Question (slin51-stat660): Where are the labels for AvgAge, AvgHeight, and AvgWeight?


[Textbook Chapter 15, Problem 9]
* Question (slin51-stat660):  Where is htfmt. and wtfmt. defined?


[Textbook Chapter 15, Problem 10]
* Question (slin51-stat660): Why is the specification of table information to exclude separate by a /?


***



# Recipes Exploration Results



```
* Recipe: summarizing-qualitative-values;

proc freq
        nlevels
        data=sashelp.iris
    ;
    table
        Species*PetalWidth
        / missing norow nocol nopercent
    ;    
run;


```

* Question (slin51-stat660): What does nlevels do?


```

* Recipe: summarizing-quantitative-values;

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

```

* Question (slin51-stat660): Why is there a missing in proc means?



```
* Recipe: temporarily-binning-values ;

proc format;
    value $Species_bins
    	"Versicolor","Virginica"="Versicolor & Virginica (combined)"
    	other="Not Versicolor or Virginica"
    ;
    value $PetalWidth_bins
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

* Question (slin51-stat660): What does the output _null_ mean?


