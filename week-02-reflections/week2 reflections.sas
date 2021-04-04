

filename tempfile TEMP;
proc http
	method="get"
	url="https://tinyurl.com/stat660-sat15"
	out=tempfile
	;
run;
proc import
	file=tempfile
	out=sat15_raw
	dmbs=xls;
run;
filname tempfile clear;



/* Question: What does proc http do? 
Answer: It is used to make a simple web request and communicate with complex web applications.*/






%macro loadDataIfNotAlreadyAvailable(dsn, url, filetype);
	%put &=dsn;
	%put &=url;
	%put &=filetype;
	%if
		%sysfunc(exist(&dsn.))=0
	%then
		%do;
			%put Loading dataset &=dsn. over the wire now...;
			filename tempfile TEMP;
			proc http
				method="get"
				url="&url."
				out=tempfile
				;
				run;
				proc import
					file=tempfile
					out= &dsn.
					dbms=&filetype.;
				run;
				filename tempfile clear;
			%end;
		%else
			%do;
				%put Dataset &dsn. already exists. Please delete and try again.;

		%end;
	%mend;
	%loadDataIfNotAlreadyAvailable(sat15_raw,https://tinyurl.com/stat660-sat15,xls)


/* Question: What is this code doing? What are macros? 
Answer: Macros are a way of saving code and rerunning without rewriting the whole thing out multiple times.

