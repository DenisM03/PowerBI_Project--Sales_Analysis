
# Sales Analysis

## **Project Overview** 

**Project Title** : Sales Analysis

**Dashboard link** : - https://app.powerbi.com/view?r=eyJrIjoiOTdiZDM5ZGItNTNjZC00MzMzLWFmZjAtYzM5MWU3NTg4ODYxIiwidCI6IjUxNjk4MzNiLWUxZWItNDlkNC1iODBiLWM0MTNjOTMxMWZkYSJ9


## **Objectives** 🎯
To unlock sales insights that were not visible before for the sales team for decision support and automate them to reduce manual time spent in data gathering.        
**Result:-**         
An automated dashboard providing quick and latest sales insights to support data-driven decision-making.

## **Skills** ⚙️
➡️ Power Bi    
➡️ Power Query    
➡️ DAX  
➡️ Data Modelling   
➡️ Dashboard    
➡️ SQL     
➡️ MYSQL  


### **Stakeholders**💹  :- 
Sales Director, Marketing Team, Customer Service Team, Data Analytics team, IT

## **Project Structure**

1. Exploratory Data Analysis using SQL         
2. ETL and Data Preprocessing           
3. Creating Dashboard            
4. Data Analysis             
5. Insights           
6. Recommendations       


# **1.Exploratory Data Analysis using SQL**
Created a Sales Database to store sales data which serves as a Data warehouse. Later built a connection to Power Bi to transform data smoothly, where Data Analysis and visualization are to be performed.          

I have done an Exploratory Data Analysis of the data using SQL addressing various  business questions and derived insights from the sales data.    
I have attached the SQL file to this repository.


# **2.ETL and Data Preprocessing**
Imported the data from the Mysql database.Used power query to clean and transform the data.Filtered rows that are unrelevant and with USD currency.        
Transformed the sales by normalizing the sales to Indian currency,
unit conversion from USD to INR using the calculated column.
Built a data model with star schema to connect all dimension tables
to fact table to access all data for analysis.

Below is the data model which was built.

![Screenshot 2024-10-04 154414](https://github.com/user-attachments/assets/04908bf0-1aa7-4a89-8f58-5e46b1a307db)




# **3.Creating Dashboard**
Initially started by creating KPI Metrics.
Revenue, total Sold Quantity, Average profit margin percentage, Total profit margin. Used clustered bar chart to display KPIs across customers, markets, and products. The line chart is used to show revenue trend and Profit margin trend across each year.

**Dashboard**

![Screenshot 2024-10-04 151501](https://github.com/user-attachments/assets/f086776f-0ea8-4a18-9fc5-3e93b96e7d1d)


# **4.Data Analysis**
I dived deep into analysis, uncovering trends, patterns, and opportunities.    

**1.Market Analysis**   
Aggregated Revenue, total Sold Quantity by market, Revenue by zone.   


**2.Customer Analysis**   
Aggregated Revenue, total Sold Quantity by customer, Revenue by customer type.  


**3.Product Analysis**   
Aggregated Revenue, total Sold Quantity by product, Revenue by product type.   


**4.Cost and Profitability Analysis**   
Aggregated Profit margin across customers, markets, and products.


**5.Time-Based Analysis**      
Presented Revenue and Profit margin across each year to display Revenue trends and Profit margin trends.


# **5.Insights**  💡

- Total revenue is 984.87M with 2M units sold. 

- The average profit margin is 2.44%, resulting in 24.66M in profit.

- Delhi NCR, Mumbai, and Ahmedabad lead in both revenue and profit margin, while Bengaluru, Bhubaneswar, and Surat lag. 

- Bengaluru shows the poorest performance with negative profit margins and low sales volumes. 

- The North zone generates 675.59M in revenue, with a profit margin of 2.44%. Central and South zones have revenues of 263.72M and 45.56M, respectively.

- Electricalsara Store, Electricalslytical, and Excel stores are the top revenue-generating customers. In contrast, Electricalsbea stores, Expression, and Electricalsquipo rank at the bottom in terms of revenue.

- Electricalsara Store, Premium Stores, and Surge stores are the top 3 customers by sold quantity. In contrast, Novus, Electricalsbea stores, Expression, and Acclaimed Stores are at the bottom in terms of sold quantity.

- Brick-and-mortar stores significantly outperform e-commerce in revenue, generating 744.53M compared to e-commerce’s 240.34M.

- There is missing data on  the product name for a product identified as  blank contributing 468.96M in revenue and 419,418 units sold. Among available products, blank, Prod040, and Prod159 generate the highest revenue, while Prod090 and Prod239 are top in terms of sold quantity.

- Revenue distribution based on product type is blank contributing $468.96M, Own Brand $369.87M, and Distribution $146.04M.

- Delhi NCR, Mumbai, and Ahmedabad rank as the most profitable markets, leading in overall profit margin contribution.

- The highest profit margins are generated by blank, Prod040, Prod090, and Prod049, making them the most valuable products.

- Electricalsara Store, Nixon, and Electricalslytical are the leading customers, delivering the highest profit margins.

- January 2018 stands out as the most profitable month with 42.52M in revenue, while June 2020 marks the least profitable month. Markets like Kanpur and Bengaluru experienced negative profit margins during this time.

- February 2018 posted the highest profit margin at 1.5M, while June 2020 saw a significant decline to 0.2M.

- Revenue and profit margin trends decreased significantly in 2020.

- Product details of 59 products are missing in the products table grouped as [blank] address this issue to the Marketing Team.

# **6.Recommendations** ⚡

* Allocate more resources to key markets and customers who generate the highest sales and profit margin. 

* Shift marketing budget and sales force towards zones, customers, and markets showing consistent sales growth. 

* For markets Bengaluru, Bhubaneswar, Patna, and Surat that have low profitability, consider adjusting the pricing strategy or running targeted promotions to boost sales. Ensure that high-margin products are promoted in regions with strong purchasing power to maximize returns.

* Reassess the sales strategy in Central and South zones with declining sales performance.

* Based on  Revenu trends, ramp up production and inventory during Quarter 1, Quarter 3, and peak sales months like January, February, March, and June. Ensure that sales and marketing teams focus on high-demand periods to maximize revenue.

* Tailor product recommendations and sales strategies for E-Commerce customer type.

* Increase production and distribution of Products which generates more Revenue and high Profit Margin with high selling quantity.

* Discontinue or reduce focus on underperforming products that have low sales quantity and minimal contribution to profit margin.

* Products with low-profit margin percentages may require a pricing revision. Consider increasing prices slightly or cutting costs related to production and distribution to improve profitability without losing competitiveness.

* Try to implement discounts on products in low-performing markets and customers.










