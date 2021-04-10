
# Questions about Assigned Quiz Problems and Recipes
# Questions about Problems and Recipes



[Course Structure Quiz, Problem 1]
* Question (ckile2-stat660: Why is GitHub a crucial component to this class? Do many statistical programmers use Github? 



[Course Structure Quiz, Problem 2]
* Question (ckile2-stat660: Was I supposed to read the first chapter of the textbook this week? 



[Course Structure Quiz, Problem 3]
* Question (ckile2-stat660: Will every weekly reflection consist of asking questions about the course material?


[Course Structure Quiz, Problem 4]
* Question (ckile2-stat660: Since the weekly project is team based do we get to work with a classmate on this assignment? 



[Course Structure Quiz, Problem 5]
* Question (ckile2-stat660: Are we allowed to use our class notes during the exam? 



[Course Structure Quiz, Problem 6]
* Question (ckile2-stat660: Will you be curving our grades for this class? 



[Course Structure Quiz, Problem 7]
* Question (ckile2-stat660: Do late submissions get zero credit or is it up to the professor’s discretion? 




[Course Structure Quiz, Problem 8]
* Question (ckile2-stat660: What counts as substantive suggestions for improving clarity in course materials? Does it have to be several suggestions or does one suggestion count as extra credit? 



[Course Structure Quiz, Problem 9]
* Question (ckile2-stat660: Why is slack preferred over email? 



[Course Structure Quiz, Problem 10]
* Question (ckile2-stat660: Will you be uploading course content on Github? Does Github show us what our classmates are working on? 



[hello-world Week 1 SAS Recipe]
* Question (ckile2-stat660: Can you use ‘print’ instead of ‘then put’? 



[fizz-buzz Week 1 SAS Recipe]
* Question (ckile2-stat660: Why doesn’t i % 3== 0 work the same as mod(i, 3) =0 ? 






***



# Recipes Exploration Results



```SAS

* Recipe: hello-world ;

* original recipe;
data _null_;
    put 'Hello, World!';
run;

*modified to use a macro variable within a data step

%let month = March;
data _null_;
    put “My appointment is in &month..”;
run;


* Recipe: fizz-buzz ;

* original recipe;
data _null_;
    do i = 1 to 100;
        if mod(i,3) = 0 then put 'Fizz';
        else if mod(i, 5) = 0 then put 'Buzz';
        else put i=;
    end;
run;

* modified to use macro variables to parametrize what's printed when;

%let fig = 4;
%let drink = Sweet;
%let plum = 7;
%let purple = Tea;
data _null_;
    do i = 1 to 100;
        if mod(i,&fig.) = 0 then put "&drink.";
        else if mod(i, &plum.) = 0 then put "&purple.";
        else put i=;
    end;
run;




```
