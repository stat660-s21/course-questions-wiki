
# Questions about Problems and Recipes



[TB Ch 10 Quiz, Problem 1]
* Question (mwong70-stat660): Why doesnít observation 3 from Work.One show up in Work.Three since Work.Two obs=3 is missing?
* Answer (mwong70-stat660): Because the number of observations in the new data set is the number of observations in the smallest original data set. Of the two original data sets, the smallest was Work.Two with obs=2, so Work.Three is expected to have at most obs=2.



[TB Ch 10 Quiz, Problem 2]
* Question (mwong70-stat660): How do we take sum of values from groups that we concatenate?



[TB Ch 10 Quiz, Problem 3]
* Question (mwong70-stat660): Why do we sometimes omit the observation column? Wouldnít it be easier to have the obs column when referring to an observation?



[TB Ch 10 Quiz, Problem 4]
* Question (mwong70-stat660): If concatenating of two observations with the same UniqueID would result in missing, how should we treat two observations with the same UniqueID that contains different values? 



[TB Ch 10 Quiz, Problem 5]
* Question (mwong70-stat660): Because the number of observations in the new data set is 2, what can we do to keep the third column?



[TB Ch 10 Quiz, Problem 6]
* Question (mwong70-stat660): Provide any feedback.
* Answer (mwong70-stat660):  There is a typo in the explanation on the back of the book (Appendix 1, p. 386). The explanation should say, ìCorrect answer: a. The DATA step uses the IN= data set option, and the subsetting IF statement excludes unmatched observations from the output data set, so answers b and c, which contain unmatched observations, are incorrect.î



[TB Ch 10 Quiz, Problem 7]
* Question (mwong70-stat660): How to prevent merging if we wanted to keep a variable=Blue?
* Answer (mwong70-stat660): We could rename variable=Blue in DataOne with an alias so that it wonít be replaced when match-merge.



[TB Ch 10 Quiz, Problem 8]
* Question (mwong70-stat660): Because I often take the ìmergeî function in CRM applications i.e. on Excel, MailChimp, and SalesForce, what would the macro for merge look like? 



[TB Ch 10 Quiz, Problem 9]
* Question (mwong70-stat660): In the new data set, what are the values for the last two observations?
* Answer (mwong70-stat660): 888 Monique A12 Document 37 and 999 Vien D03 Survey -.



[TB Ch 10 Quiz, Problem 10]
* Question (mwong70-stat660): In the new data set after the merge, what is the UniqueID here?



[SP1 Ls 7, Problem 1]
* Question (mwong70-stat660): Contrast DATA Step and SQL procedure.
* Answer (mwong70-stat660): SQL procedure contains clauses and concludes the query with a QUIT Statement. DATA Step contains statements that concludes with a RUN statement.



[SP1 Ls 7, Problem 2]
* Question (mwong70-stat660): What are some advantages in using DATA Step compared to the SQL procedure?
* Answer (mwong70-stat660): DATA Step appears to be easier to follow for learning. DATA Step provides more control of reading, writing, and manipulating data; can create multiple tables in one step; and, includes looping and array processing.



[SP1 Ls 7, Problem 3]
* Question (mwong70-stat660): What are some advantages in using the SQL procedure?
* Answer (mwong70-stat660): SQL is an ANSI-standard language used by databases; codes can be streamlined; and, the SQL procedure can manipulate, summarize, and sort data in one step.



[SP2 Ls 5, Problem 1]
* Question (mwong70-stat660): What would happen if the datasets do not have the same matching columns?
* Answer (mwong70-stat660): Columns that are not in all tables are also included in the output table.



[SP2 Ls 5, Problem 2]
* Question (mwong70-stat660): Would it be offensive if I mispoke "join table" as opposed to "match-merge" to a SAS programmer? Joking, sort of.



[combining-data-horizontally-with-data-step Week 6 SAS Recipe, Problem 1]
* Question (mwong70-stat660): While I can appreciate the vertical listing of variables in DATA Step, is it a common practice in the industry reports?



[combining-data-horizontally-with-data-step Week 6 SAS Recipe, Problem 2]
* Question (mwong70-stat660): Because my team project uses composite key with several variables such as Exit, Entry, Year, and Month for each observational unit, would we first want to combine the composite key before merge-matching?



[combining-data-horizontally-with-proc-sql Week 6 SAS Recipe, Problem 1]
* Question (mwong70-stat660): Comment on any differences between the output data_analytic_v1 and data_analytic_v2.
* Answer (mwong70-stat660): v1 contains 3076 observations and 5 variables; v2 contains 3076 observations and 6 variables (SAT_Takers is included).



