use  project;
show tables;
-- Find the total number of orders placed in Sales.
select count(*) as TotalOrders from `sales data` 
;

 
--   List the top 5 products by total sales amount from from  Sales table.
select productKey, sum(salesamount) as Totalsales from `sales data`
group by productkey
order by TotalSales desc
limit 5;

--  Calculate the total sales amount for each product category from the dimprodcategory table.
select dpc.EnglishProductCategoryName, sum(salesamount) as Totalsales from `sales data` fs
inner join dimproduct dp on dp.ProductKey = fs.ProductKey
inner join dimprodsubcategory dps on dps.ProductSubcategoryKey = dp.ProductSubcategoryKey
inner join dimprodcategory dpc on dpc.ProductCategoryKey = dps.ProductCategoryKey
group by dpc.EnglishProductCategoryName
;

--  Find the top 3 Customer with the highest average order amount; 
SELECT  
    CustomerKey,  
    COUNT(*) AS NumberOfOrders,  
    AVG(SalesAmount) AS AverageSalesAmount  
FROM `sales data`  
GROUP BY CustomerKey  
ORDER BY AverageSalesAmount DESC  
LIMIT 3;

--  Calculate the total sales amount for each year from the sales.
select year(orderdate) as orderyear, sum(salesamount) as TotalSales from `sales data`
group by year(orderdate)
order by year(orderdate);

--  Get the number of orders placed by each customer from sales data table.
select fs.Customerkey,dc.FirstName ,dc.LastName,count(*) as NumberofOrders from `sales data` fs
inner join `dim customer` dc on dc.Customerkey = fs.Customerkey
group by fs.CustomerKey,dc.FirstName,dc.LastName;

--  Find the average number of days between order date and ship date for each product.
select Productkey,avg(datediff(Shipdate, orderdate)) as AvgNumofDays from `sales data`
group by ProductKey;

-- Calculate the  total sales amount for each month in 2013.

Select	month(orderdate) as MonthOfOrder ,sum(SalesAmount) as TotalSales from `sales data`
where Year(orderdate)=2013
group by month(orderdate)
order by month(orderdate);

-- Retrieve the top 3 product subcategories with the highest total sales amount.
select  dps.EnglishProductSubcategoryName, sum(salesamount) as Totalsales from `sales data`fs
inner join dimproduct dp on dp.ProductKey = fs.ProductKey
inner join dimprodsubcategory dps on dps.ProductSubcategoryKey = dp.ProductSubcategoryKey
group by dps.EnglishProductSubcategoryName 
order by TotalSales Desc
Limit 3;

-- Calculate the total number of orders and total sales amount for each customer.
select Customerkey,count(*) as TotalOrders,Sum(salesamount) as TotalSales from `sales data`
group by CustomerKey














