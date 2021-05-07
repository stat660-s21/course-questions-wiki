
# Questions about Problems and Recipes



[Chapter 11 Quiz, Problem 2]
Question (ckile2-stat660): During this DO loop statement where is it getting the value of Earned from? Amount is set to 1000 and Rate is set to .075/12, but Earned is not set to anything. Does this statement need to be followed by a PROC print statement in order to see the value of Earned? 


[Chapter 11 Quiz, Problem 3]
* Question (ckile2-stat660): When you run this program where is the value from Capital coming from? Is Capital a column in work.invest? What procedure would you run in order to print out a table showing the value of Capital before and after gaining interest? 


[Chapter 11 Quiz, Problem 4]
* Question (ckile2-stat660): Why is the value for Year  incremented to 2005 at the end of the 15th iteration of the DO loop? If this DO loop statement says do year= 1990 to 2004; why does the stored value for Year become 2005? 


[Chapter 11 Quiz, Problem 5]
* Question (ckile2-stat660): Why does the OUTPUT statement overrides the automatic output at the end of the DATA step? If the DO loop says do year=1990 to 2004; isn’t the last value of the Year in the new dataset 2005? 


[Chapter 11 Quiz, Problem 6]
* Question (ckile2-stat660): Will this DO loop statement run even though the OUTPUT statement is written following END; RUN;? Doesn’t the OUTPUT statement override the automatic output at the end of the DATA step? 


[Chapter 16 Quiz, Problem 1]
* Question (ckile2-stat660): What is an ODS statement and what is it used for?


[Chapter 16 Quiz, Problem 2]
* Question (ckile2-stat660): How would you create an EXCEL file as your output using ODS? What code would you use to create this EXCEL file? 


[Chapter 16 Quiz, Problem 3]
* Question (ckile2-stat660): What is RTF output? Why do you need to close the HTML destination in order to conserve system resources? 



[create-unique-record-ids  Week 8 SAS Recipe]
* Question (ckile2-stat660): What is this recipe doing to the iris dataset? Why does each flower record show the PetalLength, SepalLength, SepalWidth and PetalWidth values? 


[disaggregate-counts-data Week 8 SAS Recipe]
* Question (ckile2-stat660): Why do I get this error message when running this recipe :  ERROR: File WORK.SAT15_RAW.DATA does not exist? And these warnings: WARNING: The data set WORK.SAT15_STUDENT_LEVEL_DATA may be incomplete.  When this step was stopped there were 0 observations and 3 variables. WARNING: Data set WORK.SAT15_STUDENT_LEVEL_DATA was not replaced because this step was stopped? 


***



# Recipes Exploration Results




```
* Recipe: create-unique-record-ids ;

* original recipe;
data iris_with_record_ids;
	flower_record_id = "flower_record-"||put(_N_,z4.);
	set sashelp.iris;
run;

modified to label the flower_record_id = “petal_record-“ instead of “flower_record-“ in order to see the difference it would make; also changed z4. to z2. in order to see any discrepancies;
data iris_with_record_ids;
	flower_record_id = "petal_record-"||put(_N_,z2.);
	set sashelp.iris;
run;




* Recipe: disaggregate-counts-data;

* original recipe;
data sat15_student_level_data(drop=student_record_counter student_counter);
	retain student_record_id;
	retain student_record_counter 0;
	set sat15_raw(obs=100);
	where not(missing(enroll12));
	number_of_12th_graders = input(enroll12, best12.);
	do student_counter=1 to number_of_12th_graders;
		student_record_counter+1;
		student_record_id = "student_record-"||put(student_record_counter,z6.);
		output;
	end;
run;

modified to change the DO loop to add 2 instead of 1 to student_record_counter+2 instead of student_record_counter+1 in order too see the difference;
data sat15_student_level_data(drop=student_record_counter student_counter);
	retain student_record_id;
	retain student_record_counter 0;
	set sat15_raw(obs=100);
	where not(missing(enroll12));
	number_of_12th_graders = input(enroll12, best12.);
	do student_counter=1 to number_of_12th_graders;
		student_record_counter+2;
		student_record_id = "student_record-"||put(student_record_counter,z6.);
		output;
	end;
run;


```

