PROC IMPORT OUT= WORK.mydata 
            DATAFILE= "C:\Users\whowar\Desktop\example\mydata.csv" 
            DBMS=CSV REPLACE;
     GETNAMES=YES;
     DATAROW=2; 
RUN;
