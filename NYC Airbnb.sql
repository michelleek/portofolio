use NYC;

# List distinct name
select distinct name
from ab_nyc;
# Count name, distinct name, and it's difference, distinct city, and distinct room type
select count(name) as total_name, count(distinct name) as total_unique_name, 
(count(name) - count(distinct name)) as total_difference_name , 
count(id) as total_id, count(distinct id) as total_unique_id, 
(count(id) - count(distinct id)) as total_difference_id ,
count(distinct neighbourhood_group) as city, count(distinct room_type) as room_type
from ab_nyc ;
# List of distinct id, name, host id, and it's name
select distinct id, name, host_id, host_name
from ab_nyc;
# Count average price based on the city.
select neighbourhood_group as city,avg(price) as average_price
from ab_nyc group by neighbourhood_group;
# List three most expensive place by it's city
select neighbourhood_group as city,max(price) as average_price
from ab_nyc group by neighbourhood_group limit 3;
# Get a list contains host name and how many times they success to sale their place
select host_name, count(host_name) as times_success_sale
from ab_nyc
group by host_name;
# Find total room based on room type sorted from the most
select room_type, count(room_type) as total_room_type
from ab_nyc group by room_type order by room_type;
# List a room type that always available
select name, host_name,  room_type, availability_365 as availability_room_perdays
from ab_nyc 
where availability_365= '365'
group by room_type ;