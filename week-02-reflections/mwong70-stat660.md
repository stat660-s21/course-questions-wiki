
# Questions about Problems and Recipes



[TB Ch 4 Quiz, Problem 1]
* Question (mwong70-stat660): 
* Answer (mwong70-stat660): 



[TB Ch 4 Quiz, Problem 2]
* Question (mwong70-stat660): 
* Answer (mwong70-stat660): 



[TB Ch 4 Quiz, Problem 3]
* Question (mwong70-stat660): 
* Answer (mwong70-stat660): 



[TB Ch 4 Quiz, Problem 4]
* Question (mwong70-stat660): 
* Answer (mwong70-stat660): 



[TB Ch 4 Quiz, Problem 5]
* Question (mwong70-stat660): 
* Answer (mwong70-stat660): 



[TB Ch 9 Quiz, Problem 1]
* Question (mwong70-stat660): 
* Answer (mwong70-stat660): 



[TB Ch 9 Quiz, Problem 2]
* Question (mwong70-stat660): 
* Answer (mwong70-stat660): 



[TB Ch 9 Quiz, Problem 3]
* Question (mwong70-stat660): 
* Answer (mwong70-stat660): 



[TB Ch 9 Quiz, Problem 4]
* Question (mwong70-stat660): 
* Answer (mwong70-stat660): 



[TB Ch 9 Quiz, Problem 5]
* Question (mwong70-stat660): 
* Answer (mwong70-stat660): 



[TB Ch 9 Quiz, Problem 8]
* Question (mwong70-stat660): 
* Answer (mwong70-stat660): 



[Reading TB Ch 4, Problem 1]
* Question (mwong70-stat660): 
* Answer (mwong70-stat660): 



[Reading TB Ch 4, Problem 2]
* Question (mwong70-stat660): 
* Answer (mwong70-stat660): 



[Reading TB Ch 9, Problem 1]
* Question (mwong70-stat660): 
* Answer (mwong70-stat660): 



[Reading TB Ch 9, Problem 2]
* Question (mwong70-stat660): 
* Answer (mwong70-stat660): 



[Reading SP1 Ls 2, Problem 1]
* Question (mwong70-stat660): What are some advantages in creating a library?
* Answer (mwong70-stat660): When hardcoded data is moved, the data source path would need to change. Library enables editing program in multiple places. Library also allows us to read more diverse types of data file (i.e. Excel, Teradata).



[Reading SP1 Ls 2, Problem 2]
* Question (mwong70-stat660): In practice, how common is it to use CLEAR option in LIBNAME at the end of a SAS program?



[Reading SP1 Ls 4, Problem 1]
* Question (mwong70-stat660): 
* Answer (mwong70-stat660): 



[Reading SP1 Ls 4, Problem 2]
* Question (mwong70-stat660): 
* Answer (mwong70-stat660): 



[basic-load-remote-excel-file Week 2 SAS Recipe, Problem 1]
* Question (mwong70-stat660): What modifications needed to pull file types other than Excel (i.e. JSON, API, dbms from SQL Server, or the GIS type for geospatial information)?



[basic-load-remote-excel-file Week 2 SAS Recipe, Problem 2]
* Question (mwong70-stat660): How can we check if the code work?
* Answer (mwong70-stat660): We could add proc content or proc means on the data to print the data summary. Or, check the logs.



[advanced-load-remote-excel-file Week 2 SAS Recipe, Problem 1]
* Question (mwong70-stat660): Would it be helpful to add proc content in the macro to confirm that the import process were error free?



[advanced-load-remote-excel-file Week 2 SAS Recipe, Problem 2]
* Question (mwong70-stat660): Is putting <error message> in macro steps a common practice in analysis work? i.e. "Loading dataset <dataset>..." or "<Dataset> already exists. Please delete and try again."



***



# Recipes Exploration Results




```
* SAS Recipe: basic-load-remote-excel-file ;
/*
Summary: Pull data file (i.e. csv, xls) from a web server (i.e. known url).
*/
* Example;
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




* SAS Recipe: advanced-load-remote-excel-file ;
/*
Summary: Pull data file (i.e. csv, xls) from a web server (i.e. known url).
*/

*/
* Example;
%macro loadDataIfNotAlreadyAvailable(dsn,url,filetype);
    %put &=dsn;
    %put &=url;
    %put &=lifestyle;
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

