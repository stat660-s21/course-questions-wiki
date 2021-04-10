
# Questions about Assigned Quiz Problems and Recipes


[Textbook Chapter 4, Problem 1]
* Question (slin51-stat660): Is there a way to locate the file location without manually specifying it?


[Textbook Chapter 4, Problem 2]
* Question (slin51-stat660): What does varying record length mean? What is the maximum record length allowed?


[Textbook Chapter 4, Problem 3]
* Question (slin51-stat660):  Why are semicolons not needed after the out=exam and dbms=dlm lines?


[Textbook Chapter 4, Problem 4]
* Question (slin51-stat660): How do you specify which Excel Worksheet tab to read in?


[Textbook Chapter 4, Problem 5]
* Question (slin51-stat660): If your column names are in the second row, how do you get SAS to recognize the second row as the variable names?



[Textbook Chapter 9, Problem 1]
* Question (slin51-stat660): What does a do action after the IF-THEN statement do?


[Textbook Chapter 9, Problem 2]
* Question (slin51-stat660): Regardless of the logical operator, are comparisons in parentheses always evaluated first?

[Textbook Chapter 9, Problem 3]
* Question (slin51-stat660): Will adding spaces on either side of the equal sign in the comparison change the evaluation of the statement?


[Textbook Chapter 9, Problem 4]
* Question (slin51-stat660): What is an assignment statement?


[Textbook Chapter 9, Problem 5]
* Question (slin51-stat660): Why is the value for code surrounded in quotes? Is it because code='1' and code='2' values are not numeric?


[Textbook Chapter 9, Problem 8]
* Question (slin51-stat660): Why does SAS default to setting the value length to the first reference in the DATA step?


***



# Recipes Exploration Results



```
* Recipe: basic-load-remote-excel-file ;

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

```

* Question (slin51-stat660): Why is the semicolon on a separate line on its own?


```

* Recipe: advanced-load-remote-excel-file ;

%macro loadDataIfNotAlreadyAvailable(dsn,url,fileType);
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
	https://tinyurl.com/stat660-sat15,
	xls
)

```
* Question (slin51-stat660): What does %mend do?

