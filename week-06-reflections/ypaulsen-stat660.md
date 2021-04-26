
# Questions about Assigned Quiz Problems and Recipes



[Chapter 10 Quiz, Problem 1]
* Question (ypaulsen-stat660): What happened to Karl? 
* Answer (ypaulsen-stat660): That code produced a one-to-one join and the final row of the first dataset had no couterpart row in the second dataset. Thus Karl was left out of the final set. 


[Chapter 10 Quiz, Problem 2]
* Question (ypaulsen-stat660): Can a set statement include more than one dataset? 
* Answer (ypaulsen-stat660): It can and the result is called concatenation.   


[Chapter 10 Quiz, Problem 3]
* Question (ypaulsen-stat660): Does that code just combine them horizontially? 
* Answer (ypaulsen-stat660): It does. This is called concatenation. 


[Chapter 10 Quiz, Problem 4]
* Question (ypaulsen-stat660): Does concatenate sum the values with repeated keys? 
* Answer (ypaulsen-stat660): No it doesn't. It would include all values and repeat the ID. 


[Chapter 10 Quiz, Problem 5]
* Question (ypaulsen-stat660): Does that produce two Age columns? 
* Answer (ypaulsen-stat660): No. It will keep the second value for age. 


[Chapter 10 Quiz, Problem 6]
* Question (ypaulsen-stat660): Does that 'if' statement work how I expect it to? 
* Answer (ypaulsen-stat660): It does. 


[Chapter 10 Quiz, Problem 7]
* Question (ypaulsen-stat660): Is one column being renamed here? 
* Answer (ypaulsen-stat660): Yes. Option D renames the column in the specified dataset. 


[Chapter 10 Quiz, Problem 8]
* Question (ypaulsen-stat660): Is merging that simple? 
* Answer (ypaulsen-stat660): As it turns out a lot of things are quite simple in SAS.


[Chapter 10 Quiz, Problem 9]
* Question (ypaulsen-stat660): Will that keep all of the observations?
* Answer (ypaulsen-stat660): No. It will merge by ID where possible and will include the remaining observations as well. It will output 6 rows.  


[Chapter 10 Quiz, Problem 10]
* Question (ypaulsen-stat660): How does merge differ from concatenate here? 
* Answer (ypaulsen-stat660): Concatenate joins vertically; Merge creates one file from two by joining horizontally based on a common ID value. 



[combining-data-horizontally-with-data-step Week 6 SAS Recipe]
* Question (ypaulsen-stat660): What's the difference between 'retain' and 'keep'? 
* Answer (ypaulsen-stat660):  


[combining-data-horizontally-with-proc-sql Week 6 SAS Recipe]
* Question (ypaulsen-stat660): What does Coalesce do here?  
* Answer (ypaulsen-stat660):


[combining-data-vertically-with-data-step Week 6 SAS Recipe]
* Question (ypaulsen-stat660): What is this: "in=ay2014_data_row"? 
* Answer (ypaulsen-stat660):


[combining-data-vertically-with-proc-sql Week 6 SAS Recipe]
* Question (ypaulsen-stat660): What dos the * do here? 
* Answer (ypaulsen-stat660):



***



# Recipes Exploration Results



# Recipes Exploration Results


[combining-data-horizontally-with-data-step Week 6 SAS Recipe]

```SAS
* Original code;   
data cde_2014_analytic_file_v1; 
    retain
        CDS_Code
        School
        UC_Coursework_Completers
        SAT_Takers
        Twelfth_Graders
        Excess_SAT_Takers
    ;
    keep
        CDS_Code
        School
        UC_Coursework_Completers
        SAT_Takers
        Twelfth_Graders
        Excess_SAT_Takers 
    ;
    label
        CDS_Code=" "
        School=" " 
        UC_Coursework_Completers=" "
        SAT_Takers=" "
        Twelfth_Graders=" "
        Excess_SAT_Takers=" "
    ;
    merge 
        gradaf15_raw(rename=(TOTAL=UC_Coursework_Completers))
        sat15_raw(
            rename=(
                cds=CDS_Code
                sname=School
                NumTstTakr=SAT_Takers
                enroll12=Twelfth_Graders
            )
        )
    ;
    by
        CDS_Code
    ; 
    Excess_SAT_Takers = 
        input(SAT_Takers, best12.)
        -
        input(UC_Coursework_Completers, best12.)
    ;
run; 



* Remove the 'rename' option from one of the datasets; 
data cde_2014_analytic_file_v2; 
    retain
        CDS_Code
        School
        UC_Coursework_Completers
        SAT_Takers
        Twelfth_Graders
        Excess_SAT_Takers
    ;
    keep
        CDS_Code
        School
        UC_Coursework_Completers
        SAT_Takers
        Twelfth_Graders
        Excess_SAT_Takers 
    ;
    label
        CDS_Code=" "
        School=" " 
        UC_Coursework_Completers=" "
        SAT_Takers=" "
        Twelfth_Graders=" "
        Excess_SAT_Takers=" "
    ;
    merge 
        gradaf15_raw
        sat15_raw(
            rename=(
                cds=CDS_Code
                sname=School
                NumTstTakr=SAT_Takers
                enroll12=Twelfth_Graders
            )
        )
    ;
    by
        CDS_Code
    ; 
    Excess_SAT_Takers = 
        input(SAT_Takers, best12.)
        -
        input(UC_Coursework_Completers, best12.)
    ;
run; 

* That resulted in an empty column called 'UC_Coursework_Completers';
* Below is the same as above but includes a change in the other arguments; 
data cde_2014_analytic_file_v3; 
    retain
        CDS_Code
        School
        TOTAL
        SAT_Takers
        Twelfth_Graders
        Excess_SAT_Takers
    ;
    keep
        CDS_Code
        School
        TOTAL
        SAT_Takers
        Twelfth_Graders
        Excess_SAT_Takers 
    ;
    label
        CDS_Code=" "
        School=" " 
        TOTAL=" "
        SAT_Takers=" "
        Twelfth_Graders=" "
        Excess_SAT_Takers=" "
    ;
    merge 
        gradaf15_raw
        sat15_raw(
            rename=(
                cds=CDS_Code
                sname=School
                NumTstTakr=SAT_Takers
                enroll12=Twelfth_Graders
            )
        )
    ;
    by
        CDS_Code
    ; 
    Excess_SAT_Takers = 
        input(SAT_Takers, best12.)
        -
        input(TOTAL, best12.)
    ;
run; 
```

