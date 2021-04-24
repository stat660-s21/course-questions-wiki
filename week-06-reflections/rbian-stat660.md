
# Questions about Assigned Quiz Problems and Recipes


[TextBook Chapter10 Quiz, Problem 1]
* Question (rbian-stat660): What is the difference between one-to-one reading and concatenating?
* Answer (rbian-stat660): One-to-one reading combines observations based on their relative position in each data set and concatenating appends the observations from one data set to another.


[TextBook Chapter10 Quiz, Problem 2]
* Question (rbian-stat660): Will concatenating keep all the observation although some of them are replicates?
* Answer (rbian-stat660): Yes, concatenating just simply appends the observations from one data set to another.



[TextBook Chapter10 Quiz, Problem 3]
* Question (rbian-stat660): Will concatenating combine two tables if they have no common column?
* Answer (rbian-stat660): Yes, the value of variables that only exist in one table will be exported as missing values.



[TextBook Chapter10 Quiz, Problem 4]
* Question (rbian-stat660): If we merge these data sets, what is the value of Sale for the second observation?
* Answer (rbian-stat660): It will be $30000.



[TextBook Chapter10 Quiz, Problem 5]
* Question (rbian-stat660): What will happen if we merge two data sets having the same-named variables?
* Answer (rbian-stat660): Values of the same-named variable in the second data set will overwrite the values of those variables in the first table.



[TextBook Chapter10 Quiz, Problem 6]
* Question (rbian-stat660): What can we do if we want to select the matched observations?
* Answer (rbian-stat660): We can set the IN=1 option in the subsetting IF statement for both tables.



[TextBook Chapter10 Quiz, Problem 7]
* Question (rbian-stat660): What can we do if we merge two data sets having the same-named variables and we want to keep both?
* Answer (rbian-stat660): We need to rename variables by using the RENAME= option in the MERGE statement to prevent overwriting.



[TextBook Chapter10 Quiz, Problem 8]
* Question (rbian-stat660): What do we need to check before merging two data sets?
* Answer (rbian-stat660): If they are sorted by values of the BY variables.



[TextBook Chapter10 Quiz, Problem 9]
* Question (rbian-stat660): Why do we sometimes need NOOBS option in the DATA procedure?
* Answer (rbian-stat660): The output table always create a new column called Obs if we don’t have that option.



[TextBook Chapter10 Quiz, Problem 10]
* Question (rbian-stat660): Will the merged table contain all observations from all the input tables?
* Answer (rbian-stat660): Yes if we don’t specify the subsetting IF statement.



[combining-data-horizontally-with-data-step Week 6 SAS Recipe]
* Question (rbian-stat660): Does the retain statement and keep statement serve the same function here?
* Answer (rbian-stat660): No, the retain statement is to specify column order in the output data, but the keep statement is used to list the columns to be kept in the output dataset.



[combining-data-horizontally-with-proc-sql Week 6 SAS Recipe]
* Question (rbian-stat660): What dose the function coalesce do here?
* Answer (rbian-stat660): To return the first non-null value in a list.



[combining-data-vertically-with-data-step Week 6 SAS Recipe]
* Question (rbian-stat660): Do we need to specify ay2015_data_row=0 in the first if statement?
* Answer (rbian-stat660): No, because one row is ether from table1 or table2.



[combining-data-vertically-with-proc-sql Week 6 SAS Recipe]
* Question (rbian-stat660): How to add a new column in the new table?
* Answer (rbian-stat660): To specify the new column after the SELECT statement.


***



# Recipes Exploration Results



