
# Questions about Assigned Quiz Problems and Recipes


#Questions about Problems and Recipes



[Course Structure Quiz, Problem 1]
* Question (anguyen82-stat660): How did the terms fork and cloning come about?



[Course Structure Quiz, Problem 2]
* Question (anguyen82-stat660): How many articles is a healthy amount to read a week?



[Course Structure Quiz, Problem 3]
* Question (anguyen82-stat660): Do software developers in the workplace perform weekly reflections like this?



[Course Structure Quiz, Problem 4]
* Question (anguyen82-stat660): Will code reviews be done collaboratively or 1 on 1?



[Course Structure Quiz, Problem 5]
* Question (anguyen82-stat660): Will the final exam act as a sort of "practice" for the SAS certification test?



[Course Structure Quiz, Problem 6]
* Question (anguyen82-stat660): How can I measure my progress in each of the achievements? That is, what can I use as a guide post to make sure I am still on track?



[Course Structure Quiz, Problem 7]
* Question (anguyen82-stat660): Are early submissions preferred rather than closer to the deadline in case there are issues with a submission?



[Course Structure Quiz, Problem 8]
* Question (anguyen82-stat660): What would count as substantive suggestion for improving clarity in course materials?



[Course Structure Quiz, Problem 9]
* Question (anguyen82-stat660): I am rather new to slack. The last time I used it was during an internship. Is there a particular reason why it is a preferred communication platform? I rather like it!



[Course Structure Quiz, Problem 10]
* Question (anguyen82-stat660): Besides blackboard and csueb horizon mail, how widespread is slack, github, and blackboard used?



[hello-world Week 1 SAS Recipe]
* Question (anguyen82-stat660): Is there a print procedure/function in SAS where I can directly print out a hello world message or do I have to define a data variable first?



[fizz buzz Week 1 SAS Recipe]
* Question (anguyen82-stat660): Is mod the modulus operator? That is am I dividing i by 3 and see if I have a remainder?



***



# Recipes Exploration Results



```SAS


data _null_;
   put "Hello, STAT 660! This is <your-name>!";
run;

* Modified Code

data _null_;
   put "Hello, STAT 660! This is Paul Nguyen!";
run;


* Recipe fizz-buzz

data _null_;
   do i = 1 to 100;
      if mod(i,3) = 0 then put "<your-first-name>";
	  else if mod(i, 5) = 0 then put "<your-last-name>";
	  else put i=;
   end;
run;

* Modified Code

/* Modified with name and numbers divisble by both 2 and 5 */

data _null_;
   do i = 1 to 100;
      if mod(i, 2) = 0 then put "Paul";
	  else if mod(i, 5) = 0 then put "Nguyen";
	  else put i=;
   end;
run;

```
