




# Questions about Problems and Recipes


CHAPTER 4
[Course Structure Quiz, Problem 1]
* Question (mshenkute-stat660): What is fileref?
*Answer (mshenkute-stat660): It is a name that is associated to an external file. 



[Course Structure Quiz, Problem 2]
* Question (mshenkute-stat660): What is LRECL?
* Answer (mshenkute-stat660): It is Logical Record Length which the default value is 256 and maximum is 32,767.

[Course Structure Quiz, Problem 3]
* Question (mshenkute-stat660): What does the code dbms and replace do here?
* Answer (mshenkute-stat660): DBMS specifies the type of data to import and replace overwrites an existing SAS data set. So it makes sense for the answer to be c. 


[Course Structure Quiz, Problem 4]
* Question (mshenkute-stat660): What is libref?
* Answer (mshenkute-stat660):It is a reference that points to the external dataset. 

[Course Structure Quiz, Problem 5]
* Question (mshenkute-stat660): What does datarow=1 do?
* Answer (mshenkute-stat660): could not find this answer on TB, but google says it Starts reading data from the specified row number in the delimited text file.


[Course Structure Quiz, Problem 6]
* Question (mshenkute-stat660): What does datafile=workbook do?
* Answer (mshenkute-stat660): It is what precedes a file name.

[Course Structure Quiz, Problem 7]
* Question (mshenkute-stat660): Are all three file types possible to be imported?
* Answer (mshenkute-stat660): Yes


[Course Structure Quiz, Problem 8]
* Question (mshenkute-stat660):What does BY statement do?
* Answer (mshenkute-stat660): It is used with a grouping variable.

CHAPTER 9
[Course Structure Quiz, Problem 1]
* Question (mshenkute-stat660): What does drop do?
* Answer (mshenkute-stat660):  It drops the variable indicated.


[Course Structure Quiz, Problem 2]
* Question (mshenkute-stat660): IF-THEN statements
* Answer (mshenkute-stat660): basically same as python and R, a conditional statement that can be used with and/or operator


[Course Structure Quiz, Problem 3]
* Question (mshenkute-stat660):Difference between an AND versus OR operator
* Answer (mshenkute-stat660): AND operator to execute the THEN statement if both expressions that are linked by AND are true. OR operator to execute the THEN statement if either expression that is linked by OR is true.

[Course Structure Quiz, Problem 4]
* Question (mshenkute-stat660):Can all three be the correct answers?
* Answer (mshenkute-stat660): Yes

[Course Structure Quiz, Problem 5]
* Question (mshenkute-stat660): The else logical operator
* Answer (mshenkute-stat660): we use this when we have to compute if-then statement with result false

[Course Structure Quiz, Problem 6]
* Question (mshenkute-stat660): Does $ have the same use here as when we use it for categorical variables?
* Answer (mshenkute-stat660): Not sure? 

[Course Structure Quiz, Problem 7]
* Question (mshenkute-stat660): 
* Answer (mshenkute-stat660): 


[Course Structure Quiz, Problem 8]
* Question (mshenkute-stat660):The keep variable?
* Answer (mshenkute-stat660): keeps the variables when you move stuff over to new dataset. Straight forward





***



# Recipes Exploration Results




```
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
* note the need to switch to double-quote for macro variables to render;
%let mod1 = 3;
%let mod1msg = Fizz;
%let mod2 = 5;
%let mod2msg = Buzz;
data _null_;
    do i = 1 to 100;
        if mod(i,& mod1.) = 0 then put "&mod1msg.";
        else if mod(i, &mod2.) = 0 then put "&mod1msg.";
        else put i=;
    end;
run;


```


filename tempfile TEMP;
PROC http
method="get"
url="https://tinyurl.com/stat-660-sat15"
out=tempfile
;
run;
proc import
file=tempfile
out= sat15_raw
dbms=xls;
run;
filename tempfile clear;
/*What does the last line do? Could we leave it out and the code still works?*/
%macro loadDataIfNotAlreadyAvailable (dsn, url,filetype);
%put &=dsn;
%put &=url;
%put &=filetype;
%if
	%sysfunc(exist(&=dsn.))=0
%then
	%do;
		%put Loading dataset &=dsn. over the wire now...;
filename tempfile TEMP;
proc http
	method="get'
	url="&url."
	out=tempfile
	;
	run;
	proc import
	file=tempfile
	out=&=dsn.
	dbms=&filetype.;
	run;
	filename tempfile clear;
	%end;
%else
	%do;
		%put Dataset &dsn. already exists. Please delete and try again.;
		%end;
		%mend;
		%loadDataIfNotAlreadyAvailable(sat15_raw,https;//tinyurl.com/stat660-sat15,xls)







***



# Recipes Exploration Results



```SAS


[place your SAS recipe explorations here, with one code fence per recipe, and delete this line]



```