[combining-data-horizontally-with-proc-sql Week 6 SAS Recipe]

```SAS
* Original code; 
proc sql; 
    create table cde_2014_analytic_file_v4 as 
        select 
            coalesce(B.CDS, A.CDS_Code) AS CDS_Code label " " 
           ,coalesce(B.sname,A.School) AS School label " "
           ,A.TOTAL AS UC_Coursework_Completers label " " 
           ,B.NUMTSTTAKR AS SAT_Takers label " " 
           ,B.enroll12 AS Twelfth_Graders label " " 
           ,input(B.NUMTSTTAKR, best12.)
           -
           input(A.TOTAL,best12.)
           AS
           Excess_SAT_Takers label " " 
        from
            gradaf15_raw as A
            full join 
            sat15_raw as B 
            on A.CDS_Code = B.CDS 
    ;
quit; 



* Attempt to Remove "UC_Coursework_Completers" Label by removing the whole line; 
proc sql; 
    create table cde_2014_analytic_file_v5 as 
        select 
            coalesce(B.CDS, A.CDS_Code) AS CDS_Code label " " 
           ,coalesce(B.sname,A.School) AS School label " "
           ,B.NUMTSTTAKR AS SAT_Takers label " " 
           ,B.enroll12 AS Twelfth_Graders label " " 
           ,input(B.NUMTSTTAKR, best12.)
           -
           input(A.TOTAL,best12.)
           AS
           Excess_SAT_Takers label " " 
        from
            gradaf15_raw as A
            full join 
            sat15_raw as B 
            on A.CDS_Code = B.CDS 
    ;
quit;

* The above resulted in removing the entire column from the output; 
*I will try again to includ it without renaming;
proc sql; 
    create table cde_2014_analytic_file_v6 as 
        select 
            coalesce(B.CDS, A.CDS_Code) AS CDS_Code label " " 
           ,coalesce(B.sname,A.School) AS School label " "
           ,A.TOTAL label " " 
           ,B.NUMTSTTAKR AS SAT_Takers label " " 
           ,B.enroll12 AS Twelfth_Graders label " " 
           ,input(B.NUMTSTTAKR, best12.)
           -
           input(A.TOTAL,best12.)
           AS
           Excess_SAT_Takers label " " 
        from
            gradaf15_raw as A
            full join 
            sat15_raw as B 
            on A.CDS_Code = B.CDS 
    ;
quit; 
```

[combining-data-vertically-with-data-step Week 6 SAS Recipe]

```
* Original code; 
data frpm_analytic_file_v1; 
    set
        frpm1415_raw(in=ay2014_data_row)
        frpm1516_raw(in=ay2015_data_row)
    ;
    if
        ay2014_data_row=1
    then
        do;
            data_source="1415";
        end;
    else
        do;
            data_source="1516";
        end;
run; 


* Changing inputs; 
data frpm_analytic_file_v1; 
    set
        frpm1415_raw(in=ay2014_data_row)
        frpm1516_raw(in=ay2015_data_row)
    ;
    if
        ay2014_data_row=1
    then
        do;
            data_source="201415";
        end;
    else
        do;
            data_source="201516";
        end;
run; 
```

[combining-data-vertically-with-proc-sql Week 6 SAS Recipe]

```SAS
* Original code; 
proc sql;
    create table frpm_analytic_file_v2 as
        (
            select
                *
                ,"1415" AS data_source
            from
                frpm1415_raw
        )
        union all corr
        (
            select
                *
               ,"1516" AS data_source
            from
                frpm1415_raw
        )
    ;
quit;

* Renaming some variables; 
proc sql;
    create table frpm_analytic_file_v2 as
        (
            select
                *
                ,"201415" AS data_source
            from
                frpm1415_raw
        )
        union all corr
        (
            select
                *
               ,"201516" AS data_source
            from
                frpm1415_raw
        )
    ;
quit;
```
