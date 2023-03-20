-- 1. Find the most expensive stock with its price
select unitprice, stockcode  from ysu.stocks
order by unitprice desc limit 1
-- 2. Find number of deals by countries
--first solution
select distinct country as number_countries from ysu.stocks
--second solution
select country, count(distinct customerid) as number_of_deals from ysu.stocks
group by country
order by number_of_deals desc 
-- 3. Find number of deals for 13047 customer
select count(customerid) as number_of_deals from ysu.stocks
where customerid=13047
-- 4. Find top 3 the most active traders
SELECT customerid, COUNT(*) as num_transactions
FROM ysu.stocks
GROUP BY customerid
ORDER BY num_transactions DESC
LIMIT 3;
-- 5. Find top 5 the most frequently traded stocks in UK along with 
-- 		number of trades
select count(*) as num_transactions,stockcode 
from ysu.stocks
where country='United Kingdom'
group by country,stockcode
order by num_transactions desc Limit 5

-- 6. Find top 2 stocks that have largest market volume
select stockcode,(count(*)*quantity*unitprice) as market_volume
from ysu.stocks
group by stockcode,quantity,unitprice
order by market_volume desc limit 2

-- 7. Find the trader id along with its market volume, 
--    that has the largest turnover in the market
select customerid,SUM(quantity*unitprice) as market_volume
from ysu.stocks
group by customerid
order by market_volume desc LIMIT 3

select 
-- 8 Find the invoice numbers in UK that have volume more than 1500
select invoiceno,SUM(quantity*unitprice) as volume
from ysu.stocks
where country = 'United Kingdom'
group by invoiceno
having SUM(quantity*unitprice)>1500
order by volume desc 



