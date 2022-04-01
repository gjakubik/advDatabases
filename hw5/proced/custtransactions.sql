create or replace procedure custtransactionlist(cid customer.cust_id%type)
is
    name customer.cust_name%type;
    pname product.prod_desc%type;
    qty sale.qty%type;
    price integer;
    total integer;
    begin
        name := slpkg.getcname(cid);
        dbms_output.put_line('Transactions for ' || name || ': ');
        for row in (select * FROM sale WHERE cust_id = cid) loop
        dbms_output.put('Transaction ' || row.sale_id || ': ');
        total := slpkg.totalpertransaction(row.sale_id);
        qty := row.qty;
        pname := slpkg.getpname(row.prod_id);
        dbms_output.put_line(qty || ' of ' || pname || ' sold for ' || total || '.');
        end loop;
    end;
/