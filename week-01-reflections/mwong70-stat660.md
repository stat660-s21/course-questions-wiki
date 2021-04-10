
# Questions about Assigned Quiz Problems and Recipes



[Course Structure Quiz, Problem 1]
* Question (mwong70-stat660): Because initializing a README file was an important element in initializing a repository, is there an industry standard of what needs to be in a README file since I only sometimes read comprehendible README files.
* Answer (mwong70-stat660): It appears that the SAS Community and SAS Blog are not a good place to find an answer to this question. From [computerhope.com](https://www.computerhope.com/jargon/r/readme.htm#:~:text=A%20README%20file%20is%20a,details%20about%20patches%20or%20updates), it says that a README file contains information about the software program, instructions, help support, and details about patches or updates. 



[Course Structure Quiz, Problem 2]
* Question (mwong70-stat660): For an industry professional, what are reasonable depths and frequency to know about the topics from these updates? Since I started [feedly](https://feedly.com/) 3 days ago, there appears to be many technical blog articles posted daily even if I focus only on statistical methodology based off the list of websites recommended through the class. That seems to be more frequent than peer-reviewed journals.



[Course Structure Quiz, Problem 3]
* Question (mwong70-stat660): For research in academia and industry, it appears that managing multiple projects at the same time is a common phenomenon. What is a good way to keep track of reflections for readings of various topics and lengthy literature?



[Course Structure Quiz, Problem 4]
* Question (mwong70-stat660): Wouldn't it be helpful to have more frequent Code Review at the earlier stages of the Project Steps?



[Course Structure Quiz, Problem 5]
* Question (mwong70-stat660): My answer is 60 for the number of Final Exam problems, but the answer says 40-60. Is it possible to validate an interval of numeric values as answer in the Blackboard quiz platform?



[Course Structure Quiz, Problem 6]
* Question (mwong70-stat660): Does earning Achievements affect level of engagement and where did this idea come from?



[Course Structure Quiz, Problem 7]
* Question (mwong70-stat660): What is the motivation in encouraging incomplete submissions rather than late submissions?



[Course Structure Quiz, Problem 8]
* Question (mwong70-stat660): In a growth mindset haven, would correcting mistakes be used as an incentive for extra credit?



[Course Structure Quiz, Problem 9]
* Question (mwong70-stat660): On "Instead of a carrier pigeon, what about an unladen swallow?", is that a Monty Python reference?
* Answer (mwong70-stat660): It might reference to a British metaphor since I heard of another bird reference from Monty Python i.e. an albatross has been lifted. I don't plan to verify since I'm not too familiar with Monty Python. Also, a carrier pigeon was probably used up to the WWII. They became less popular as a result of the rise of the telegraph. By process of elimination, a carrier pigeon was too obsolete to be the correct answer.



[Course Structure Quiz, Problem 10]
* Question (mwong70-stat660): Is it possible to turn off the notification for some of the submission channels? 



[hello-world Week 1 SAS Recipe]
* Question (mwong70-stat660): Is there a way of having SAS print to a different output destination than the log?
* Answer (mwong70-stat660): It's not that important to know, but it might be a good start to search in [Slack Help](https://slack.com/help).



[fizz-buzz Week 1 SAS Recipe]
* Question (mwong70-stat660): How do people writing an algorithm for iterations in programming languages correctly at a technical interview? I always use and check references since switching languages often cause me to stumble upon syntax errors.




***



# Recipes Exploration Results



```SAS
* SAS Recipe: hello-world ;
/*
Scenario: Printing to the SAS log.

Approach: Use a null data step and put statement to write to the log

Recipe <with everything in square brackets to be filled in for actual use>:

* original recipe;
data _null_;
    put "<message>";
run;
*/


* Example;
data _null_;
    put "Hello, World";
run;


* modified to print the content of a macro variable;
%let className = STAT660;
%put Hello &className!;
/* data step equivalent of the %put 
data _null_;
    put "Hello, &className.!";
run;
*/



* SAS Recipe: fizz-buzz ;
/*
Scenario: Solve a simplified version of the FizzBuzz Challenge

Approach: Use a null data step and business logic to write to the log

* original recipe;
data _null_;
    do i = 1 to 100;
        if mod(i,3) = 0 then put 'Fizz';
        else if mod(i, 5) = 0 then put 'Buzz';
        else put i=;
    end;
run;
*/


* Example;
data _null_;
    do i = 1 to 100;
        if mod(i,15) = 0 then put "Fizz Buzz";  /*print FizzBuzz if divisible by 15*/
        else if mod(i,3) = 0 then put "Fizz";   /*print Fizz if divisible by 3*/
        else if mod(i, 5) = 0 then put "Buzz";  /*print Buzz if divisible by 5*/
        else put i=;                            /*print value otherwise*/
    end;
run;


* modified to print the content of a macro variable;
%let mod1 = 15;
%let mod1msg = FizzBuzz;
%let mod2 = 3;
%let mod2msg = Fizz;
%let mod3 = 5;
%let mod3msg = Buzz;
data _null_;
    do i = 1 to 100;
	    if mod(i,&mod1.) = 0 then put "&mod1msg.";
		else if mod(i,&mod2.) = 0 then put "Fizz";
		else if mod(i,&mod3.) = 0 then put "Buzz";
		else put i=;
	end;
run;



```
