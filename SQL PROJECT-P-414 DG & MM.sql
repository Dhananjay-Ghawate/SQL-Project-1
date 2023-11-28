create database IPL;
use IPL;
show tables;
select * from ipl20;
select*from ipl_matches;
  
#Q1 display city & team 1 from ipl_matches table whoes id is 335986 
select city,team1 from ipl_matches where id=335986; #  where clause

#Q2 Problem Statements to be solved using – Inner JOIN # ipl20 and ipl_matches
select * from ipl20 i inner join ipl_matches p on i.id=p.id; # inner join

#Q3 display team1,team2,result_margin,winner for all ipl_matches whoes result margin is more than average result margin(ipl_matches table)
select team1,team2,result_margin,winner from ipl_matches where result_margin> (select avg(result_margin) from ipl_matches); #using subquery

#Q4  display result margin for all ipl_matches using order by clause sort the query (desc,asc)
#A
select result_margin from ipl_matches order by result_margin desc; #order by clause DESC
#B
select result_margin from ipl_matches order by result_margin asc; #order by clause ASC

#Q5 display all data from ipl_matches table for all ipl_matches who was played before january 1st,2015
select * from ipl_matches where date >"2015-01-01"; 

#Q6 Display the batsman in lower case and non_striker in upper case, for all ipl20 whose id is in the range between 400000 and 450000
select lower(batsman) as batsman ,upper(non_striker) as non_striker from ipl20 where id between 400000 and 450000; #Numeric function

#Q7 For each ipl_matches, display the venue, city, winner & id using inner join
select i.venue,i.city,i.winner,i.id from ipl_matches i inner join ipl20 p on i.id=p.id; #using inner join

#Q8 Display the highest result_margin alphabetically (ipl_matches table)
select max(result_margin) as highest_result_margin from ipl_matches; # using group by

#Q9 display the highest,lowest & average result_margin
select max(result_margin) as highest_result_margin, min(result_margin)as lowest_result_margin, avg(result_margin)  from ipl_matches; 

#Q10 average result_margin per ipl_matches
select avg(result_margin) from ipl_matches; #group by & having clause

#A Display the id and average result_margin for each ipl_matches
select  id, avg (result_margin)as average_result_margin from ipl_matches group by id;

#B Modify your query to display the results only for ipl_matches 419106 or 419110 
SELECT id, AVG(result_margin) AS average_result_margin FROM IPL_MATCHES WHERE id in(419106,419110)  GROUP BY id;

#Q11 Create a query to display the unique result_margin from ipl_matches table. 
select distinct(result_margin) from ipl_matches order by result_margin desc; # using distinct & order by

#Q12 Create a query to display player_of_match concatenated with winner column, separated by space. Name this column heading as “man_of_the_match” (ipl_matches table). 
select concat( player_of_match , winner ) as man_of_the_match from ipl_matches; #use concat for combining two columns

#Q13  Display team1 for all ipl_matches where team1 length is greater than 8 characters.
select team1 from ipl_matches where length(team1)>8; #use length

#Q14 For each ipl_matches, display the city,venue,id and a player_id
#using the REPLACE function. in the player_id replace all occurrences of 
#335982 with 33 59 82
select city, venue, id , replace( id, "335982" , "33 59 82") AS player_id FROM ipl_matches; # using repalce

#Q15 For each ipl_matches, display the team1, team2, winner, and a result_margin grade based on these conditions
SELECT team1,team2,winner,result_margin,
    CASE 
        WHEN result_margin BETWEEN 1 AND 10 THEN 'A'
        WHEN result_margin BETWEEN 50 AND 60 THEN 'B'
        WHEN result_margin BETWEEN 80 AND 100 THEN 'C'
        ELSE 'D'
    END AS great_matches_grade
FROM ipl_matches;

#Q16 Display city,date, team1 and team2 for all ipl_matches who was played during april 30th, 2016 and April 17th, 1998.
SELECT city, team1, team2  from ipl_matches where date= "2016-04-30";
SELECT * from ipl_matches where date= "2016-04-30";

#Q17 Display FULL OUTER JOIN 
SELECT* FROM ipl20 i LEFT OUTER JOIN ipl_matches p ON i.id=p.id UNION
select* from ipl20 i RIGHT OUTER JOIN ipl_matches p ON i.id=p.id;

#Q18 full outer excluding inner join
select* from ipl20 i left outer join ipl_matches p ON i.id=p.id where p.id is null 
union
select* from ipl20 i right outer join ipl_matches p on i.id=p.id where i.id is null;

#Q19 LEFT OUTER JOIN
SELECT* FROM ipl20 i LEFT OUTER JOIN ipl_matches p ON i.id=p.id;

#Q20 right outer joint
select* from ipl20 i RIGHT OUTER JOIN ipl_matches p ON i.id=p.id;

#Q21 Cartesian join/CROSS JOIN 
select i.id, p.id, city, venue from ipl20 i, ipl_matches p;

#Q22 display for all ipl_matches whoes result_margin in 144,146
select * from ipl_matches where result_margin IN (144,146); 

#Q23 Display the number of NULL values in batsman_runs column (ipl20 table).
SELECT COUNT(*) AS "number of null values"
FROM ipl20
WHERE batsman_runs IS NULL;

#Q24 Display the number of Non-NULL values in batsman_runs column (ipl20 table).
SELECT COUNT(*) AS "Number of Non-NULL Values"
FROM ipl20
WHERE batsman_runs IS NOT NULL;

#Q25 Display the number of rows in ipl_matches table.  
SELECT COUNT(*) AS "Number of rows"
FROM ipl_matches;

#Q26 Display the number of columns in ipl_matches table.
SELECT COUNT(*) AS "Number of Columns"
FROM information_schema.COLUMNS
WHERE TABLE_NAME = "ipl_matches";

#Q27 Display the number of columns in ipl20 table.alter
SELECT COUNT(*) AS "Number of Columns"
FROM information_schema.COLUMNS
WHERE TABLE_NAME = "ipl20";

#Q28 1. Display the id and minimum result_margin for each id, for all ipl_matches whose minimum result_margin is greater than 70.
SELECT id, MIN(result_margin) AS "Minimum result_margin"
FROM ipl_matches
GROUP BY id
HAVING MIN(result_margin)>70;

#Q29 For each ipl_matches, display the team1, and team2.
 SELECT i.id AS "ipl20 id", p.id AS "ipl_matches id"
FROM ipl20 i
JOIN ipl20 p ON i.id = p.id; #using self join

#Q30 This query will return the id, result_margin, and the number of ipl_matches in each id where the average result_margin is less than 50 and the result_margin is less than 100.
select id, avg(result_margin) as average,count(id) as count from ipl_matches where result_margin>50 group by id having  avg(result_margin)>100 order by id;

#Q31 Display unique or special entries attributed in the column id
select distinct id FROM ipl20;

#Q32 Display concatenated of two teams separated by comma as UNIQUE_name .
select concat(team1,"  ",team2) as UNIQUE_name from ipl_matches;

#Q33 Show the syntax for total count of unique entries in result_margin.
select count(DISTINCT result_margin) from ipl_matches;

#Q34 Display the combined result format from both tables having common entries.
select id from ipl20 union select id from ipl_matches;

#Q35 Display team1,team,2,id where id should showcased as empty.
select team1,team2,id from ipl_matches where id is null;

DELIMITER &&
CREATE PROCEDURE LOJII()
BEGIN
 SELECT*FROM ipl_matches where result="runs";
 end &&
 DELIMITER ;
 call LOJII();


