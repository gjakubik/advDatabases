-- finds total of all transactions of a given customer
declare
    cid customer.cust_id%type := '&id';  -- the ampersand allows the user to input the value
    cname customer.cust_name%type;
    tot product.price%type;
begin
    cname := slpkg.getcname(cid);
    tot := slpkg.get_customer_total(cid);
    if tot is null then
        dbms_output.put_line('Can''t find customer');
    else
        dbms_output.put_line('The total of all  ' || cname || '''s purchases is ' || tot || '$');
    end if;
end;
/