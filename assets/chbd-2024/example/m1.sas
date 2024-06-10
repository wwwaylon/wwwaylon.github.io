
/*Import data*/
PROC IMPORT OUT= WORK.mydata 
            DATAFILE= "C:\Users\whowar\Desktop\example\mydata.csv" 
            DBMS=CSV REPLACE;
     GETNAMES=YES;
     DATAROW=2; 
RUN;

data WORK.mydata;
  set WORK.mydata;
  array vars _numeric_;
  do i = 1 to dim(vars);
    if vars{i} = -999 then vars{i} = .;
  end;
  drop i;
run;

/*m1*/
proc calis data=mydata method=ml;
path SUP -> SUP1 SUP2 SUP3 = ly1 - ly3;
pvar SUP = 1,
     SUP1 SUP2 SUP3 = theta1 - theta3;
run;
