-- 1. Find the most expensive stock with its price
select * from ysu.stocks order by unitprice desc limit 1

-- 2. Find number of deals by countries
select  
	country, 
	sum(quantity)
from ysu.stocks
group by country 

-- 3. Find number of deals for 13047 customer
select sum(quantity) from ysu.stocks where customerid = 13047

-- 4. Find top 3 the most active traders
select customerid, sum(quantity) as sum from ysu.stocks
group by customerid
order by sum desc limit 3

-- 5. Find top 5 the most frequently traded stocks in UK along with 
-- 		number of trades
select * from ysu.stocks where country = 'United Kingdom'
order by invoiceno limit 5

-- 6. Find top 2 stocks that have largest market volume
--???

-- 7. Find the trader id along with its market volume, 
--    that has the largest turnover in the market
--???

-- 8 Find the invoice numbers in UK that have volume more than 1500
--???

















