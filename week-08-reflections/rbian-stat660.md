
# Questions about Assigned Quiz Problems and Recipes



[TextBook Chapter11 Quiz, Problem 2]
* Question (rbian-stat660): How to decide the number of iterations in a DO loop?
* Answer (rbian-stat660): It is the total number of from START value to STOP value after DO statement.


[TextBook Chapter11 Quiz, Problem 3]
* Question (rbian-stat660): Can we use character values in a index column?
* Answer (rbian-stat660): Yes, but if so we cannot use the ‘to’ statement between start and stop values.


[TextBook Chapter11 Quiz, Problem 4]
* Question (rbian-stat660): What will we get if we do not put OUTPUT command in a DO loop?
* Answer (rbian-stat660): We will get a row based on the final iteration of the DO loop. The index column will be an increment beyond the stop value.


[TextBook Chapter11 Quiz, Problem 5]
* Question (rbian-stat660): What will we get if we put OUTPUT command between DO and END statements?
* Answer (rbian-stat660): We will get one row for each iteration of the DO loop.


[TextBook Chapter11 Quiz, Problem 6]
* Question (rbian-stat660): Why do we have 20 observations but not one?
* Answer (rbian-stat660): Because we put OUTPUT statement between DO and END statements.


[TextBook Chapter16 Quiz, Problem 1]
* Question (rbian-stat660): In the ODS statements, if we generate many types of output, how can we close them all at once?
* Answer (rbian-stat660): We can use the keyword _ALL_ in the ODS CLOSE statement to close all open destinations at once.


[TextBook Chapter16 Quiz, Problem 2]
* Question (rbian-stat660): In the ODS statements, if we generate several types of output but not close any of them, what types of output will be created?
* Answer (rbian-stat660): All the types we have generated.


[TextBook Chapter16 Quiz, Problem 3]
* Question (rbian-stat660): If we do not close the HTML destination at the beginning of our program, can we get our desired type of output in the following ODS statements?
* Answer (rbian-stat660): Yes, closing the HTML is just for conserving the system resources.



[create-unique-record-ids Week 8 SAS Recipe]
* Question (rbian-stat660): what does the z4. Format mean?
* Answer (rbian-stat660): It is left-padded with zeros so that the resulting value is exactly 4-digit wide.


[disaggregate-counts-data Week 8 SAS Recipe]
* Question (rbian-stat660): How many iterations does the DO loop have?
* Answer (rbian-stat660): It is equal to the total number of 12th graders.



***



# Recipes Exploration Results



```SAS
* Recipe: create-unique-record-ids;

* original recipe;
Data iris_with_record_ids;
        flower_record_ids = “flower_record-“||put(_N_, z4.);
        Set sashelp.iris;
run;

* modified to use CAT statement;
Data iris_with_record_ids;
        flower_record_ids = cat(“flower_record-“,put(_N_, z4.));
        Set sashelp.iris;
run;
```

```SAS
* Recipe: disaggregate-counts-data;

* original recipe;
Data sat15_student_level_data(drop=student_record_counter student_counter);
    Retain student_record_id;
    Retain student_record_counter 0;
    Set sat15_raw(obs=100);
    Where not(missing(enroll12));
    Number_of_12th_graders = input(enroll12, best12.);
    Do student_counter=1 to number_of_12th_graders;
        student_record_counter+1;
        student_record_id=“student_record-“||put(student+record_counter,z6.);
        Output;
    End;
Run;

* modified to stop DO loop if student_record_id is greater than 50;
Data sat15_student_level_data(drop=student_record_counter student_counter);
    Retain student_record_id;
    Retain student_record_counter 0;
    Set sat15_raw(obs=100);
    Where not(missing(enroll12));
    Number_of_12th_graders = input(enroll12, best12.);
    Do student_counter=1 to number_of_12th_graders until (student_record_id > 50);
        student_record_counter+1;
        student_record_id=“student_record-“||put(student+recrd_counter,z6.);
        Output;
    End;
Run;
```
