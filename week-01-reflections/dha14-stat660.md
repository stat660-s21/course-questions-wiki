
# Questions about Assigned Quiz Problems and Recipes



[Course Structure Quiz, Problem 1]
* Question (dha14-stat6660): What is the Initial Setup Achievement?
* Answer (dha14-stat6660): The Initial Setup Achievement might be obtained during the first week, in which GitHub, Slack and VMHorizon are set up properly for the course. 


[Course Structure Quiz, Problem 2]
* Question (dha14-stat6660): How many weekly posts are required and what achievement is associated with the completion of these posts?
* Answer (dha14-stat6660):6 out 7 weekly posts must be completed in order to earn the Reading for Breadth Achievement.


[Course Structure Quiz, Problem 3]
* Question (dha14-stat6660): How are the weekly reflections evaluated?
* Answer (dha14-stat6660):Weekly Reflections are graded based on quality and thoroughness. There will be SAS recipes in addition to the reflection. 6 out of 7
7 must be completed in order to obtain Reading for Depth Achievement.

[Course Structure Quiz, Problem 4]
* Question (dha14-stat6660): How many Weekly Project Steps are required to earn the corresponding achivement?' 
* Answer (dha14-stat6660):All Weekly Project Steps must be completed by their due dates


[Course Structure Quiz, Problem 5]
* Question (dha14-stat6660): How will the final exam be conducted for this class? 
* Answer (dha14-stat6660):The final can be accessed via Blackboard with 60 multiple choice questions and limited to 110 minutes. 

[Course Structure Quiz, Problem 6]
* Question (dha14-stat6660): How do you get A in this class?
* Answer (dha14-stat6660): An A can be obtained by fulfilling all achievement including Team-Based, Reading for Breadth, reading for depth, initial set up, and building general knowledge

[Course Structure Quiz, Problem 7]
* Question (dha14-stat6660): What is the policy for late submission? 
* Answer (dha14-stat6660): Late submission is unacceptable under any circumstances. Resubmission is allowed at the instructor's discretion. 

[Course Structure Quiz, Problem 8]
* Question (dha14-stat6660): Is it possible to earn extra credits? 
* Answer (dha14-stat6660): Extra credits are awarded if students point out a typo or make suggestion to the course

[Course Structure Quiz, Problem 9]
* Question (dha14-stat6660): What is the best way to contact the instructor?
* Answer (dha14-stat6660): The best method to reach the instructor is via direct message on Slack.

[Course Structure Quiz, Problem 10]
* Question (dha14-stat6660): What are the technologies used for STAT 660?
* Answer (dha14-stat6660): The technologies used in this course  are GitHub, Blackboard, BayCloud, and Slack. 

[Recipe Hello-world]
* Question (dha14-stat6660): Why does data null have underscore before and after its name?
* Answer (dha14-stat6660): the keyword _null_ defines a dataset with no observations and no variables, whereas null with no underscores around it is a dataset with observations and variables. 

[Recipe Fizz Buzz]
* Question (dha14-stat6660): What does function mod do?
* Answer (dha14-stat6660): The MOD function returns the remainder from the division of a by q.
***



# Recipes Exploration Results



```SAS

data _null_;
    put "Hello World";
run;
*/


* Example;

data _null_; 
	do i = 1 to 100; 
		if mod(i, 3) = 0 then put 'Fizz'; 
		else if mod(i, 5)= 0 then put 'Buzz'; 
		else put i=; 
	end; 
run; 

