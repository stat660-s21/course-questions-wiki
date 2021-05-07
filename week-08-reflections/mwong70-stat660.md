
# Questions about Assigned Quiz Problems and Recipes



[TB Ch 11 Quiz, Problem 2]
* Question (mwong70-stat660): How does the DO loops work?
* Answer (mwong70-stat660): DO loops can have conditional clauses, can read data, and generate multiple observations.



[TB Ch 11 Quiz, Problem 3]
* Question (mwong70-stat660): Compare the DO loop and %DO.



[TB Ch 11 Quiz, Problem 4]
* Question (mwong70-stat660): What will happen when a value exceeds the stop value in a DO loop?
* Answer (mwong70-stat660): Nothing, the output will retain the original value since DO loop will not execute.



[TB Ch 11 Quiz, Problem 5]
* Question (mwong70-stat660): What can the OUTPUT statement do?
* Answer (mwong70-stat660): The OUTPUT statement can write current values to the data set and override the automatic output at the end of the DATA step.



[TB Ch 11 Quiz, Problem 6]
* Question (mwong70-stat660): How many observations can we expect in an output when executing a DO loop?
* Answer (mwong70-stat660): We can expect as many observations as the defined iterations in the DO loop.



[create-unique-record-ids Week 8 SAS Recipe, Problem 1]
* Question (mwong70-stat660): What is the function of the underscore in the data file names?
* Answer (mwong70-stat660): The underscores automate the drop function in data file.



[create-unique-record-ids Week 8 SAS Recipe, Problem 2]
* Question (mwong70-stat660): Is there a convention for the placement of a semicolon in a statement? Some semicolons are placed on the same line at the end of a statement, but other times, they are hanging on its own before the next statement.



[create-unique-record-ids Week 8 SAS Recipe, Problem 3]
* Question (mwong70-stat660): Confirmed with a subsequent CONTENTS procedure, the type of the new variable created in this recipe appears was character. What modifications are needed to create a numeric type of unique-ids?



[disaggregate-counts-data Week 8 SAS Recipe, Problem 1]
* Question (mwong70-stat660): What are some types of delimited separators used in SAS?
* Answer (mwong70-stat660): Commas (CSV), tabs (TSV), spaces, and pipes (|).



[disaggregate-counts-data Week 8 SAS Recipe, Problem 2]
* Question (mwong70-stat660): In numeric values, some statements include `z3.`, `z4.`, `best12.`, `best32.`, etc. What are they and explain how do they work?



***




# Recipes Exploration Results




```SAS



*******************************************************************************;
* SAS Recipe: create-unique-record-ids                                         ;
*******************************************************************************;
* Original Recipe;
data <output dataset name>;
    <record id variable name> = <record id prefix>||pur(_N_,<desired format>);
    set <input dataset name>;
run;



* Modified to create a char-type variable that assigns a unique-id for each obs;
data iris_with_record_ids;
    flower_record_id = "flower_record-"||put(_N_,z4.);
    set sashelp.iris;
run;



*******************************************************************************;
* SAS Recipe: disaggregate-counts-data                                         ;
*******************************************************************************;
* Original Recipe;
data <output dataset name>;
    retain <record id variable name>;
    retain <record counter variable name> 0;
    set <input dataset name>;
    do <index variable name>=1 to <count variable in input dataset>;
        <record counter variable name>+1;
        <record id variable name> = <record id prefix>||put(<record counter variable name>,<desired format>);
        output;
    end;
run; 



* Modified recipe to 
data sat15_student_level_data(drop=student_record_counter student_counter);
    retain student_record_id;
    retain student_record_counter 0;    /* resets counter to 0 */
    set sat15_raw(obs=100);             /* we evaluate the first 100 
                                           non-missing observations */
    where not(missing(enroll12);
    number_of_12th_graders = input(enroll12, best12.);
    do student_counter=1 to number_of_12th_graders;
        student_record_counter+1;
        student_record_id = "student_record-"||put(student_record_counter,z6.);
        output;
    end;
run;



```
