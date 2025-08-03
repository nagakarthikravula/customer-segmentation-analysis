--> Cleaning ID
select countif(ID is null) from `customer-personality-project.customer_segment_analysis_dataset.customer-segment-table`;
select ID,count(*) from `customer-personality-project.customer_segment_analysis_dataset.customer-segment-table` group by ID
having count(*) > 1;

-->Cleaning Year_of_Birth
--alter table `customer-personality-project.customer_segment_analysis_dataset.customer-segment-table`
--rename column Year_Birth to Birth_Year;

select countif(Birth_Year is null) from `customer-personality-project.customer_segment_analysis_dataset.customer-segment-table`;

--> Cleaning & Standardizing Education column

select countif(Education is null) from `customer-personality-project.customer_segment_analysis_dataset.customer-segment-table`;

select Education,count(*) from `customer-personality-project.customer_segment_analysis_dataset.customer-segment-table` group by Education;

--> Cleaning Martial_Status
select countif(Marital_Status is null) from `customer-personality-project.customer_segment_analysis_dataset.customer-segment-table`;

--> Cleaning Income
select countif(Income is null) from `customer-personality-project.customer_segment_analysis_dataset.customer-segment-table`;

UPDATE `customer-personality-project.customer_segment_analysis_dataset.customer-segment-table`
SET Income = (
  SELECT cast(AVG(Income) as int64)
  FROM `customer-personality-project.customer_segment_analysis_dataset.customer-segment-table`
  WHERE Income IS NOT NULL
)
WHERE Income IS NULL;

--> Cleaning KidHome
select countif(Kidhome is null) from `customer-personality-project.customer_segment_analysis_dataset.customer-segment-table`;

--> Cleaning TeenHome
select countif(Teenhome is null) from `customer-personality-project.customer_segment_analysis_dataset.customer-segment-table`;

--> Cleaning Enrollment Date of Customer
select countif(Dt_Customer is null),
countif(Recency is null),
countif(MntFishProducts is null),
countif(MntFruits is null),
countif(MntGoldProds is null),
countif(MntMeatProducts is null),
countif(MntSweetProducts is null),
countif(MntWines is null),
countif(NumDealsPurchases is null),
countif(NumStorePurchases is null),
countif(NumCatalogPurchases is null),
countif(NumWebPurchases is null),
countif(NumWebVisitsMonth is null)
-- Countif(AcceptedCmp4 is null),
-- countif(AcceptedCmp5 is null),
-- countif(AcceptedCmp1 is null),
-- countif(AcceptedCmp2 is null)
 from `customer-personality-project.customer_segment_analysis_dataset.customer-segment-table`;



--> Adding Cutomer Tenure
-- alter table `customer-personality-project.customer_segment_analysis_dataset.customer-segment-table`
-- add column Customer_Tenure INT64;

update `customer_segment_analysis_dataset.customer-segment-table` c
set Customer_Tenure = (extract(year from current_date())-extract(year from c.Dt_Customer)) where Customer_Tenure is NULL;

-->childrens at home
-- alter table `customer-personality-project.customer_segment_analysis_dataset.customer-segment-table`
-- add column Children int64;

-- update `customer_segment_analysis_dataset.customer-segment-table` c
-- set Children = (Kidhome + Teenhome) where Children is NULL;

--> replaced table without Z_CostContact,Z_Revenue 
CREATE OR REPLACE TABLE `customer-personality-project.customer_segment_analysis_dataset.customer-segment-table` AS
SELECT
  -- Keep only the needed columns
  ID,
  Birth_Year,
  Education,
  Marital_Status,
  Income,
  Kidhome,
  Teenhome,
  Dt_Customer,
  Recency,
  MntWines,
  MntFruits,
  MntMeatProducts,
  MntFishProducts,
  MntSweetProducts,
  MntGoldProds,
  NumDealsPurchases,
  NumWebPurchases,
  NumCatalogPurchases,
  NumStorePurchases,
  NumWebVisitsMonth,
  AcceptedCmp1,
  AcceptedCmp2,
  AcceptedCmp5,
  Complain,
  Response,
  Customer_Tenure,
  Children,
  Total_Spending,
  Age
FROM `customer-personality-project.customer_segment_analysis_dataset.customer-segment-table` where Birth_Year >= 1950;

--> Adding new column toal_spending

-- alter table `customer-personality-project.customer_segment_analysis_dataset.customer-segment-table`
-- add column Total_Spending INT64;

update `customer_segment_analysis_dataset.customer-segment-table` c
set Total_Spending = (MntFishProducts+MntFruits+MntGoldProds+MntMeatProducts+MntSweetProducts+MntWines) where Total_Spending is NULL;
-- ALTER TABLE `customer_segment_analysis_dataset.customer-segment-table`
-- ADD COLUMN Age INT64;


UPDATE `customer_segment_analysis_dataset.customer-segment-table`
SET Age = EXTRACT(YEAR FROM CURRENT_DATE()) - Birth_Year where Age is null;



