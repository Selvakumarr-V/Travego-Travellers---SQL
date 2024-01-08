 
 use travego;
 /*a. How many female passengers traveled a minimum distance of 600 KMs? */

select count(*) as No_of_female_passengers from passenger
where gender like '%f%' and distance>=600;

/* b. Write a query to display the passenger details whose travel distance is greater than 500 and
who are traveling in a sleeper bus */

select * from passenger
where distance>500 and bus_type like '%sleeper%';

/* c. Select passenger names whose names start with the character 'S' */

select passenger_name from passenger
where left(passenger_name,1) like '%s%';


/* d. Calculate the price charged for each passenger, displaying the Passenger name, Boarding City,
Destination City, Bus type, and Price in the output. */

select Passenger_name,Boarding_City,Destination_City,pa.Bus_Type,price from passenger pa,price pr
where pr.id=pa.passenger_id;

/* e. What are the passenger name(s) and the ticket price for those who traveled 1000 KMs Sitting in
a bus?*/

select passenger_name,price from passenger pa,price pr
where pr.distance=pa.distance and pa.distance=1000 
and pa.bus_type like '%sitting%';


/* f. what will be the Sitting and Sleeper bus charge for Pallavi to travel from Bangalore to Panaji?  */

(select 'Sitting' as Type,price from price
where distance=(select distance from passenger
where passenger_name like '%pallavi%') and bus_type='sitting')
union
(select 'Sleeper' as Type,price from price
where distance=(select distance from passenger
where passenger_name like '%pallavi%') and bus_type='sleeper');

/* g. Alter the column category with the value "Non-AC" where the Bus_Type is sleeper */
set sql_safe_updates = 0;

update passenger
set category='Non-AC'
where passenger_id in (select passenger_id  where bus_type='sleeper');

/* h. Delete an entry from the table where the passenger name is Piyush and commit this change in
the database.*/

delete from passenger
where passenger_name='Piyush';

commit ;
 
/* i. Truncate the table passenger and comment on the number of rows in the table (explain if
required)*/ 

truncate table passenger;

select * from passenger;

/* j. Delete the table passenger from the database */

drop table passenger;
drop table price;