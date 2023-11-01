# SQL-Project-01
Imported the data from Comma Separated Files(CSV) in PostgreSQL and executed queries to retrieve data

# PowerBI
I have successfully extracted and transformed the data from the PostgreSQL database in Power BI.
And checked for data types, errors, corrections, and blank values.
Then Analysed the Data, used measures to Create visualizations, Build reports, Published report and converted that report into Dashboard.

Created measures for KPIs
1. Total Orders = DISTINCTCOUNT('public pizzasales'[order_id])
2. Total Revenue = SUM('public pizzasales'[total_price])
3. Total Pizzas Sold = SUM('public pizzasales'[quantity])
4. Average Values = [Total Revenue]/[Total Orders]
5. Avg Pizza Per Order = [Total Pizzas Sold]/[Total Orders]

The report is consists of two pages:
1. Home
2. The names of the top five and bottom five pizzas ranked
   according to their quantity sold, total revenue generated, and the total number of orders received.”

