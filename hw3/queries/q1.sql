select s.sale_id, s.sdate, c.cust_name, sa.salpers_name, p.prod_desc, s.qty
from customer c natural join sale s natural join salesperson sa natural join product p
/
