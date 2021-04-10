# Questions about Problems and Recipes



[Chapter 5 Quiz, Problem 2]
* Question (ckile2-stat660): If this program was run successfully what would it do to the data? What does PROC SORT do? 


[Chapter 5 Quiz, Problem 6]
* Question (ckile2-stat660): For common and easy interpretable errors will SAS correct them automatically? 


[Chapter 6 Quiz, Problem 1]
* Question (ckile2-stat660): Under PROC PRINT, why do you have to specify “label boarded = ‘On’ transferred= ‘Changed’”? Also want does ‘var' do? 


[Chapter 6 Quiz, Problem 3]
* Question (ckile2-stat660): If you wanted the value of the variable Style to be RANCH, SPLIT, or TWOSTORY why is the correct answer where style in (‘RANCH’,'SPLIT','TWOSTORY'); and it doesn’t contain “or”? 


[Chapter 6 Quiz, Problem 4]
* Question (ckile2-stat660): When you want to sort your data and create a temporary data set named Calc to store the sorted data, could you put out=calc or does it have to be out=work.calc and why? Also how do you sort by multiple variables? 


[Chapter 6 Quiz, Problem 6]
* Question (ckile2-stat660):If you wanted to sort by the variables age and height would you put proc sort data=cert.diabetes; by= age and height; run; ? 


[Chapter 6 Quiz, Problem 7]
* Question (ckile2-stat660): In this program what is the point of putting where months<360;? Could you run it without months<360;? 


[Chapter 6 Quiz, Problem 8]
* Question (ckile2-stat660): Why say “rate eq 0.095” why not say “rate = 0.095” in this program ? Is eq the same as =? 


[Chapter 7 Quiz, Problem 7]
* Question (ckile2-stat660): If you wanted to store your variables in a specific order in a new SAS data set, how could you achieve that? Is it only dependent on the order in which variables are defined in the DATA set? 


[Chapter 7 Quiz, Problem 9]
* Question (ckile2-stat660): If the variable type for Bonus is incorrect, what is the correct variable type for Bonus? 


[Chapter 7 Quiz, Problem 11]
* Question (ckile2-stat660): During what step are the observations observed or inputed into the system? After the DATA step processing? So variables are created before observations? 


[printing-a-dataset Week 4 SAS Recipe]
* Question (ckile2-stat660): If you didn’t set (obs=20) and omitted it, would this dataset still print? Also what is the difference between id and var? 


[sorting-a-dataset Week 4 SAS Recipe]
* Question (ckile2-stat660): Why is it when I run this recipe it creates a dataset with the columns PetalLength and PetalWidth? Also in this recipe it says to sort by descending SepalLength SepalWidth;  Does that mean that both SepalLength and SepalWidth are descending? 


[checking-for-duplicates Week 4 SAS Recipe]
* Question (ckile2-stat660): When running this program to remove duplicates, do you have to list which columns you want this applied to under the by statement? For instance in this program under by, SepalLength and SepalWidth were listed, therefore all the duplicates were removed from these columns? Also what is considered a duplicate key value? 

***

# Recipes Exploration Results

```
* Recipe: printing-a-dataset ;

original recipe;
proc print data=sashelp.iris(obs=20);
	id SepalLength SepalWidth;
	var Species; 
run;

* modified to print all the observations not just the first 20 allowing me to see all the species (Setosa, Versicolor, Virfinica) sepal lengths and sepal widths;

proc print data=sashelp.iris;
	id SepalLength SepalWidth;
	var Species; 
run;


* Recipe: sorting-a-dataset ;

* original recipe;
proc sort
	   data=sashelp.iris
	   out=Work.iris_sorted
	;
	by
	   descending SepalLength
	   SepalWidth
	;
run;

* modified to sort dataset by descending PetalLength;


proc sort
	   data=sashelp.iris
	   out=Work.iris_sorted
	;
	by
	   descending PetalLength
	   PetalWidth 
	;
run;

* Recipe: checking-for-duplicates;

* original recipe;
proc sort
	   nodupkey
	   data=sashelp.iris
	   out=_null_
	;
	by
	   SepalLength
	   SepalWidth
	;
run;

* modified to delete duplicate key values from PetalLength and PetalWidth instead of SepalLength and SepalWidth;


proc sort
	   nodupkey
	   data=sashelp.iris
	   out=_null_
	;
	by
	   PetalLength
	   PetalWidth
	;
run;



```

