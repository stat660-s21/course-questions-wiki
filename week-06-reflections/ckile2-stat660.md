# Questions about Problems and Recipes



[Chapter 10 Quiz Question 1] 
* Question (ckile2-stat660): Why does combining work.one and work.two to produce work.three cut off “Karl” from the dataset work.one? work.three doesn’t include “Karl” but includes all the rest of the variables. 


[Chapter 10 Quiz Question 2]
* Question (ckile2-stat660): When combining cert.props1 with cert.props2 can you write code that will determine what shape of table and the order of the variables? 


[Chapter 10 Quiz Question 3]
* Question (ckile2-stat660): How would you write the code if you wanted to create the table with no spaces, in order to have the columns of variables parallel to each other? 


[Chapter 10 Quiz Question 4]
* Question (ckile2-stat660): Why does the value of Sale in observation 2 of the new data set end up missing when concatenating the datasets? Also if work.close has two inputs for observation 2 ($30,000 & $40,000) which value will the program choose if merging the datasets? 


[Chapter 10 Quiz Question 5]
* Question (ckile2-stat660): Is it possible to write the program so that when you merge the datasets, the values of Age in the first dataset don’t overwrite the values of Age in the second dataset? 


 [Chapter 10 Quiz Question 6]
* Question (ckile2-stat660): When merging the datasets, does the IN= data set option combined with the IF statement work similar to a Venn Diagram where the output table only includes values (in this case the variable ID) that are common to both the first and second data set? 


[Chapter 10 Quiz Question 7]
Question (ckile2-stat660): Could this program still run if instead of merge cert.spring(rename=(blue=navy)) cert.summer; we wrote merge cert.summer(rename=(blue=navy)) cert.spring? Does it matter which data set is renamed (spring or summer) or as long as one of the datasets is renamed, the program will run? 


[Chapter 10 Quiz Question 8]
* Question (ckile2-stat660): How could this program been written so that no errors are produced? Why aren’t these data sets sorted by values of the BY variable? Why isn’t merge cert.donors1 cert.donors2; by id accepted in the program? 


[Chapter 10 Quiz Question 9]
* Question (ckile2-stat660): When merging Cert.Staff1 and Cert.Staff2 why does the number of observation go off the first table Cert.Staff1 that contains 6 and not Cert.Staff2 that only contains 4? 


[Chapter 10 Quiz Question 10]
* Question (ckile2-stat660): Why is the value for Bonus retained from the previous observation (meaning $4000) and not just be the third observation in the Bonus table which is $3000? 


[combining-data-horizontally-with-data-step Week 6 SAS Recipe]
* Question (ckile2-stat660): When I run this program why does it say  ERROR: File WORK.GRADAF15_RAW.DATA does not exist. ERROR: File WORK.SAT15_RAW.DATA does not exist?


[combining-data-horizontally-with-proc-sql Week 6 SAS Recipe]
* Question (ckile2-stat660): When I run this program why does the following errors appear:  ERROR: File WORK.GRADAF15_RAW.DATA does not exist. ERROR: File WORK.SAT15_RAW.DATA does not exist?


[combining-data-vertically-with-data-step Week 6 SAS Recipe]
Question (ckile2-stat660): Why do I get these errors when I run this program, File WORK.FRPM1415_RAW.DATA does not exist. ERROR: The name “1415” is not a valid SAS name. ERROR: The name “1516” is not a valid SAS name? 


[combining-data-vertically-with-proc-sql Week 6 SAS Recipe]
* Question (ckile2-stat660): Why do I get these errors when running this program  ERROR: File WORK.FRPM1415_RAW.DATA does not exist. ERROR: File WORK.FRPM1516_RAW.DATA does not exist ? What is the difference between combining data with proc sql vs data step? 



***



# Recipes Exploration Results

```
* Recipe: combining-data-horizontally-with-data-step ;

original recipe;
data cde_2014_analytic_file_v1;
    retain
        CDS_code
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
* modified to only retain and keep CDS_code and School and removed UC_Coursework_Completers, SAT_Takers, Twelfth_Graders, Excess_SAT_Takers in order to see how the tables would combine; 

data cde_2014_analytic_file_v1;
    retain
        CDS_code
	   School
    ;
    keep
	   CDS_Code
	   School
    ;
    label
        CDS_Code=" "
	   School=" "
    ;
    merge
        gradaf15_raw(rename=(TOTAL=UC_Coursework_Completers))
        sat15_raw(
            rename=(
                cds=CDS_Code
                sname=School
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

* Recipe: combining-data-horizontally-with-proc-sql;

* original recipe;
proc sql;
    create table cde_2014_analytic_file_v2 as
        select 
            coalesce(B.CDS, A.CDS_Code) AS CDS_Code label ""
           ,coalesce(B.sname, A.School) AS School label ""
           ,A.TOTAL AS UC_Coursework_completers label ""
           ,B.NUMTSTTAKR AS SAT_Takers label ""
           ,B.enroll12 AS Twelfth_Graders label ""
           ,input(B.NUMTSTTAKR, best12.)
            -
            input(A.TOTAL, best12.)
            AS
            Excss_SAT_Takers label ""
        from
            gradaf15_raw AS A
            Full join
            sat15_raw AS B
            On A.CDS_Code = B.CDS
     ;
quit;
* modified to only coalesce CDS_Code and School from the tables in order to see the result;
proc sql;
    create table cde_2014_analytic_file_v2 as
        select 
            coalesce(B.CDS, A.CDS_Code) AS CDS_Code label ""
           ,coalesce(B.sname, A.School) AS School label ""
        from
            gradaf15_raw AS A
            Full join
            sat15_raw AS B
            On A.CDS_Code = B.CDS
     ;
quit;

 * Recipe: combining-data-vertically-with-data-step;

 * original recipe;
data frpm_analytic_file_v1;
    set
        frpm1415_raw(in=ay2014_data_row)
        frpm1516_raw(in=ay2015_data_row)
    ;
    if
        ay2014_data_row=1
    then
        do;
            data_source=“1415”;
        end;
    else
        do;
            data_source=“1516”;
        end;
run;
*modified to remove frpm1516_raw(in=ay2015_data_row) as well as   else do; data_source=“1516”; end; in order to simply program;  

data frpm_analytic_file_v1; 
    set
        frpm1415_raw(in=ay2014_data_row)
    ;
    if
        ay2014_data_row=1
    then
        do;
            data_source=“1415”;
        end;
run;

* Recipe: combining-data-vertically-with-proc-sql;

* original recipe;
proc sql;
    create table frpm_analytic_file_v2 as
        (
            select 
                *
               ,”1415” AS data_source
            from
                frpm1415_raw
        )
        union all corr
        (
            select 
                *
               ,”1516” AS data_source
            from
                frpm1516_raw
        )
    ;
quit;

*modified to remove union all corr to see the difference in tables created; 

proc sql;
    create table frpm_analytic_file_v2 as
        (
            select 
                *
               ,”1415” AS data_source
            from
                frpm1415_raw
        )
    ;
quit;

```


