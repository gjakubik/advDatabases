create or replace procedure getcustlistfromsalesperson(name varchar2)
is
  id salesperson.salpers_id%type;
  begin
    id := slpkg.getsid(name);
    dbms_output.put_line('A customer of ' || name || ' is: ');
    for row in (select distinct cust_id FROM sale WHERE salpers_id = id) loop
	dbms_output.put_line(slpkg.getcname(row.cust_id));
    end loop;
  end;
/