[combining-data-horizontally-with-proc-sql Week 6 SAS Recipe, Problem 2]
* Question (mwong70-stat660): What are full, left, right, and inner joins?



[combining-data-vertically-with-data-step Week 6 SAS Recipe, Problem 1]
* Question (mwong70-stat660): How does the recipe work?
* Answer (mwong70-stat660): It matches the columns with the same and concatenate the new data set at the last observation of the old data set.



[combining-data-vertically-with-data-step Week 6 SAS Recipe, Problem 2]
* Question (mwong70-stat660): Does the SQL procedure uses more RAMs than the DATA Step? 



[combining-data-vertically-wtih-proc-sql Week 6 SAS Recipe, Problem 1]
* Question (mwong70-stat660): Can we use a Cloud server to mitigate the memory limits?



***



# Recipes Exploration Results




```
*******************************************************************************;
* SAS Recipe: combining-data-horizontally-with-data-step                       ;
*******************************************************************************;
* Original Recipe;
data <output dataset name>;
    retain
        <names of columns to include in output in order>
    ;
    keep
        <names of columns to include in output in order>
    ;
    merge
        <input dataset name 1>
        ...
        <input dataset name n>
    ;
    by
        <unique id column(s) present in all input datasets>
    ;
    where
        <condition input rows must satisfy to be included in processing>
    ;
    if
        <condition created rows must satisfy to be included in output>
    ; 
run;



* Modified to "match-merge" datasets in DATA Step;
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
        input(SAT_Takers,best12.)
        -
        input(UC_Coursework_Completers,best12.)
    ;
run;



*******************************************************************************;
* SAS Recipe: combining-data-horizontally-with-proc-sql                        ;
*******************************************************************************;
* Original Recipe;
proc sql;
    create table <output dataset name> as
        select
            <names of columns, and/or expressions involving columns, to include
             in output in order, preceded each column name with the alias of
             its corresponding dataset using dot notation>
        from
            <input dataset name 1> AS <input dataset name 1 alias>
            <join operator; e.g., full join, left join, or inner join>
            <input dataset name 2> AS <input dataset name 2 alias>
            <join condition>
            <join operator; e.g., full join, left join, or inner join>
            <input dataset name 3> AS <input dataset name 3 alias>
            <join condition>
            ...
        where
            <condition input rows must satisfy to be included in processing>
        having
            <condition created rows must satisfy to be included in output>
    ;
quit;



* Modified recipe to match-merge in SQL procedure;
proc sql;
    create table cde_2014_analytic_file_v2 as
        select
             coalesce(B.CDS, A.CDS_Code) as CDS_Code label " "
            ,coalesce(B.sname, A.School) as School label " "
            ,A.TOTAL as UC_Coursework_Completers label " "
            ,B.enroll12 as Twelfth_Graders label " "
            ,input(B.NUMTSTTAKR,best12.)
             -
             input(A.TOTAL,best12.)
             as
             Excess_SAT_Takers label " "
        from
            gradaf15_raw as A
            full join
            sat15_raw as B
            on A.CDS_Code = B.CDS
    ;
quit;



*******************************************************************************;
* SAS Recipe: combining-data-vertically-with-data-step                         ;
*******************************************************************************;
* Original recipe;
data <output dataset name>;
    set
        <input dataset name 1>(in=<indicator variable name 1>)
        <input dataset name 2>(in=<indicator variable name 2>)
    ;
    <"business logic" using indicator variables> 
run; 



* Modified recipe to concatenate two data sets in DATA Step;
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



*******************************************************************************;
* SAS Recipe: combining-data-vertically-with-proc-sql                          ;
*******************************************************************************;
* Original recipe;
proc sql;
    create table <output dataset name> as
        (
            select
                <list of columns, either from input dataset or newly created>
            from
                <input dataset name 1> AS <input dataset name 1 alias>
        )
        union all corr
        (
            select
                <list of columns, either from input dataset or newly created>
            from
                <input dataset name 1> AS <input dataset name 1 alias>
        )
    ;
quit;



* Modified recipe to concatenate two data sets in SQL procedure;
proc sql;
    create table frpm_analytic_file_v2 as
        (
            select
                *
               ,"1415" as data_source
            from
                frpm1415_raw
        )
        union all corr
        (
            select
                *
               ,"1516" as data_source
            from
                frpm1516_raw
        )
    ;
quit;



```
