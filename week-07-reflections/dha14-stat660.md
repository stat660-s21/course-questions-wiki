
# Questions about Assigned Quiz Problems and Recipes

[TB Chapter 8, Question 1 ] 
* Question (dha14-stat660): Are LAST. and FIRST. variables included in the output dataset?  
* Answer (dha14-stat660): No, those are temporary variables and deleted before the dataset is outputted.

 [TB Chapter 8, Question 3 ] 
* Question (dha14-stat660): Where do _N_ and _ERROR_ variables appear?
* Answer (dha14-stat660): They appear in PDV, or compilation process of DATA step. 

[TB Chapter 8, Question 4 ] 
* Question (dha14-stat660): Must DESCENDING/ASCENDING be specified before or after a variable name?
* Answer (dha14-stat660): Before variable names 

[TB Chapter 8, Question 5 ] 
* Question (dha14-stat660): What types of observations are included in a BY group?
* Answer (dha14-stat660): all observations, including temporary and permanent

[TB Chapter 8, Question 6 ] 
* Question (dha14-stat660): How does SAS determin FIRST. variable? 
* Answer (dha14-stat660): SAS assigns the first observation of a BY group the value 1 and rest of the observations in the same group 0.

[TB Chapter 13, Question 1 ] 
* Question (dha14-stat660): How does SAS record the dates after January 1, 1960?  
* Answer (dha14-stat660): By the number of days from January 1,1960 to the given date. 

[TB Chapter 13, Question 2 ] 
* Question (dha14-stat660): What is a benefit of SAS dates?
* Answer (dha14-stat660): Can be used in calculations like numeric values. Then you can format to display dates. 

[TB Chapter 13, Question 4 ] 
* Question (dha14-stat660): What is DATE6.?
* Answer (dha14-stat660): *blank*ddmmm (total 6 spaces). 

[TB Chapter 14, Question 2] 
* Question (dha14-stat660): What is the difference between PUT() and INPUT()?
* Answer (dha14-stat660): PUT() always create character variables. INPUT() can create character or numeric variables based on the informat.

[TB Chapter 14, Question 6 ] 
* Question (dha14-stat660): What is the difference between SUBSTR and SCAN? 
* Answer (dha14-stat660): SCAN extracts words within a value that is marked by delimiters. SUBSTR extracts a portion of the value by stating the specific location. 

[TB Chapter 14, Question 7 ] 
* Question (dha14-stat660): What does function TRIM() do?
* Answer (dha14-stat660): Remove trailing blanks in front of variables.

[Recipe drop-and-swap] 
* Question (dha14-stat660): What is the purpose of rename option in DATA step?

[SAS Recipe: isolating-all-duplicates] 
* Question (dha14-stat660): How is the first./last. variable different from the dupout= approach?

***



# Recipes Exploration Results



```SAS

* SAS Recipe: isolating-all-duplicates ;
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
		first.SepalWidth*last.SepalWidth=0; 
	then 
		do; 
			output; 
		end; 
run; 

* SAS Recipe: drop-and-swap ;
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
	SepalLength=put(SepalLength_int, z3.); 
	SepalWidth=put(SepalWidth_int, z3.); 
	PetalLength=put(PetalLength_int, z3.); 
	PetalWidth=put(PetalWidth_int, z3.); 
run; 


```
