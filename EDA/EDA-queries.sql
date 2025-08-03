-->1. Which age group contributes the most revenue?
select Age,Sum(Total_Spending) as Total_Revenue_By_Age from `customer-personality-project.customer_segment_analysis_dataset.customer-segment-table`
group by Age order by Total_Revenue_By_Age desc;

-->2.Which product category has the highest average spending per customer?

select 
round(avg(MntFishProducts),2) as Fish,
round(avg(MntFruits),2) as Fruits,
round(avg(MntGoldProds),2) as Gold,
round(avg(MntMeatProducts),2) as Meat,
round(avg(MntSweetProducts),2) as Sweets,
round(avg(MntWines),2) as Wine
from `customer-personality-project.customer_segment_analysis_dataset.customer-segment-table`;

-->3.What is the average income by education level?

select Education,round(avg(Income),2) as Average_Income
from `customer-personality-project.customer_segment_analysis_dataset.customer-segment-table`
group by Education order by Average_Income desc;

-->4.How does marital status affect web purchases?
select Marital_Status,round(avg(NumWebPurchases),2) as avg_purchases,round(sum(NumWebPurchases),2) as Total_Web_Purchases,
count(*) as Total_Customers
from `customer-personality-project.customer_segment_analysis_dataset.customer-segment-table` 
group by Marital_Status
order by avg_purchases desc;

-->5.Are customers who accepted previous campaigns more likely to respond to the current one?
select 
case when (AcceptedCmp1+AcceptedCmp2+AcceptedCmp5) >0 then "Accepted" else "Not_Accepted" end as Type,
count(*) as Customer_Count,
sum(case when Response = 1 then 1 else 0 end) as Response_Count,
round((sum(case when Response = 1 then 1 else 0 end) /count(*))*100,2) as Response_Percentage
from `customer-personality-project.customer_segment_analysis_dataset.customer-segment-table`group by Type;

-->6.Is there a relationship between customer tenure and total spending?
select Customer_Tenure,sum(Total_Spending) as Total_Spending_By_Tenure
from `customer-personality-project.customer_segment_analysis_dataset.customer-segment-table`
group by Customer_Tenure order by Total_Spending_By_Tenure desc;

-->7.Which sales channel (web, store, catalog) is most preferred by high-income customers?
select sum(NumWebPurchases) as Web_Purchases,
sum(NumCatalogPurchases) as Catalog_Purhcases,
sum(NumStorePurchases) as Store_Purhcases
from `customer-personality-project.customer_segment_analysis_dataset.customer-segment-table`
where Income > (select avg(Income) from `customer-personality-project.customer_segment_analysis_dataset.customer-segment-table`);

-->8.What percentage of customers have made complaints? Does this vary by education or income level?
-->complain count
select Count(*) as Total_Customers,
sum(case when Complain = 1 then 1 else 0 end) as Complain_Customers,
round((sum(case when Complain = 1 then 1 else 0 end)/count(*))*100,2) as Complain_Percentage
from `customer-personality-project.customer_segment_analysis_dataset.customer-segment-table`;

-->complain count by education
select Education
,Count(*) as Total_Customers,
sum(case when Complain = 1 then 1 else 0 end) as Complain_Customers,
round((sum(case when Complain = 1 then 1 else 0 end)/count(*))*100,2) as Complain_Percentage
from `customer-personality-project.customer_segment_analysis_dataset.customer-segment-table` group by Education;

-->complain count by income level
select case when Income > (select avg(Income) from `customer_segment_analysis_dataset.customer-segment-table`)
then "High Income" else "Low Income" end as Income_Group
,Count(*) as Total_Customers,
sum(case when Complain = 1 then 1 else 0 end) as Complain_Customers,
round((sum(case when Complain = 1 then 1 else 0 end)/count(*))*100,2) as Complain_Percentage
from `customer-personality-project.customer_segment_analysis_dataset.customer-segment-table` group by Income_Group;

select Education,case when Income > (select avg(Income) from `customer_segment_analysis_dataset.customer-segment-table`)
then "High Income" else "Low Income" end as Income_Group,count(*),
sum(case when Complain = 1 then 1 else 0 end) as Complain_Customers,
 from `customer-personality-project.customer_segment_analysis_dataset.customer-segment-table` group by Education,Income_Group having Education = "Graduation";


-->9.Do customers with more kids tend to spend less?
select Children,sum(Total_Spending) as Total_Spending
from  `customer-personality-project.customer_segment_analysis_dataset.customer-segment-table`
group by Children
order by Total_Spending desc;

-->10.Are there differences in behaviour between customers who accepted multiple campaigns and those who didn’t?
select (AcceptedCmp1+AcceptedCmp2+AcceptedCmp5) as Campaign_Count,count(*)as Customer_Count,
ROUND(AVG(Income), 2) AS Avg_Income,
  ROUND(AVG(Complain), 2) AS Complain_Rate,
  ROUND(AVG(MntWines + MntFruits + MntMeatProducts + MntFishProducts + MntSweetProducts + MntGoldProds), 2) AS Avg_Spending
from `customer-personality-project.customer_segment_analysis_dataset.customer-segment-table`
 group by Campaign_Count
 order by Campaign_Count;


