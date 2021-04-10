
# Questions about Assigned Quiz Problems and Recipes


[Course Structure Quiz, Problem 1]
* Question (rbian-stat660): Are all the Week 1 Setup components required to be completed every week?
* Answer (rbian-stat660): Yes.


[Course Structure Quiz, Problem 2]
* Question (rbian-stat660): Do we need to complete forum posts every week?
* Answer (rbian-stat660): No, at least 6 forum posts need to be completed.


[Course Structure Quiz, Problem 3]
* Question (rbian-stat660): Can some weekly reflections be skipped and still get a full credit?
* Answer (rbian-stat660): No, not like the forum posts, all the weekly reflections need to be submitted.


[Course Structure Quiz, Problem 4]
* Question (rbian-stat660): Is the project a team-based problem?
* Answer (rbian-stat660): Yes, but everyone should contribute to the project.


[Course Structure Quiz, Problem 5]
* Question (rbian-stat660): How can we be well-prepared for the final exam?
* Answer (rbian-stat660): We need to understand all the weekly reflection problems including the concepts involved to the that.


[Course Structure Quiz, Problem 6]
* Question (rbian-stat660): Are all the five achievements important to our future work?
* Answer (rbian-stat660): Yes, I think so.


[Course Structure Quiz, Problem 7]
* Question (rbian-stat660): If we can not complete assignments before deadline, what is the best way to get good course grades?
* Answer (rbian-stat660): We can just submit what we have by a deadline, and then use resubmissions to work towards meeting all assignment expectations.


[Course Structure Quiz, Problem 8]
* Question (rbian-stat660): Is extra credit a good way to create a more interactive class?
* Answer (rbian-stat660): Yes, erveryone is encouraged to make suggestions.


[Course Structure Quiz, Problem 9]
* Question (rbian-stat660): is using Slack Desktop necessary to this course?
* Answer (rbian-stat660): Yes, Slack workspace is an important place where we can work with each other.


[Course Structure Quiz, Problem 10]
* Question (rbian-stat660): If most important messages are sent through Slack workspace, can we ignore some other technologies like CSUEB-provided Horizon Email?
* Answer (rbian-stat660): No, all the four technologies need to be check every day.


[hello-world Week 1 SAS Recipe]
* Question (rbian-stat660): Is a indent necessary in SAS programming even though sometimes it won't influence the outputs?
* Answer (rbian-stat660): Yes, we should always keep an eye on it.


[fizz-buzz Week 1 SAS Recipe]
* Question (rbian-stat660): Can we add additional if-then statements under the esisting if-then command?
* Answer (rbian-stat660): Yes.


***



# Recipes Exploration Results


```SAS

* Recipe: hello-world ;

* original recipe;
data _null_;
    put 'Hello, World!';
run;


* modified to print the content of a macro variable;
* note the need to switch to double-quote for the macro variable to render;
%let className = STAT 660;
data _null_;
    put "Hello, &className.!";
run;

```


```SAS

* Recipe: fizz-buzz ;

* original recipe;
data _null_;
    do i = 1 to 100;
        if mod(i,3) = 0 then put 'Fizz';
        else if mod(i,5) = 0 then put 'Buzz';
        else put i=;
    end;
run;


* modified code so that both first name and last name are printed when a number is divisible by both three and five;
* try to change the order of the if-then statements to optimize and simplify codes;
data _null_;
    do i = 1 to 100;
        if mod(i, 3) = 0 and mod(i, 5) ^= 0 then put "Ran";
        else if mod(i, 5) = 0 and mod(i, 3) ^= 0 then put "Bian";
        else if mod(i, 3) = 0 and mod(i, 5) = 0 then put "Ran Bian";
        else put i=;
    end;
run;

data _null_;
    do i = 1 to 100;
        if mod(i, 3) = 0 and mod(i, 5) = 0 then put "Ran Bian";
        else if mod(i, 5) = 0 then put "Bian";
        else if mod(i, 3) = 0 then put "Ran";
        else put i=;
    end;
run;

```
