create or replace procedure salperstotprofit(name varchar2)
is 
  id salesperson.salpers_id%type;
  tot integer;
  begin
    tot := 0;
    id := slpkg.getsid(name);
    for row in (select * from sale where salpers_id = id) loop
      tot := tot + slpkg.totalprofitpertransaction(row.prod_id, row.qty);
    end loop;
  dbms_output.put_line('Total profit for ' || name || ' is $' || tot);
  end;
/
