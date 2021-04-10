
# Questions about Assigned Quiz Problems and Recipes

[Course Structure Quiz, Problem 1]
* Question (slin51-stat660): Why is there a need to verify NetID when we can only join the Slack workspace with a horizon.csueastbay.edu email?


[Course Structure Quiz, Problem 2]
* Question (slin51-stat660): Since this is a SAS class, why are we not exclusively focusing on SAS blog posts?
* Answer (slin51-stat660): The main focus is on data science and statistical concepts. These concepts are applicable to any statistical language.


[Course Structure Quiz, Problem 3]
* Question (slin51-stat660):  Why are there no weekly programming problem sets?


[Course Structure Quiz, Problem 4]
* Question (slin51-stat660): How will code reviews for projects be conducted?


[Course Structure Quiz, Problem 5]
* Question (slin51-stat660): Is 68 percent the passing cutoff for the certification exams?



[Course Structure Quiz, Problem 6]
* Question (slin51-stat660): Since there are 5 total achievements, why is an A earned for all possible achievements and an A- for 3 achievements? What about for 4 achievements?



[Course Structure Quiz, Problem 7]
* Question (slin51-stat660): Can late submissions be counted towards course grades at the instructor's discretion?
* Answer (slin51-stat660): Yes, an example is the current "grading amnesty" currently in place.


[Course Structure Quiz, Problem 8]
* Question (slin51-stat660): Why does the instructor give extra credit for typos or constructive feedback related to clarity?


[Course Structure Quiz, Problem 9]
* Question (slin51-stat660): Are Slack notifications linked to the instructor's email?



[Course Structure Quiz, Problem 10]
* Question (slin51-stat660): If a student were to only check one technology, which would be the most important one to check?




***



# Recipes Exploration Results


```
* Recipe: hello-world ;

* original recipe;
data _null_;
    put 'Hello, World!';
run;

* Question (slin51-stat660): Do all statements end with a semicolon?

* modified text output;
data _null_;
    put 'Hello, STAT660 class.';
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

* Question (slin51-stat660): Are there for loops in SAS?

* modified dividing factor;
data _null_;
    do i = 1 to 100;
        if mod(i,8) = 0 then put 'Fizz';
        else if mod(i, 4) = 0 then put 'Buzz';
        else put i=;
    end;
run;

```
