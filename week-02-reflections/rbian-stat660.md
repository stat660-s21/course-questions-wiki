
# Questions about Assigned Quiz Problems and Recipes


[TextBook Chapter4 Quiz, Problem 1]
* Question (rbian-stat660): What are the necessary elements when to associate a fileref with external file?
* Answer (rbian-stat660): 1) A FILENAME statement to assign fileref; 2) A fully qualified name or location with quotation marks of the external file.


[TextBook Chapter4 Quiz, Problem 2]
* Question (rbian-stat660): Can PROC procedure read delimited files as fixed record-length files?
* Answer (rbian-stat660): Yes, although it is not by default, we can use the OPTIONS statement that includes the PECFM=F and LRECL= options .


[TextBook Chapter4 Quiz, Problem 3]
* Question (rbian-stat660): If our data set is huge, is there any ways verifying our code with a small sample to save time?
* Answer (rbian-stat660): Sure, the OPTIONS statement with OBS= option is useful to limit the number of observations that SAS read from external file.


[TextBook Chapter4 Quiz, Problem 4]
* Question (rbian-stat660): What do we need to know in order to read an Excel workbook file and write it out to a SAS data set?
* Answer (rbian-stat660): 1) libref, a name that we associate with an Excel workbook; 2) SAS LIBNAME engine name for an Excel file format; 3) Physical location of the Excel workbook.


[TextBook Chapter4 Quiz, Problem 5]
* Question (rbian-stat660): Can we not use the first row of an input file as the SAS variable names?
* Answer (rbian-stat660): Yes, by setting GETNAMES=NO, we can specify that the IMPORT procedure generates SAS variable names as VAR1, VAR2, and so on.


[TextBook Chapter9 Quiz, Problem 1]
* Question (rbian-stat660): How can we subset the observations that meet some conditions?
* Answer (rbian-stat660): One easy way is using IF-THEN DELETE.


[TextBook Chapter9 Quiz, Problem 2]
* Question (rbian-stat660): How to order a logical operator within a IF-THEN statement?
* Answer (rbian-stat660): Logical comparisons that are enclosed in parentheses should be evaluated fist.


[TextBook Chapter9 Quiz, Problem 3]
* Question (rbian-stat660): What do we need to pay attention to while evaluating an equal operator?
* Answer (rbian-stat660): Character values must be enclosed in quotation marks, and they should be exactly the same with what the character looks like in data set.


[TextBook Chapter9 Quiz, Problem 4]
* Question (rbian-stat660): How to avoid truncation of a new character variable value?
* Answer (rbian-stat660): Without additional assignment statement, SAS allocates as many bytes of storage spaces as there are characters in the first value. We can use LENGTH statement to specify a length.


[TextBook Chapter9 Quiz, Problem 5]
* Question (rbian-stat660): Is it a better way to always use IF-THEN/ELSE statement instead of a series of IF-THEN statements?
* Answer (rbian-stat660): Maybe, multiple IF-THEN statements waste system resources and slow the processing of program.


[TextBook Chapter9 Quiz, Problem 8]
* Question (rbian-stat660): How to tell the differences between the results of DROP=/KEEP= statement applied to the input data set and that applied to the output data set?
* Answer (rbian-stat660): If we apply DROP= statement to the input data set, DROP= will prevent the SET statement from reading some certain variables from the input data set, so that we cannot use these variables in any logic in the DATA step; Applying DROP= statement to the output data set means only to read and process variables but not to keep them in output data set.


[basic-load-remote-excel-file Week 2 SAS Recipe]
* Question (rbian-stat660): If we can load data sets from a web server like Github and save a copy of it, does it mean that we make a copy of data and save it in our device or we just create an access to the data sets and data is not downloaded to our device?
* Answer (rbian-stat660): I think it is just a easier way to have access to data and avoid downloading data. So every time when we wanna use the data set, we have to re-build a temporary file to save it but can not import data directly. (This is from my understanding, but I am not quite. While trying this recipe, I just came up with a question that like ‘Oh, where is this data set stored, have I downloaded it?"


[advanced-load-remote-excel-file Week 2 SAS Recipe]
* Question (rbian-stat660): After I have successfully run the code for the first time and when I reran it I found here says: Dataset sat15_raw already exists. Please delete and try again. Does it mean I have created a copy of the data from the web server and when I wanna use the data later I can actually reference the data directly?
* Answer (rbian-stat660): Yes, it seems like so. This note “Dataset sat15_raw already exists. Please delete and try again” stands opposite to what I believed while trying the recipe 1. But I am not where the data-sat15_raw is put?  


***


# Recipes Exploration Results


```SAS

* Recipe: basic-load-remote-excel-file;

* original recipe;

filename temple TEMP;
proc http
   method=“get”
   url=“https://tinyrul.com/stat660-sat15”
   out=tempfile;
run;
proc import
   file=tempfile
   out=sat15_raw
   dbms=xls;
run;
filename tempfile clear;

* add PROC CONTENTS statement to import the summary of the data;

filename temple TEMP;
proc http
   method=“get”
   url=“https://tinyrul.com/stat660-sat15”
   out=tempfile;
run;
proc import
   file=tempfile
   out=sat15_raw
   dbms=xls;
run;
proc contents
   data=sat15_raw;
run;
filename tempfile clear;

```

```SAS

* Recipe: advanced-load-remote-excel-file;

* original recipe;

%macro loadDataIfNotAlreadyAvailable(den, url, filetype);
   %put &=dsn;
   %put &=url;
   %put &=filetype;
   %if
        %sysfunc(exist(&dsn.))=0
   %then
        %do;
            %put Loading dataset &dsn. over the wire now…;
            filename temple TEMP;
            proc http
                 method=“get”
                 url=“&url.”
                 out=tempfile;
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
     https://tinyrul.com/stat660-sat15,
     xls
)

* modified to use let statement to replace put statement;

%macro loadDataIfNotAlreadyAvailable(den, url, filetype);
   %let dsn=sat15_raw;
   %let url=https://tinyrul.com/stat660-sat15;
   %let filetype=xls;
   %if
        %sysfunc(exist(&dsn.))=0
   %then
        %do;
            %put Loading dataset &dsn. over the wire now…;
            filename temple TEMP;
            proc http
                 method=“get”
                 url=“&url.”
                 out=tempfile;
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
     https://tinyrul.com/stat660-sat15,
     xls
)

```

