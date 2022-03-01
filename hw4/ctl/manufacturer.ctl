load data infile 'csv/manufacturer.csv'
insert into table manufacturer
fields terminated by "," optionally enclosed by '"'
(manufactr_id,manufactr_name,city,country)
