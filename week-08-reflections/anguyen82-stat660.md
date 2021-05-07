
# Questions about Assigned Quiz Problems and Recipes



[Chapter 11 Quiz, Problem 2]
* Question (anguyen82-stat660): What happens if I omit the end statement of the DO loop?
* Answer (anguyen82-stat660): An error occurs and execution stops.



[Chapter 11 Quiz, Problem 3]
* Question (anguyen82-stat660): Is the information, constant interest rate of 10% is expected, useful in constructing
the DO loop?
* Answer (anguyen82-stat660): No it is not.



[Chapter 11 Quiz, Problem 4]
* Question (anguyen82-stat660): What is the code that increments the counter for the loop? Is it possible to use a list of words or characters instead?
* Answer (anguyen82-stat660): Yes with the SAS Statement DO index-variable=value1, value2, value3... ;


[Chapter 11 Quiz, Problem 5]
* Question (anguyen82-stat660): What is the purpose of the output statement before end?
* Answer (anguyen82-stat660): The OUTPUT statements writes current values to the data set immediately and overrides the automatic output at the end
of the DATA step.



[Chapter 11 Quiz, Problem 6]
* Question (anguyen82-stat660): What does the data being created look like in terms of rows and columns?



[Chapter 16 Quiz, Problem 1]
* Question (anguyen82-stat660): Can I specificy file locations per each output or will all the files generated be stored in one location?



[Chapter 16 Quiz, Problem 2]
* Question (anguyen82-stat660): Why is HTML the default format for ODS?



[Chapter 16 Quiz, Problem 3]
* Question (anguyen82-stat660): Given how powerful computers agre getting, will closing HTML step be necessary in the future?



[create-unique-records-ids SAS Recipe]
* Question (anguyen82-stat660): How many characters long will the unique ids generated will be?
* Answer (anguyen82-stat660): The new ID will be flower_record-xxxx where id # is padded with 0s. So the first record will be
flower_record-0001 and the tenth flower_record-0010


[disaggregate-counts-data SAS Recipe]
* Question (anguyen82-stat660): What does this code do that proc FREQ does not?
* Answer (anguyen82-stat660): The code works for more granular data at different levels. proc FREQ looks like it just lumps everything together.


***



# Recipes Exploration Results



```SAS



* Recipe: create-unique-record-ids;

* original recipe;
data iris_with_record_ids;
    flower_record_id = "flower_record-"||put(_N_,z4.);
	set sashelp.iris;
run;



* Recipe: disaggregate-counts-data SAS Recipe;

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

```
