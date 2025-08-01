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
