# customer-segmentation-analysis

Tools using:
-> Google Cloud Platform
-> Bigquery
-> Google cloud storage
-> Looker

Resource:
-> Got dataset from kaggle
[Dataset Link](https://www.kaggle.com/datasets/imakash3011/customer-personality-analysis)

**Step-1: Understanding Data**
-> Wrote the document above dataset
Provided the dataset in repository(Understanding Customer Personality Data)

**Step-2: Data Cleaning and Formatting**
--> Id - Counted null values in this column,and duplicate customer id
--> Repeated checking null values for all columns
--> Filled missing Income values with average of existing data
-->> Added Cutomer_Tenure,Children,Totalspending columns
    Customer_Tenure = Date of customer joined - current date
    Children = KidHome + TeenHome
    TotalSpending = MntFishProducts + MntFruits + MntGoldProds + MntMeatProducts + MntSweetProducts + MntWines
-->Replaced the table without Z_CostContact,Z_Revenue 

**Step-3: Exploratory Data Analysis(EDA)
-->Answering Stake Holder Questions
1.	Which age group contributes the most revenue?	
2.	Which product category has the highest average spending per customer?
3.  What is the average income by education level?
4.	How does marital status affect web purchases?
5.	Are customers who accepted previous campaigns more likely to respond to the current one?
6.	Is there a relationship between customer tenure and total spending?
7.	Which sales channel (web, store, catalog) is most preferred by high-income customers?
8.	What percentage of customers have made complaints? Does this vary by education or income level?
9.  Do customers with more kids tend to spend less?
10.    Are there differences in behavior between customers who accepted multiple campaigns and those who didn’t?

⚪ Insights and queries related to these questions are in EDA page
