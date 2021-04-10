
# Questions about Assigned Quiz Problems and Recipes



Chapter 2
[Course Structure Quiz, Problem 2]
* Question(mshenkute-stat660): What is the error in this code? 
* Answer(mshenkute-stat660): The data in code proc print data=maxrates is incorrect. The dataset is cert.stress. 


[Course Structure Quiz, Problem 6]
* Question(mshenkute-stat660): What is a syntax error and which one is it in this code? 
* Answer(mshenkute-stat660): It’s one of the two type of errors that SAS can detect. It is a language error such as misspelling. The multiple choice answer C has the function label twice which is wrong. 

Chapter 6 

[Course Structure Quiz, Problem 1]
* Question(mshenkute-stat660): What does ‘noobs’ do? 
* Answer(mshenkute-stat660): It suppresses observation column so the # column in this case. 

[Course Structure Quiz, Problem 3]
* Question(mshenkute-stat660): What does the code Where do? Which one has a syntax error?
* Answer(mshenkute-stat660): It selects variables. In this case, since we want the observations that are equal to so we use Where =. Where is a conditional statement so it is used with =, >, <, =< or =>. B,C and D are wrong. 

[Course Structure Quiz, Problem 4]
* Question(mshenkute-stat660): Why do we need a new/temporary output after sorting data?
* Answer(mshenkute-stat660): Because sort procedure by default overwrites the original SAS data set, and we do not want that. The correct answer is B. 

[Course Structure Quiz, Problem 6]
* Question(mshenkute-stat660): Is the Where statement correct?
* Answer(mshenkute-stat660): Well, yes. The Where statement can use variables not listed under var but that is still in the dataset. So this code will print out sorted data of all women in the dataset that are from the specified column.

[Course Structure Quiz, Problem 7]
* Question(mshenkute-stat660): What does the sum statement in proc print do? 
* Answer(mshenkute-stat660): It produces column totals, so in this case for both month and amount. 

[Course Structure Quiz, Problem 8]
* Question(mshenkute-stat660): What is wrong with choice b?
* Answer(mshenkute-stat660): le is also used in place of <=, so if amount was not in parenthesis, it would be a second option. 



Chapter 7

[Course Structure Quiz, Problem 7]
* Question(mshenkute-stat660): What is the final dataset printed here?
* Answer(mshenkute-stat660): With a new salary of that is calculated by adding the original salary to the raised salary.


[Course Structure Quiz, Problem 9]
* Question(mshenkute-stat660): What is the length statement doing? What about the SET statement?
* Answer(mshenkute-stat660): The SET statement is executed in the data step to identify the location of the input dataset. The length statement specifies a numeric constant for storing variables. 


[Course Structure Quiz, Problem 11]
* Question(mshenkute-stat660): What is PDV?
* Answer(mshenkute-stat660): The Program Data Vector is a logical memory where SAS builds on the output. It is created after SAS syntax is compiled.

![image](https://user-images.githubusercontent.com/80928306/114282454-fa95ea00-99f8-11eb-8346-634fe3b8d753.png)



***



# Recipes Exploration Results



```SAS


Recipes Exploration Results
Recipe: printing a dataset;
/*
What is this code executing?
It is basically printing a specific column species with two observations sepal length and sepal width. It is printing the first 20 rows from the output.
*/
proc print data= sashelp.iris (obs=20);
id SepalLength SepalWidth;
var Species;
run;

Recipe: sorting a dataset;
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

Recipe: checking for duplicates;
/*What is the nodupkey?
It removes duplicates so that there is only one experimental unit with the sepal length and width combination in the output.
*/
proc sort
nodupkey
data=sashelp.iris
out=null
;
by
SepalLength
SepalWidth
;
run;



```
