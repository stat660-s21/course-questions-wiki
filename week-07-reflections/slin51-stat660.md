
# Questions about Assigned Quiz Problems and Recipes


[Textbook Chapter 8, Problem 3]
* Question (slin51-stat660): What does the argument _N_ do?


[Textbook Chapter 8, Problem 4]
* Question (slin51-stat660): Can categorical variables be sorted in ascending or descending order?


[Textbook Chapter 8, Problem 5]
* Question (slin51-stat660): Are BY groups sorted in the order of the variables listed?


[Textbook Chapter 8, Problem 6]
* Question (slin51-stat660): Why are all other observations set to 0?


[Textbook Chapter 13, Problem 1]
* Question (slin51-stat660): Why was the date January 1, 1960 selected?


[Textbook Chapter 13, Problem 2]
* Question (slin51-stat660): Do any other programming languages besides SAS store dates and times as numeric?


[Textbook Chapter 13, Problem 4]
* Question (slin51-stat660): Is there an automatic way for SAS to recognize the field width and use the correct SAS informat?


[Textbook Chapter 14, Problem 2]
* Question (slin51-stat660): Why is there a period after specifying the informat comma7.?


[Textbook Chapter 14, Problem 6]
* Question (slin51-stat660): Does the drop argument actually keep the columns in the data?


[Textbook Chapter 14, Problem 7]
* Question (slin51-stat660): Do spaces need to be used between the concatenation operator?


***


# Recipes Exploration Results



```
* Recipe: drop-and-swap;

data iris_with_all_text_columns(
        drop=
            SepalLength_int
            SepalWidth_int
            PetalLength_int
            PetalWidth_int
     );
    set sashelp.iris(
        rename=(
                SepalLength=SepalLength_int
                SepalWidth=SepalWidth_int
                PetalLength=PetalLength_int
                PetalWidth=PetalWidth_int
            )   
        );    
    SepalLength=put(SepalLength_int,z3.);
    SepalWidth=put(SepalWidth_int,z3.);
    PetalLength=put(PetalLength_int,z3.);
    PetalWidth=put(PetalWidth_int,z3.);
run;



```

* Question (slin51-stat660): What does the z3. format do?


```

* Recipe: isolating-all-duplicates;

proc sort
        data=sashelp.iris
        out=iris_sorted
    ;
    by
        Species
        SepalLength
        SepalWidth
    ;
run;
data iris_sorted_dups;
    set iris_sorted;
    by
        Species
        SepalLength
        SepalWidth
    ;
    if
        first.SepalWidth*last.SepalWidth = 0
    then
        do;
            output;
        end;
run;

```

* Question (slin51-stat660): Are else statements in the if statements optional?

