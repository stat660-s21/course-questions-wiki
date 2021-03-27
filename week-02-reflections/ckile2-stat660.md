# Questions about Problems and Recipes



[Chapter 4 Quiz, Problem 1]
* Question (ckile2-stat660):When you assign a libref                           by using a LIBNAME statement does it have to be in quotation marks too?



[Chapter 4 Quiz, Problem 2]
* Question (ckile2-stat660): How do you read in logical record-length files? What procedure to use? Also what is the difference between logical record-length files and varying record-length files?



[Chapter 4 Quiz, Problem 3]
* Question (ckile2-stat660): What does it mean by delimited by a period (.)? And when do you have to indicate DELIMITER=‘.’? 



[Chapter 4 Quiz, Problem 4]
* Question (ckile2-stat660): What is the code needed to read an Excel workbook files and write it out to a SAS data set? 


[Chapter 4 Quiz, Problem 5]
* Question (ckile2-stat660): When would you need to use GETNAMES=no? Why would you want to produce variable names like VAR1 and Var2? 



[Chapter 9 Quiz, Problem 1]
* Question (ckile2-stat660): Why do you need to use ‘drop price’ in this program? Also under “proc print data=test2 noobs;”, what is noobs? 



[Chapter 9 Quiz, Problem 2]
* Question (ckile2-stat660): If there was no parentheses around project = ‘A’ and present= ‘A’ would it evaluate research =‘A’ or first ? 



[Chapter 9 Quiz, Problem 3]
* Question (ckile2-stat660): Why did Control = Stop and not Control = Go ? Is it because Status isn’t equal to ’S’?


[Chapter 9 Quiz, Problem 4]
* Question (ckile2-stat660): How do you use the assignment statement? Is it assignment = ? 

[Chapter 9 Quiz, Problem 5]
Question (ckile2-stat660): When you write “ if code^=’1’” does “^” mean the compliment of code=‘1’? 

[Chapter 9 Quiz, Problem 8]: Why were Age and Group dropped? The program didn’t use the DROP= Age and Group in the data statement? 


[basic-load-remote-excel-file Week 2 SAS Recipe]
* Question (ckile2-stat660): Is there another way to read in an excel file from the web? Is proc http usually followed by proc import? 



[advanced-load-remote-excel-file Week 2 SAS Recipe]
* Question (ckile2-stat660): Why is it that the dataset no longer seems to be loading with this advanced recipe. Instead it just says Dataset sat15_raw already exists. Please delete and try again in the log box. Why is there no results? 


***



# Recipes Exploration Results




```
* Recipe: basic-load-remote-excel-file;

* filename tempfile TEMP;
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


* modified to read in a different url, I wanted to see if it would work and it seemed to;

filename tempfile TEMP;
proc http
	method="get"
	url="http://dq.cde.ca.gov/dataquest/dlfile/dlfile.aspx?cLevel=School&cYear=2018-19&cCat=EL&cPage=fileselsch"
	out=tempfile
	;
run;

proc import	
	file=tempfile
	out=sat15_raw
	dbms=xls;
run;
filename tempfile clear;




* Recipe: advanced-load-remote-excel-file;

* original recipe;
%macro loadDataIfNotAlreadyAvailable(dsn,url,filetype);
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
				out=tempfile
				;
			run;
			proc import
				file=tempfile
				out=&dsn.
				dbms=&filetype.;
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
	https://tinyurl.com/stat-sat15,
	xls
)


*under proc import I switched around out=&url. and dbms=&url.;  as well as some other changes to see if my output would change; it didn’t change. I also changed it to filename filetype clear; instead of filename tempfile clear; I also changed it to %put Dataset &dsn. already exists. instead of %put Dataset &dsn. already exists. Please delete and try again.; and it changed the output. 



%macro loadDataIfNotAlreadyAvailable(dsn,url,filetype);
	%put &=dsn;
	%put &=url;
	%put &=filetype;
	%if	
		%sysfunc(exist(&dsn.)) = 0
	%then
		%do;
			%put Loading dataset &url. over the wire now...;
			filename tempfile TEMP;
			proc http	
				method="get"
				url="&url."
				out=tempfile
				;
			run;
			proc import
				file=tempfile 
				out=&url.
				dbms=&url.;
			run;
			filename filetype clear;
		%end;
	%else
		%do;
			%put Dataset &dsn. already exists.;
		%end;
%mend;
%loadDataIfNotAlreadyAvailable(
	sat15_raw,
	https://tinyurl.com/stat-sat15,
	xls
)
```

