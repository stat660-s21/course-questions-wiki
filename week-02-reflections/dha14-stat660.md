
# Questions about Assigned Quiz Problems and Recipes

[TB Chapter 4, Question 1]
* Question (dha14-stat6660): What is the difference between filename and fileref?
* Answer (dha14-stat6660):FILENAME is a function that provides a means to associate a logical name (fileref) with an external file or directory

[TB Chapter 4, Question 2] 
* Question (dha14-stat6660): What is a varying record-length file?
* Answer (dha14-stat6660): A file in which storing records that allow variable length for one or more fields and repeating fields.

[TB Chapter 4, Question 3]
* Question (dha14-stat6660): What is the difference in specifying obs in proc print and in options statement ?
* Answer (dha14-stat6660): Obs= in the options statement will tell SAS how many observations to READ IN. On the other hands, obs= in proc print tells SAS how many observation to output when the whole data has already been read in.

[TB Chapter 4, Question 4]
* Question (dha14-stat6660): Give an example of writing to an Excel file in DATA step
* Answer (dha14-stat6660): libname excelout xlsx 'C:\Users\Student1\Cert\newExcel.xlsx';data excelout.HighStress;  set cert.stress;run;

[TB Chapter 4, Question 5] 
* Question (dha14-stat6660): What is guessingrows?
* Answer (dha14-stat6660): By default, GuessingRows is 20, which means SAS uses the first 20 rows of the Excel spreadsheet to determine whether the data within a column is character or numeric, and what its length should be. 

[TB Chapter 9, Question 1] 
* Question (dha14-stat6660): How to use DELETE in DATA step? 
* Answer (dha14-stat6660): DELETE is usually used with IF-THEN statement to exclude some observations. Then syntax is as follow: IF expression THEN DELETE. 

[TB Chapter 9, Question 2] 
* Question (dha14-stat6660): In what order are logical statements evaluated?
* Answer (dha14-stat6660):Logical comparisons that are enclosed in parentheses are evaluated as true or false before they are compared to other expressions. 

[TB Chapter 9, Question 3] 
* Question (dha14-stat6660): what are the symbol notation of 'and' and 'or' in SAS?
* Answer (dha14-stat6660): | for or and & for and

[TB Chapter 9, Question 4] 
* Question (dha14-stat6660): How can the assignment statement determine the length of a new variable?
* Answer (dha14-stat6660):When creating a new character variable, SAS allocates as many bytes of storage space as there are characters in the reference to that variable.

[TB Chapter 9, Question 5] 
* Question (dha14-stat6660): What does the symbol ^ represent?
* Answer (dha14-stat6660): ^ together with equal sign (written as ^=) means not equal to.

[TB Chapter 9, Question 8] 
* Question (dha14-stat6660): How is 'drop' next to a dataset name different from 'drop' in the DATA step?
* Answer (dha14-stat6660): If drop is called right after a dataset named, the variables (being dropped) will not be read in at all, whereas drop in the DATA step will drop the variable after it has been read in SAS. 

[Recipe Basic Load] 
* Question (dha14-stat6660): What are other types of files can be imported into SAS?
* Answer (dha14-stat6660): There are several types of files PROC IMPORT supports, which are EXCEL, CSV, TAB, DLM, DBF, ACCESS.

[Recipe Advanced Load] 
* Question (dha14-stat6660): How is %IF different from the regular if?
* Answer (dha14-stat6660):IF statement cannot be used outside data step whereas %IF can be used outside and inside data step but within the macro.



***



# Recipes Exploration Results



```SAS


*Basic load remote excel file example;

filename tempfile TEMP; 
proc http 
	method="get 
	url="https://tinyurl.com/stat660-sat15"
	out=tempfile; 
run; 

proc import 
	file=tempfile
	out=sat15_raw
	dbms=xls; 
run; 

filename tempfile clear; 

* SAS Recipe: advanced-load-remote-excel-file ;
*Example;
%macro loadDataIfNotAlreadyAvailable(dsn,url,filetype); 
	%put &=dsn; 
	%put &=url; 
	%put &=filetype;
	%if
		%sysfunc(exist(&dsn.))=0
	%then
		%do;
			%put Loading dataset &dsn. over the wire now...;
			filename tempfile TEMP; 
			proc http 		
				method="get"
				url= "&url."
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
