create database assign1;

create table assign1.table1(
Name VARCHAR(255),
Age VARCHAR(255),
City VARCHAR(255),
Zipcode VARCHAR(255),
Phone VARCHAR(255),
State_code VARCHAR(255),
Order_id VARCHAR(255)
);

create table assign1.table2(
Name VARCHAR(255),
State_code VARCHAR(255),
County VARCHAR(255),
Order_date DATETIME,
Phone VARCHAR(255),
Order_id VARCHAR(255)
);


select * from assign1.table2;
create table assign1.table3 ((select assign1.table1.Name, assign1.table1.State_code, assign1.table1.Age, assign1.table1.City, assign1.table1.Zipcode, assign1.table1.Phone, assign1.table1.Order_id, assign1.table2.County, assign1.table2.Order_date from assign1.table1 right join assign1.table2 on assign1.table1.State_code= assign1.table2.State_code or assign1.table1.name= assign1.table2.name or assign1.table1.Phone= assign1.table2.Phone or assign1.table1.Order_id= assign1.table2.Order_id) union (select assign1.table1.Name, assign1.table1.State_code, assign1.table1.Age, assign1.table1.City, assign1.table1.Zipcode, assign1.table1.Phone, assign1.table1.Order_id, assign1.table2.County, assign1.table2.Order_date from assign1.table1 left join assign1.table2 on assign1.table1.State_code= assign1.table2.State_code or assign1.table1.name= assign1.table2.name or assign1.table1.Phone= assign1.table2.Phone or assign1.table1.Order_id= assign1.table2.Order_id));

select * from assign1.table3;

create table assign1.table5 (select * from assign1.table3 where State_code in ("TX","CA","AZ","NY","FL"));

select assign1.table3.State_code, count(assign1.table3.Order_id) as NumofOrders from assign1.table3 group by assign1.table3.State_code order by NumofOrders DESC LIMIT 1;

select assign1.table3.State_code as state, year(assign1.table3.Order_date) as year, count(assign1.table3.Order_id) as NumofOrders from assign1.table3 group by state, year order by NumofOrders DESC limit 1;

select assign1.table3.State_code as state, year(assign1.table3.Order_date) as year, assign1.table3.City as city, count(assign1.table3.Order_id) as NumofOrders from assign1.table3 group by state, year, city order by NumofOrders DESC limit 1;

select assign1.table3.Age as age, count(assign1.table3.Order_id) as NumofOrders from assign1.table3 where assign1.table3.Order_id > 10 group by age order by age DESC limit 1;
use assign1;
select table3.Order_id, length(table3.Order_id) as total_length, substring_index(table3.Order_id,"-",1) as split_string1, length(substring_index(table3.Order_id,"-",1)) as len1, substring_index(substring_index(table3.Order_id,"-",2),"-",-1) as split_string2, length(substring_index(substring_index(table3.Order_id,"-",2),"-",-1)) as len2, substring_index(substring_index(table3.Order_id,"-",3),"-",-1) as split_string3, length(substring_index(substring_index(table3.Order_id,"-",3),"-",-1)) as len3, substring_index(substring_index(table3.Order_id,"-",4),"-",-1) as split_string4, length(substring_index(substring_index(table3.Order_id,"-",4),"-",-1)) as len4, substring_index(substring_index(table3.Order_id,"-",5),"-",-1) as split_string5, length(substring_index(substring_index(table3.Order_id,"-",5),"-",-1)) as len5 from table3;