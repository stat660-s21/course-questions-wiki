
# Questions about Assigned Quiz Problems and Recipes



[Chapter 4 Quiz, Problem 1]
* Question (ypaulsen-stat660): When are quatation marks necessary in SAS data import steps? 
 * Answer (ypaulsen-stat660): Around file names/paths. 



[Chapter 4 Quiz, Problem 2]
* Question (ypaulsen-stat660): What is meant by delimit here? I expect the answers to be "tab", "comma", etc. but the answers are something else entirely.  
* Answer (ypaulsen-stat660): Apparently the question refered to all types of delimited files. 


[Chapter 4 Quiz, Problem 3]
* Question (ypaulsen-stat660): What is meant by delimit here? Here a file is said to be delimited by a period, which seems to be the meaning of the word that I expected in the previous question.  
* Answer (ypaulsen-stat660): It seems that this question 'delimit' in the sense that I expect it. 


[Chapter 4 Quiz, Problem 4]
* Question (ypaulsen-stat660): What is the advantage of reading in an excel file and writing it out to a SAS dataset? Why not work with the excel file, or a csv?  
* Answer (ypaulsen-stat660): SAS Seems limited in what it can do. 


[Chapter 4 Quiz, Problem 5]
* Question (ypaulsen-stat660): Why not use all of the variables?
* Answer (ypaulsen-stat660): Limited computing power? 


[Chapter 9 Quiz, Problem 1]
* Question (ypaulsen-stat660): What is noobs?    
* Answer (ypaulsen-stat660): "The NOOBS option suppresses the printing of observation numbers."


[Chapter 9 Quiz, Problem 2]
* Question (ypaulsen-stat660): This question makes me wonder what processing times are like in SAS since the operations are iterative rather than vectorized.   
* Answer (ypaulsen-stat660): I would like to play with some simulations or the like to explore this question. 


[Chapter 9 Quiz, Problem 3]
* Question (ypaulsen-stat660): When are else statements necessary and what do they do when paired with an if statement?   
* Answer (ypaulsen-stat660): "An ELSE statement executes only if the previous IF-THEN/ELSE statement is false." 


[Chapter 9 Quiz, Problem 4]
* Question (ypaulsen-stat660): Is there any advantage to the rigididty of SAS variable structures?   
* Answer (ypaulsen-stat660): This wasn't answered here, but I'm inclined to believe it has to do with databases. 


[Chapter 9 Quiz, Problem 5]
* Question (ypaulsen-stat660): What are the carets doing?  
* Answer (ypaulsen-stat660): ^= is equivalent to != in other languages.   


[Chapter 9 Quiz, Problem 8]
* Question (ypaulsen-stat660): This brings the same question to mind as Problem 4: Is there some advatage to all of the rigidity imposed by SAS?   
* Answer (ypaulsen-stat660): I'm still left with the same thoughts as with Q4. 



***



# Recipes Exploration Results



```SAS


[sas-recipe-basic-load-remote-file Week 2 SAS Recipe]
* Question (ypaulsen-stat660): What is the purpose of a temporary file? 


[sas_recipe-advanced-load-remote-excel-file Week 2 SAS Recipe]
* Question (ypaulsen-stat660): What is the function of the percent symbol? Or any of this code.    



***



# Recipes Exploration Results

/*sas-recipe-basic-load-remote-file*/
filename tempfile TEMP; 
proc http 
	method="get"
	url="https://tinyurl.com/stat660-sat15"
	out=tempfile
	;
run;

proc import
	file=tempfile
	out=sat15_raw
	dbms=xls;
run;
filename tempfile clear; 




/*sas_recipe-advanced-load-remote-excel-file*/

%macro loadDataIfNotAleadyAvailable(dsn,url,filetype);
	%put &=dsn;
	%put &=url;
	%put &=filetype;
	%if 
		%sysfunc(exist(&dsn.)) = 0 
	%then
		%do;
			%put Loading dataset &dsn. over the wire now...;
			filename tempfile TEMP;
			proc http
				method="get"
				url="&url."
				out="tempfile"
				;
			run;
			filename tempfile clear;
		%end;
	%else
		%do;
			%put Dataset &dsn. already exists. Please delete and try again.;
		%end;
%mend;
%loadDataIfNotAlreadyAvailable(
	sat15_raw,
	http://tinyurl.com/stat660-sat15,
	xls
)

```
