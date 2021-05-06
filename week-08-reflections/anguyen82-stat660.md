
# Questions about Assigned Quiz Problems and Recipes



[Chapter 11 Quiz, Problem 2]
* Question (anguyen82-stat660): What happens if I omit the end statement of the DO loop?
* Answer (anguyen82-stat660): An error occurs and execution stops.



[Chapter 11 Quiz, Problem 3]
* Question (anguyen82-stat660): Is the information, constant interest rate of 10% is expected, useful in constructing
the DO loop?
* Answer (anguyen82-stat660): No it is not.



[Chapter 11 Quiz, Problem 4]
* Question (anguyen82-stat660): 



[Chapter 11 Quiz, Problem 5]
* Question (anguyen82-stat660):



[Chapter 11 Quiz, Problem 6]
* Question (anguyen82-stat660):



[Chapter 16 Quiz, Problem 1]
* Question (anguyen82-stat660):



[Chapter 16 Quiz, Problem 2]
* Question (anguyen82-stat660):



[Chapter 16 Quiz, Problem 3]
* Question (anguyen82-stat660):



[create-unique-records-ids SAS Recipe]
* Question (anguyen82-stat660): 



[disaggregate-counts-data SAS Recipe]
* Question (anguyen82-stat660):



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
