
# Questions about Assigned Quiz Problems and Recipes



[Chapter 4 Quiz, Problem 1]
* Question (anguyen82-stat660): What's the difference between filename and fileref?
* Answer (anguyen82-stat660): The filename statement assigns a fileref to an external file.


[Chapter 4 Quiz, Problem 2]
* Question (anguyen82-stat660): How do I change the default delimiter type in PROC IMPORT, say I want to go from space delimiting vs tabs?



[Chapter 4 Quiz, Problem 3]
* Question (anguyen82-stat660): What does the 'options' keyword do in proc import?


[Chapter 4 Quiz, Problem 4]
* Question (anguyen82-stat660): What options do I need to specifically pick a page I want from an excel file?


[Chapter 4 Quiz, Problem 5]
* Question (anguyen82-stat660): How can I override variable names in PROC import?


[Chapter 9 Quiz, Problem 1]
* Question (anguyen82-stat660): Are there are conditional statements SAS have options for else statements?



[Chapter 9 Quiz, Problem 2]
* Question (anguyen82-stat660): Can I have compound initial conditional statements and combine them in parantheses?


[Chapter 9 Quiz, Problem 3]
* Question (anguyen82-stat660): Is there a default option in case status is not 'OK', or the count is an invalid value? How would I add error handling?



[Chapter 9 Quiz, Problem 4]
* Question (anguyen82-stat660): Is LENGTH a kind of procedure or an option in an existing procedure?



[Chapter 9 Quiz, Problem 5]
* Question (anguyen82-stat660): code^ syntax looks unusual, I wonder what it does?



[Chapter 9 Quiz, Problem 8]
* Question (anguyen82-stat660): What does cert.fitness do?


[basic-load-remote-excel-file SAS Recipe]
* Question (anguyen82-stat660): What sorts of error messages come up in case the files are no longer accessible?



[advanced-load-remote-excel-file]
* Question (anguyen82-stat660): Is a default dataset being loaded in case I don't have a valid url?
***



# Recipes Exploration Results



```SAS


* basic-load-remote-excel-file 


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
        replace
    ;
    /*sheet="<Excel file worksheet name to load; can be left out in most cases>";*/
run;
filename tempfile clear;



* advanced-load-remote-excel-file


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
		%end;
	%else
	   %do;
	      %put Dataset &dsn. already exists. Please delete and try again.;
	   %end;
%mend;
%loadDataIfNotAlreadyAvailable(
   sat15_raw;
   https://tinyurl.com/stat660-sat15,
   xls
)
```
