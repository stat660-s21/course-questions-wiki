
# Questions about Assigned Quiz Problems and Recipes

+*******************************************************************************;
**************** 80-character banner for column width reference ***************;
* (set window width to banner width to calibrate line length to 80 characters *;
*******************************************************************************;

Chapter 10
[Course Structure Quiz, Problem 1]
* Question(mshenkute-stat660): Why do we need two ‘set’ statements in choice a? 
* Answer(mshenkute-stat660): When used with a data step, it combines data sets 
by one to one reading of rows.

[Course Structure Quiz, Problem 2]
* Question(mshenkute-stat660): What does the merge statement in choice d do?
* Answer(mshenkute-stat660): We use this when we have a one to one or one to many
merge. A one-to-one merge is when a column from one data set matches another cell 
by cell. One-to-Many is when one value has two or more corresponding matches. 
					
[Course Structure Quiz, Problem 3]
* Question(mshenkute-stat660): What would the code do to the two datasets?
* Answer(mshenkute-stat660): The set statement concatenates or joins the two 
datasets. It will give the output in choice a.

[Course Structure Quiz, Problem 4]
* Question(mshenkute-stat660): What code would concatenate the three datasets? 
* Answer(mshenkute-stat660): data newdataset
			                           Set Work.Reps Work.Close Work.Bonus
			                       Run; 
			                       Proc print data newdataset; run;

[Course Structure Quiz, Problem 5]
* Question(mshenkute-stat660): What kind of merge matching is this?
* Answer(mshenkute-stat660): This is one to one since we are merging by SSN column

[Course Structure Quiz, Problem 6]
* Question(mshenkute-stat660): What does the if statement do?
* Answer(mshenkute-stat660): It’s a conditional statement where by the both in1 and 
in2  from cert.set1 and cert.set2 are included in the observation.

[Course Structure Quiz, Problem 7]
* Question(mshenkute-stat660): What do we use the IN= variable for?
* Answer(mshenkute-stat660): It is used to create temporary variables. 


[Course Structure Quiz, Problem 8]
* Question(mshenkute-stat660): Could we concatenate by units?
* Answer(mshenkute-stat660): 

[Course Structure Quiz, Problem 9]
* Question(mshenkute-stat660): What is the result of Merging the two data sets by ID?
* Answer(mshenkute-stat660): It will give us a dataset that contains the most
Observations with the highest number of rows.

[Course Structure Quiz, Problem 10]
* Question(mshenkute-stat660): Would this merged dataset contain any missing values?
* Answer(mshenkute-stat660): No since each ID can be matched to a bonus and close.


***


# Recipes Exploration Results


```SAS

/* Question: What is the rename function doing?
Answer: It is renaming the columns from the two datasets into one column with a
unique ID.*/

data cde_2014_analytic_file_v1;
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
		input(SAT_Takers,best12.)
		-
		input (UC_Coursework_Completers,best12.); 
run;



/* Question: What are the do end codes computing?
Answer: This is part of a defensive programming practice.
It is not necessary in this code to wrap in do/end but could 
come in handy for future use.*/

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
			data_source="1516";
		end;
run;


```
