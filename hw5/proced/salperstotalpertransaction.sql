create or replace procedure salperstotalpertransaction(name varchar2)
is 
  id salesperson.salpers_id%type;
  
  begin
    id := slpkg.getsid(name);
    for row in (select * from sale where salpers_id = id) loop
      dbms_output.put_line(name || ' sold $' || slpkg.totalpertransaction(row.prod_id, row.qty) || ' in a transaction');
    end loop;
  end;
/
