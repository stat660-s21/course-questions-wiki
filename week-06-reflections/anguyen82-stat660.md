
# Questions about Assigned Quiz Problems and Recipes


[Chapter 10 Quiz, Problem 1]
*Question (anguyen82-stat660): What kind of data combining method is being used in this question?
*Answer (anguyen82-stat660): This problem shows a case of one-to-one matching. The number of data lines is equal
to the table with the smallest number of data lines.



[Chapter 10 Quiz, Problem 2]
*Question (anguyen82-stat660): Same question as problem 1? What kind of data combining method am I seeing here?
*Answer (anguyen82-stat660): This is a case of concatenation.



[Chapter 10 Quiz, Problem 3]
*Question (anguyen82-stat660): Since I see "set" in the program, will I see one-to-one matching?
*Answer (anguyen82-stat660): No, one-to-one matching requires more than one "set" statement, what we will see is
concatenation.



[Chapter 10 Quiz, Problem 4]
*Question (anguyen82-stat660): Will the answer be b) since the three tables being concantenated have ID 2 in
common?
*Answer (anguyen82-stat660): The answer is actually a, and the value of sales is missing for observation 2. The
answer would be b) $30,000 if match-merging were used.



[Chapter 10 Quiz, Problem 5]
*Question (anguyen82-stat660): I notice the tables have different entries for age for the same SSN. How are mismatches
handled in SAS?
*Answer (anguyen82-stat660): The value of age in the first table is overwritten by the value of age from susequent tables.



[Chapter 10 Quiz, Problem 6]
*Question (anguyen82-stat660): What happens when two tables being merged with different columns counts?
*Answer (anguyen82-stat660): There's a conditional statement IF which excludes unmatched values. Without it then lines
of data will have missing data.



[Chapter 10 Quiz, Problem 7]
*Question (anguyen82-stat660): Is the question asking if a variable has Blue and the lines of data do not match, to
print a new dataline with missing entries instead?
*Answer (anguyen82-stat660): No, overwriting is prevented by renaming the DATA in the MERGE statement. Going from blue
to navy.



[Chapter 10 Quiz, Problem 8]
*Question (anguyen82-stat660): Will the resulting code overwrite values for some of the duplicate IDs?
*Answer (anguyen82-stat660): The code actually doesn't run at all since the two tables are not sorted by ID. Need
proc SORT first.



[Chapter 10 Quiz, Problem 9]
*Question (anguyen82-stat660): If none of the columns are sorted in either ascending or descending order, will there
be no processing of combining the tables?



[Chapter 10 Quiz, Problem 10]
*Question (anguyen82-stat660): How can I tell when a value will be over written? Column names?



[combining-data-horizontally-with-data-step SAS Recipe]
*Question (anguyen82-stat660): Why do I need to have, under the label keyword, have to have CDS_Code=" " for, instance?
*Answer (anguyen82-stat660): It looks like it is necessary to corrected column names.



[combining-data-horizontally-with-proc-sql SAS Recipe]
*Question (anguyen82-stat660): What do the blocks 'select' and 'from' do in the code?



[combining-data-vertically-with-data-step SAS Recipe]
*Question (anguyen82-stat660): What are the purpose of the 'do' and 'end' keywords and the logic behind them? I am
familiar with 'do' loops, so this usage of 'do' is new to me.



[combining-data-vertically-with-proc-sql SAS Recipe]
*Question (anguyen82-stat660): What is the purpose of the '*' after select?
*Answer (anguyen82-stat660): The asterix '*' is used as shorthand to include all the columns.



***



# Recipes Exploration Results



```SAS


*Recipe: combining-data-horizontally-with-data-step ;

*Original Recipe;

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

*Recipe combining-data-horizontally-with-proc-sql ;

*Original Recipe;

proc sql;
    create table cde_2014_analytic_file_v2 as
	    select
		    coalesce(B.CDS, A.CDS_Code) AS CDS_Code label " "
			,coalesce(B.sname,A.School) AS School label " "
			,A.TOTAL AS UC_Coursework_Completers label " "
			,B.NUMTSTTAKR AS SAT_Takers label " "
			,B.enroll12 AS Twelfth_Graders label " "
			,input(B.NUMTSTTAKR,best12.)
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


* Recipe combining-data-vertically-with-data-step

*Original Recipe;

data frpm_analytic_file_v1;
    set
	    frpm1415_raw(in=ay2014_data_row)
		frpm1516_raw(in=ay2014_data_row)
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


* Recipe combining_data_vertically-with-proc-sql

*Original Recipe;

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
			    frpm1516_raw
		)
	;
quit;


```
