select sa.salpers_name, sum((p.price-p.cost)*s.qty) as profit
from salesperson sa natural join sale s natural join product p
group by sa.salpers_name
/
