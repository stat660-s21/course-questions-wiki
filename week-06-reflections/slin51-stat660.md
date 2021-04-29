
# Questions about Assigned Quiz Problems and Recipes


[Textbook Chapter 10, Problem 1]
* Question (slin51-stat660): What is the difference between using set once versus using set twice?
* Answer (slin51-stat660): You use multiple SET in one-to-one matching where same-named variables occur. The new data set will be the smallest original data set. You use one SET for concatenation.


[Textbook Chapter 10, Problem 2]
* Question (slin51-stat660): Why is the keyword SET used instead of something more intuitive like ADD ROW?


[Textbook Chapter 10, Problem 3]
* Question (slin51-stat660): What is the purpose of proc print?


[Textbook Chapter 10, Problem 4]
* Question (slin51-stat660): Can any data set be concatenated?


[Textbook Chapter 10, Problem 5]
* Question (slin51-stat660): Why does SAS not have a built in mechanism to rename duplicate column names when merging?


[Textbook Chapter 10, Problem 6]
* Question (slin51-stat660): Is there a keyword to match only matched observations similar to an inner join in R?


[Textbook Chapter 10, Problem 7]
* Question (slin51-stat660): Is renaming variables case sensitive?


[Textbook Chapter 10, Problem 8]
* Question (slin51-stat660): Is merge unable to work if there are multiple same IDs in one data set?


[Textbook Chapter 10, Problem 9]
* Question (slin51-stat660): Is BY always ordered in descending order?


[Textbook Chapter 10, Problem 10]
* Question (slin51-stat660): Can SAS detect the BY variable without it being specified?


***



# Recipes Exploration Results



```
* Recipe: sas_recipe-combining-data-horizontally-with-data-step;

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

```

* Question (slin51-stat660): What does the dash in between the two inputs do?


```

* Recipe: sas_recipe-combining-data-vertically-with-data-step;

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

```

* Question (slin51-stat660): What is the data_source specifying? Where is "1415" and "1516" defined?

