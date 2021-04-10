
# Questions about Assigned Quiz Problems and Recipes

[Course Structure Quiz, Problem 1]
* Question (ypaulsen-stat6660): How many week 1 setup components did I complete? 

This is the final one! 

[Course Structure Quiz, Problem 2]
* Question (ypaulsen-stat6660): Are R blogs allowed? 

Yes. Blogs need not be SAS specific. 

[Course Structure Quiz, Problem 3]
* Question (ypaulsen-stat6660): Do I need to buy the textbook? 

No. I found the pdf. 

[Course Structure Quiz, Problem 4]
* Question (ypaulsen-stat6660): What is the goal of the project? 

To develop analyses in SAS. 

[Course Structure Quiz, Problem 5]
* Question (ypaulsen-stat6660): Where can I become certified? 

SAS 

[Course Structure Quiz, Problem 6]
* Question (ypaulsen-stat6660): All achievements necessary to earn A? 

Yes

[Course Structure Quiz, Problem 7]
* Question (ypaulsen-stat6660): Will late submissions be accepted for week 1?   

Thankfully, yes. 

[Course Structure Quiz, Problem 8]
* Question (ypaulsen-stat6660): How is extra credit applied to achievements? 

I didn't find an answer to this one. 

[Course Structure Quiz, Problem 9]
* Question (ypaulsen-stat6660): When did CSU adopt Slack? 

COVID pandemic?

[Course Structure Quiz, Problem 10]
* Question (ypaulsen-stat6660): Can I use my other CSUEB email account? 

Doesn't seem like it.  




***



# Recipes Exploration Results



```SAS

data _null_; 
 	put 'Hello, world!'; 
 run;

```


```SAS

data _null_; 
	do i = 1 to 100; 
		if mod(i, 15) = 0 then put 'Fizz Buzz' ; 
		else if mod(i, 3) = 0 then put 'Fizz' ; 
		else if mod(i, 5) = 0 then put 'Buzz' ; 
		else put i=; 
	end; 
run;

```