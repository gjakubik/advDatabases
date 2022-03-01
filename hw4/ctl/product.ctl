load data infile 'csv/product.csv'
insert into table product
fields terminated by "," optionally enclosed by '"'
(prod_id,prod_desc,manufactr_id,cost,price)

