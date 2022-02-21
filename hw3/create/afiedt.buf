select s1.salpers_name, count(*) as num_employees
from salesperson s1, salesperson s2
where s1.salpers_id = s2.manager_id
group by s1.salpers_name
/
