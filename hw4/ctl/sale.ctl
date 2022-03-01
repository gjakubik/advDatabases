load data infile 'csv/sale.csv'
insert into table sale
fields terminated by "," optionally enclosed by '"'
(sale_id,sdate date "MM/DD",cust_id,salpers_id,prod_id,qty)
