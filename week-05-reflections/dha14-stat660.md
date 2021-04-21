
# Questions about Assigned Quiz Problems and Recipes
[TB Chapter 12, Question 3 ] 
* Question (dha14-stat660): Can a format name be numeric? 
* Answer (dha14-stat660): A format name can be numeric and is limited to 32 character long.

[TB Chapter 12, Question 4 ] 
* Question (dha14-stat660): Where in the proc format should semicolon(s) be placed?
* Answer (dha14-stat660): At the end of proc format statement and each of value statement.

[TB Chapter 12, Question 5 ] 
* Question (dha14-stat660): What types of values can be specified in the VALUE statement? 
* Answer (dha14-stat660): A single value, a range of numeric values, a range of character values,
			 but not a list of both numeric and character.


[TB Chapter 12, Question 6 ] 
* Question (dha14-stat660): What is the minimum and maximum length of a label?
* Answer (dha14-stat660): No minimun but maximum 32,767 characters inside quotation marks. 


[TB Chapter 12, Question 7 ] 
* Question (dha14-stat660): Is MISS and MISSING valid for labeling unspecified values?
* Answer (dha14-stat660):No, the valid keyword is OTHER.


[TB Chapter 15, Question 4 ] 
* Question (dha14-stat660): What is needed to be done prior to by-group processing?
* Answer (dha14-stat660): data must be sorted 

[TB Chapter 15, Question 5 ] 
* Question (dha14-stat660): What is the difference between CLASS and BY? 
* Answer (dha14-stat660): Unlike CLASS processing, BY-group processing requires 
			 that your data already be sorted or indexed in the order
			 of the BY variables. Unless data set observations are already sorted, 
			 you must run the SORT procedure before using PROC MEANS with any BY group.

[TB Chapter 15, Question 6 ] 
* Question (dha14-stat660): Can PROC FREQ also produce descriptive statistics?
* Answer (dha14-stat660): No, PROC FREQ only computes the frequency/percent and cumulative frequency/percent.


[TB Chapter 15, Question 9 ] 
* Question (dha14-stat660): Is there any difference in specifying which variable first in the TABLES statement? 
* Answer (dha14-stat660): yes, the first variable represents rows while the second variable represents columns.

[TB Chapter 15, Question 10 ] 
* Question (dha14-stat660): what is the function of the LIST statement in PROC FREQ?
* Answer (dha14-stat660): output displayed as list instead of tables


[SAS Recipe: summarizing-quanlitative-values Question]
* Question (dha14-stat660): What is the function of NLEVELS option in PROC FREQ?
* Answer (dha14-stat660): List out all the levels of each variable 


[SAS Recipe: summarizing-quantitative-values Question]
* Question (dha14-stat660): What is the difference between CLASS and VAR in PROC MEANS?
* Answer (dha14-stat660): VAR statement specifies what variables to include in the output, whereas CLASS statement enables you to estimate parameters for the levels of a categorical variable

[SAS Recipe: temporarily-binning-values Question]
* Question (dha14-stat660): what does the keyword LOW refer to?
* Answer (dha14-stat660): LOW includes the lowest number in the dataset.

***



# Recipes Exploration Results



```SAS
* SAS Recipe: summarizing-qualitative-values ;
proc freq
		nlevels
		data=sashelp.iris
	;
	table 
		Species*PetalWidth
		/ missing norow nocol nopercent
	; 
run;

* SAS Recipe: summarizing-quantitative-values ;
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

* SAS Recipe: temporarily-binning-values ;
proc format;
	value $Species_bins
		"Versicolor", "Virginica" = "Versicolor & Virginica (combined)"
		other= "Not Versicolor or Virginica"
	; 
	value PetalWidth_bins
		low-9= "Small Petal Width"
		10-18= "Medium Petal Width"
		19-high= "Large Petal Width"
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
