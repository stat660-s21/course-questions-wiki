
# Questions about Assigned Quiz Problems and Recipes

[TB Chapter 10, Question 1 ] 
* Question (dha14-stat660): When does SAS stop processing the DATA step?
* Answer (dha14-stat660): When the SET statement reaches end of file of the shorter data set.

[TB Chapter 10, Question 2 ] 
* Question (dha14-stat660): How does SAS process MERGE statement? 
* Answer (dha14-stat660): SAS will add the second dataset to the first dataset.


[TB Chapter 10, Question 3 ] 
* Question (dha14-stat660): What is the difference between one and two SET statements in the DATA step?  
* Answer (dha14-stat660): One SET statement followed by the names of 2 datasets means concatenation, whereas two separate SET statements followed by a single dataset name means combining datasets. In the latter case, SAS will stop at the end of file of the shorter dataset. 

[TB Chapter 10, Question 4 ] 
* Question (dha14-stat660): How does concatenation work in SAS? 
* Answer (dha14-stat660): Concatenation is specified by the SET statement in  the DATA step followed by the names of concatenated datasets. SAS reads each dataset sequentially in the order that they are mentioned in the SET statement. In other words, SAS stacks up the datasets and presents missing values with a single dot. 

[TB Chapter 10, Question 5 ] 
* Question (dha14-stat660): What happens when there are 2 variables with the same in match-merge?
* Answer (dha14-stat660):The values of the same-named variable in the first dataset overwrites the values of same-named variable in subsequent input datasets.  

[TB Chapter 10, Question 6 ] 
* Question (dha14-stat660): What is the IN option in the MERGE statement?
* Answer (dha14-stat660): The IN= option tells SAS to create an "indicator variable" that takes on either the value 0 or 1 depending on whether or not the current observation comes from the input data set

[TB Chapter 10, Question 7 ] 
* Question (dha14-stat660): How do you prevent SAS from overwriting same-named variables in match-merging process? 
* Answer (dha14-stat660): You can rename the variable in either one of the input dataset.


[TB Chapter 10, Question 8 ] 
* Question (dha14-stat660): Can you perform match-merge without sorting the datasets first? 
* Answer (dha14-stat660): No. DATA step will fail. 


[TB Chapter 10, Question 9 ] 
* Question (dha14-stat660): What happens if there is no matched observation in match-merge? 
* Answer (dha14-stat660): SAS still creates an entry for that observation (in sorted order), with missing character value presented as blank and missing numeric value as single dot. 

[TB Chapter 10, Question 10 ] 
* Question (dha14-stat660): What if the input dataset has many observations for the same value, how does SAS process match-merge in this case? 
* Answer (dha14-stat660): The value is retained from the previous observation because the BY variable value did not change.

[SAS Recipe: Combining-data-horizontally] 
* Question (dha14-stat660): What is the purpose of setting the labels of all variables to blank? 


[SAS Recipe: Combining-data-vertically ] 
* Question (dha14-stat660): What is the purpose the assingment statement data source?

***



# Recipes Exploration Results



```SAS
* SAS Recipe: combining-data-horizontally-with-data-step ;
data code_2014_analytic_file_v1; 
	retain 		
		CDS_Code
		School
		UC_Coursework_Completers
		SAT_Takers
		Twelfth_Graders
		Excess_SAT_Takers
	; 
	keep 
		CDS_Code
		School
		UC_Coursework_Completers
		SAT_Takers
		Twelfth_Graders
		Excess_SAT_Takers
	; 
	label 
		CDS_Code=" "
		School=" "
		UC_Coursework_Completers=" "
		SAT_Takers=" "
		Twelfth_Graders=" "
		Excess_SAT_Takers=" "
	; 
	merge 
		gradaf15_raw(rename=(TOTAL=UC_Coursework_Completers))
		sat15_raw(
			rename=(
				cds=CDS_Code
				sname=School
				NumTstTakr=SAT_Takers
				enroll12=Twelfth_Graders
				
			)
		)
	; 
	by 	
		CDS_Code
	; 
	Excess_SAT_Takers= 
		input(SAT_Takers, best12.)
		- 
		input(UC_Coursework_Completers, best12.)
	; 
run; 

* SAS Recipe: combining-data-vertically-with-data-step ;
data frpm_analytic_file_v1; 
	set
		frpm1415_raw(in=ay2014_data_row)
		frpm1516_raw(in=ay2015_data_row)
	; 
	if 
		ay2014_data_row=1
	then 
		do; 
			data_source="1415"; 
		end; 
	else 
		do; 
			data_source="1516"
		end; 
run; 



```
