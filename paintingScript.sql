-- In this case study we have found answers to several questions using SQL querries.
-- Let's see all the tables
use paintings;
describe artist;
describe canvasSize;
describe imageLink;
describe museum;
describe museumHours;
describe productSize;
describe subject;
describe work;

-- Querries

-- Fetch all the paintings which are not displayed on any museums?
select * from work
where museum_id is null;

-- Are there museums without any paintings?
select * from museum m
left join work w 
on m.museum_id = w.museum_id
where w.work_id is null;

-- How many paintings have an asking price of more than their regular price?
select * from productSize
where sale_price > regular_price;

-- Identify the paintings whose asking price is less than 50% of its regular price
select * from productSize
where sale_price < (regular_price*0.5);

-- Which canva size costs the most?
SELECT c.size_id, MAX(p.sale_price) as max_sale_price
FROM canvasSize c
NATURAL JOIN productSize p
GROUP BY c.size_id
HAVING max_sale_price > 0
ORDER BY max_sale_price DESC
limit 1;

-- Identify the museums with invalid city information in the given dataset
SELECT *
FROM museum
WHERE city REGEXP '^[0-9]';

-- Fetch the top 10 most famous painting subject
select distinct subject, count(*) as numOfItems
from subject s
natural join work w
group by s.subject
order by count(*) desc
limit 10;

-- Identify the museums which are open on both Sunday and Monday. Display museum name, city.
SELECT m.name, m.city, mh.day
FROM museum m
JOIN museumHours mh ON m.museum_id = mh.museum_id
WHERE mh.day IN ('Sunday', 'Monday')
ORDER BY mh.day;

-- Which are the top 5 most popular museum? (Popularity is defined based on most no of paintings in a museum)
select count(*) as work_count, w.museum_id, m.name
from work w
join museum m on w.museum_id = m.museum_id
where w.museum_id is not null
group by w.museum_id, m.name
order by work_count desc
limit 5;

-- Who are the top 5 most popular artist? (Popularity is defined based on most no of paintings done by an artist)
select count(*) as numOfPaintings, w.artist_id, a.full_name
from work w 
join artist a
on w.artist_id = a.artist_id
group by w.artist_id, a.full_name
order by numOfPaintings desc
limit 5;

-- Display the 3 least popular canva sizes
select count(*) as numOfPaintings, c.label
from productSize p
join canvasSize c 
on p.size_id = c.size_id
group by p.size_id, c.label
order by numOfPaintings desc
limit 3;

-- Which museum is open for the longest during a day. Dispay museum name, state and hours open and which day?
select 
	(select max(timediff(mh.open, mh.close)) as durationOpen
    from museumHours mh) as hoursOpen,
    mh.day, m.name, m.state
from museumHours mh
join museum m
on mh.museum_id = m.museum_id
group by mh.museum_id, mh.day, m.name, m.state
order by hoursOpen desc
limit 1;

-- Which museum has the most no of most popular painting style?
select w.museum_id, m.name
from work w
join museum m
on w.museum_id = m.museum_id
where w.style = (
		select w.style
		from work w
		group by w.style
		order by count(*) desc
		limit 1)
group by w.museum_id, m.name
order by count(*) desc 
limit 1;
