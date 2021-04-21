
# Questions about Assigned Quiz Problems and Recipes


[Course Structure Quiz, Problem 1]
* Question (mshenkute-stat6660): What does professor mean by recipe? 
* Answer (mshenkute-stat6660): It is not in syllabus but first mention 
of this term or usage is while talking about SAS code during week 1 reflections. 

[Course Structure Quiz, Problem 2]
* Question (mshenkute-stat6660): How does prof determine an assignment is met or not? 
* Answer (mshenkute-stat6660): I am not sure on this, is it on completion or perfect 
score? Not mentioned in syllabus. 

[Course Structure Quiz, Problem 3]
* Question (mshenkute-stat6660): Do all reflections need to be completed to get the 
"met" achievment grade?
* Answer (mshenkute-stat6660): Yes. 

[Course Structure Quiz, Problem 4]
* Question (mshenkute-stat6660): Do all project steps need to be completed to get 
the "met" achievment grade?
* Answer (mshenkute-stat6660):  Yes

[Course Structure Quiz, Problem 5]

* Question (mshenkute-stat6660): What is the best way to prep for the final exam? 
Is it open book?
* Answer (mshenkute-stat6660):  The final exam is close to the weekly reflections. 
No, it is not openbook!

[Course Structure Quiz, Problem 6]

* Question (mshenkute-stat6660): What is even the purpose of the 5 achievements? 
* Answer (mshenkute-stat6660):  The syllabus indicates that this promotes a growth
mindset in this course. Considering where I started, I can already see how this 
makes sense!

[Course Structure Quiz, Problem 7]

* Question (mshenkute-stat6660): How are late and incomplete submissions determined? 
How much time is given for resub?
* Answer (mshenkute-stat6660): This seems to be upto the professor's descretion. 
How many resubmissions are allowed?

[Course Structure Quiz, Problem 8]

* Question (mshenkute-stat6660): How clear are the course instructions for me so far? 
* Answer (mshenkute-stat6660): I think they are clear, and detailed. 

[Course Structure Quiz, Problem 9]

* Question (mshenkute-stat6660): What is the importance of using slack instead of 
email in this class? 
* Answer (mshenkute-stat6660): My guess is to get familiar with the platform, 
as more work places are beginning to use it more. 

[Course Structure Quiz, Problem 10]

* Question (mshenkute-stat6660): Which platform will I need to focus on? 
* Answer (mshenkute-stat6660):  I think personally, I need to focus on getting 
comfortable with github. 


***



# Recipes Exploration Results



```SAS


# SAS Recipe Hello World

data _null_;
  put "Hello, World!";
run;

* Question (mshenkute-stat6660):What is the significant of a put statement? 
* Answer (mshenkute-stat6660): We can use this to see how far we have been coding without an error. 

* Question (mshenkute-stat6660):What does _null_ do? 
* Answer (mshenkute-stat6660): It prevents the outputting of a new dataset from the data step.

#SAS Recipe fizz-buzz
data _null_; 
    do i = 1 to 100; 
        if mod(i, 15) = 0 then put 'Fizz Buzz' ; 
        else if mod(i, 3) = 0 then put 'Fizz' ; 
        else if mod(i, 5) = 0 then put 'Buzz' ; 
        else put i=; 
    end; 
run;

Question (mshenkute-stat6660):What is this code executing here? 
Answer (mshenkute-stat660): It is arranging all the numbers divisible by 3 into "Fizz" and those divisible by 5 into "Buzz".


```
