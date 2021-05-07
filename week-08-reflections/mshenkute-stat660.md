
# Questions about Assigned Quiz Problems and Recipes



Chapter 11
[Course Structure Quiz, Problem 2]
* Question(mshenkute-stat660): How many times does this loop?
* Answer(mshenkute-stat660): 12 times 

[Course Structure Quiz, Problem 3]
* Question(mshenkute-stat660): How can we track the result of each iteration?
* Answer(mshenkute-stat660): Using the output statement inside the do statement 
prints all 15 observations. 

[Course Structure Quiz, Problem 4]
* Question(mshenkute-stat660): What is stored value and what is it in this case?
* Answer(mshenkute-stat660): In the end of the iteration, the value of year will 
be stored as 2004.

[Course Structure Quiz, Problem 5]
* Question(mshenkute-stat660): Is the last iteration 2004 or 2005?
* Answer(mshenkute-stat660): After computing for the year 2004, the loop will 
be incremented to 2005, but it will have stopped executing the DO loop. 

[Course Structure Quiz, Problem 6]
* Question(mshenkute-stat660): What would the 2nd observation calculate?
* Answer(mshenkute-stat660): 3762.5

Chapter 16

[Course Structure Quiz, Problem 1]
* Question(mshenkute-stat660): How are ODS statements used?
* Answer(mshenkute-stat660): They are used to specify outputs for destinations.

[Course Structure Quiz, Problem 2]
* Question(mshenkute-stat660): What output is created by the code?
* Answer(mshenkute-stat660): Both html and pdf

[Course Structure Quiz, Problem 3]
* Question(mshenkute-stat660): What do ODS open and close statements execute?
* Answer(mshenkute-stat660): Open destination is for the type of output and 
Close destination is the type of output.	



***



# Recipes Exploration Results



```SAS


/* Question:Is _N_ part of the ouput?
Answer: It is dropped from the final output, even if it is included in code
computation.*/

data iris_with_record_ids;
	flower_record_id = "flower_record-" || put(_N_, z4.);
	set sashelp.iris;
run;

/*Question: What does || signify?
Answer:It is a concatenating operator. Here it concatenates the string student_
record with a numerical value for student_record_counter.*/

data sat15_student_level_data(drop=student_record_counter student_counter);
	retain student_record_id;
	retain student_record_counter 0;
	set sat15_raw(obs=100);
	where not(missing(enroll12));
	number_of_12th_graders= input (enroll12, best12.);
	do student_counter=1 to number_of_12th_graders;
		student_record_counter+1;
		student_record_id = "student_record-" ||put(student_record_counter,z6.);
		output;
	end;
run;


```
