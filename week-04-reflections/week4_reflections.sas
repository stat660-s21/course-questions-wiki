
/*
What is this code executing?
It is basically printing a specific column species with two observations sepal length and sepal width. It is printing the first 20 rows from the output.
*/



proc print data= sashelp.iris (obs=20);
	id SepalLength SepalWidth;
	var Species;
run;



/*What is this code executing?
It's sorting by Sepal Length first and then by Width and putting it in Work.iris_sorted output. 
*/
proc sort
        data=sashelp.iris
        out=Work.iris_sorted
    ;
    by descending SepalLength
	SepalWidth;
run;


/*What is the nodupkey?
It removes duplicates so that there is only one experimental unit with the sepal length and width combination in the output.
*/
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
