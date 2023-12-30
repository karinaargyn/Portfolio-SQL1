Select *
From [dbo].[FLO]

Select Brand, Sales, RP_Sales
From [dbo].[FLO]


Select Brand, Sales, RP_Sales
From [dbo].[FLO]

Select *
From [dbo].[FLO_Purchase]

Select Brand, Purchase, Sales, (Sales/Purchase)*100
From [dbo].[FLO]
Where brand like '%Polaris%'
Order by 1,2


--looking at brand with bigest stock compared to Purchase 

Select Brand, Purchase, MAX(Stock) AS BiggestStock, MAX((Stock/Purchase))*100 as percentage
From [dbo].[FLO]
--Where brand like '%Polaris%'
Group by Brand, Purchase
Order by percentage desc

-- Showing brand with biggest realization 
Select Brand, MAX(cast(Sales as int)) AS Sales, MAX(Purchase) as purchase, MAX ((Sales/Purchase))*100 as percentage
From [dbo].[FLO]
Where Brand is not null
--Where brand like '%Polaris%'
Group by Brand


-- Showing gender with buggest realization 
Select Gender, MAX(cast(Sales as int)) AS Sales, MAX(Purchase) as purchase, MAX ((Sales/Purchase))*100 as percentage
From [dbo].[FLO]
Where Brand is not null
--Where brand like '%Polaris%'
Group by Gender

--Showing with Category with biggest stock
Select SUBCategory, MAX(Annual_stock) as annual_stock, Max (Stock) as stock, MAX(cast(Sales as int)) AS Sales, MAX(Purchase) as purchase, MAX ((Sales/Purchase))*100 as percentage
From [dbo].[FLO]
--Where brand like '%Polaris%'
Group by subCategory

--Global numbers
Select Subcategory, Sum (Sales)
From [dbo].[FLO]
--Where brand like '%Polaris%'
Group by Subcategory
Order by 1,2

Select *
From [dbo].[FLO] F
Join [dbo].[FLO_Purchase] FP
	on F.article = FP.article
	and F.category = FP.category

Select f.Line, f.sales, f.stock, fp.annual_stock
	From [dbo].[FLO] F
Join [dbo].[FLO_Purchase] FP
	on F.article = FP.article
	and F.category = FP.category


Select f.Line, Sum(f.sales), sum(f.stock), sum(fp.annual_stock)
From [dbo].[FLO] F
Join [dbo].[FLO_Purchase] FP
	on F.article = FP.article
	and F.category = FP.category
	Group by f.Line

Select f.Line, Sum(f.sales), sum(f.stock), sum(fp.annual_stock)
From [dbo].[FLO] F
Join [dbo].[FLO_Purchase] FP
	on F.article = FP.article
	and F.category = FP.category
	Group by f.Line




Select f.Line, Sum(f.sales), sum(f.stock), sum(fp.annual_stock), SUM(f.purchase), SUM(f.sales/f.purchase) as realization, SUM(f.purchase/fp.annual_stock) as percentageofordertototalstock
From [dbo].[FLO] F
Join [dbo].[FLO_Purchase] FP
	on F.article = FP.article
	and F.category = FP.category
	Group by f.Line


Create View Percentage as
Select f.Line, Sum(f.sales) as sales, sum(f.stock) as stock, sum(fp.annual_stock) as annual_stock, SUM(f.purchase) as purchase, SUM(f.sales/f.purchase) as realization, SUM(f.purchase/fp.annual_stock) as percentageofordertototalstock
From [dbo].[FLO] F
Join [dbo].[FLO_Purchase] FP
	on F.article = FP.article
	and F.category = FP.category
	Group by f.Line

Select *
From Percentage