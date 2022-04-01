create or replace procedure getsalperstransactions(name varchar2)
is
  id salesperson.salpers_id%type;
  begin
    id := slpkg.getsid(name);
    dbms_output.put_line('The Transactions of '|| name || ' are ');
    dbms_output.put_line('Sale_id, sdate, cust_name, product_desc, qty');
    for row in (select * FROM sale WHERE salpers_id = id) loop
	dbms_output.put_line(row.sale_id || ' ' || row.sdate || ' ' || slpkg.getcname(row.cust_id) || ' ' || slpkg.getpname(row.prod_id) || ' ' || row.qty);
    end loop;
  end;
/
