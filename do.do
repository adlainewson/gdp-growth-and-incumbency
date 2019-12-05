import delimited data.csv, clear
drop if _n<=2

rename v1 date
rename v2 growth
rename v3 dummy
gen y = 1 if dummy=="WIN"
replace y = 0 if dummy=="LOSS"

* Flag for the great recession 
gen flag = (date!="Dec-31-1932")

reg y growth if flag==1
predict pred 
replace pred = (pred>.5) if pred!=.

gen fit = (y==pred & y!=.)
li date y pred fit if y!=.