```SAS
* Recipe: combining-data-horizontally-with-data-step;

* original recipe;
Data cde_2014_analytic_file_v1;
    Retain
        CDS_Code
        School
        UC_Coursework_completers
        SAT_Takers
        Twelfth_Graders
        Excess_SAT_Takers
    ;
    Keep
        CDS_Code
        School
        UC_Coursework_completers
        SAT_Takers
        Twelfth_Graders
        Excess_SAT_Takers
    ;
    Label
        CDS_Code=“”
        School=“”
        UC_Coursework_completers=“”
        SAT_Takers=“”
        Twelfth_Graders=“”
        Excess_SAT_Takers=“”
    ;
    Merge
        gradaf15_raw(rename=(TOTAL=UC_Coursework_completers))
        sat15_raw(
            rename=(
                cds=CDS_Code
                sname=School
                NumTstTakr=SAT_Takers
                enroll12=Twelfth_graders
            )
        )
    ;
    By
        CDS_Code
    ;
    Excess_SAT_Takers=
        input(SAT_Takers, best12.)
        -
        input(UC_Coursework_completers, best12.)
    ;
Run;

* modified to exclude unmatched observations;
Data cde_2014_analytic_file_v1;
    Retain
        CDS_Code
        School
        UC_Coursework_completers
        SAT_Takers
        Twelfth_Graders
        Excess_SAT_Takers
    ;
    Keep
        CDS_Code
        School
        UC_Coursework_completers
        SAT_Takers
        Twelfth_Graders
        Excess_SAT_Takers
    ;
    Label
        CDS_Code=“”
        School=“”
        UC_Coursework_completers=“”
        SAT_Takers=“”
        Twelfth_Graders=“”
        Excess_SAT_Takers=“”
    ;
    Merge
        gradaf15_raw(
            rename=(TOTAL=UC_Coursework_completers)
            in=ingradaf15
        )
        sat15_raw(
            rename=(
                cds=CDS_Code
                sname=School
                NumTstTakr=SAT_Takers
                enroll12=Twelfth_graders
            )
            in=insat15
        )
    ;
    By
        CDS_Code
    ;
    Excess_SAT_Takers=
        input(SAT_Takers, best12.)
        -
        input(UC_Coursework_completers, best12.)
    ;
    If ingradaf15 and insat15;
Run;
```

```SAS
* Recipe: combining-data-horizontally-with-proc-sql;

* original recipe;
Proc SQL
    Create table cde_2014_analytic_file_v2 as
        Select 
            coalesce(B.CDS, A.CDS_Code) AS CDS_Code label “ ”
           ,coalesce(B.sname, A.School) AS School label “ ”
           ,A.TOTAL AS UC_Coursework_completers label “ ”
           ,B.NUMTSTTAKR AS SAT_Takers label “ ”
           ,B.enroll12 AS Twelfth_Graders label “ ”
           ,input(B.NUMTSTTAKR, best12.)
            -
            input(A.TOTAL, best12.)
            AS
            Excss_SAT_Takers label “ “
        From
            gradaf15_raw AS A
            Full join
            sat15_raw AS B
            On A.CDS_Code = B.CDS
     ;
Quit;

* modified to exclude unmatched observations;
Proc SQL
    Create table cde_2014_analytic_file_v2 as
        Select 
            coalesce(B.CDS, A.CDS_Code) AS CDS_Code label “ ”
           ,coalesce(B.sname, A.School) AS School label “ ”
           ,A.TOTAL AS UC_Coursework_completers label “ ”
           ,B.NUMTSTTAKR AS SAT_Takers label “ ”
           ,B.enroll12 AS Twelfth_Graders label “ ”
           ,input(B.NUMTSTTAKR, best12.)
            -
            input(A.TOTAL, best12.)
            AS
            Excss_SAT_Takers label “ “
        From
            gradaf15_raw AS A
            Inner join
            sat15_raw AS B
            On A.CDS_Code = B.CDS
     ;
Quit;
```

```SAS
* Recipe: combining-data-vertically-with-data-step;

* original recipe;
Data frpm_analytic_file_v1;
    Set
        frpm1415_raw(in=ay2014_data_row)
        frpm1516_raw(in=ay2015_data_row)
    ;
    If
        ay2014_data_row=1
    Then
        Do;
            data_source=“1415”;
        End;
    Else
        Do;
            data_source=“1516”;
        End;
Run;

* modified to output different tables based on the academic year from the frpm_analytic_file_v1 data set;
Data frpm_analytic_file_2014 frpm_analytic_file_2015;
    Set
        frpm_analytic_file_v1;
    If
        data_source=“1415”
    Then
        Do;
            Output frpm_analytic_file_2014;
        End;
    Else
        Do;
            Output frpm_analytic_file_2015;
        End;
Run;
```

```SAS
* Recipe: combining-data-vertically-with-proc-sql;

* original recipe;
Proc SQL
    Create table frpm_analytic_file_v2 as
        (
            Select 
                *
               ,”1415” AS data_source
            From
                frpm1415_raw
        )
        Union all core
        (
            Select 
                *
               ,”1516” AS data_source
            From
                frpm1516_raw
        )
    ;
Quit;

* modified to use the outer union corr statement to see the difference;
Proc SQL
    Create table frpm_analytic_file_v2 as
        (
            Select 
                *
               ,”1415” AS data_source
            From
                frpm1415_raw
        )
        Outer Union corr
        (
            Select 
                *
               ,”1516” AS data_source
            From
                frpm1516_raw
        )
    ;
Quit;
```
