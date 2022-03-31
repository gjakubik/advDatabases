create or replace package body slpkg
is
    function get_transaction_total(id sale.sale_id%type)
        return product.price%type
    is
        tot product.price%type;
    begin
        select sale.qty * product.price 
        into tot 
        from sale, product
        where sale.sale_id = id 
        and sale.prod_id = product.prod_id;
        return tot;
    exception
        when no_data_found then
            dbms_output.put_line('getTransactionTotal error: ' || id || ' not found');
            return null;
    end;

    function get_customer_total(id customer.cust_id%type)
        return product.price%type
    is
        tot product.price%type;
    begin
        select sum(slpkg.get_transaction_total(sale.sale_id)) 
        into tot
        from sale
        where sale.cust_id = id
    exception
        when no_data_found then
            dbms_output.put_line('getCustomerTotal error: ' || id || ' not found');
            return null;
    end;

    function get_cust_name(id customer.cust_id%type)
        return customer.cust_name%type
    is
        name customer.cust_name%type;
    begin
        select cust_name
        into name
        from customer
        where cust_id = id;
        return name;
    exception
        when no_data_found then
            dbms_output.put_line('getCustName error: ' || id || ' not found');
            return null;
    end;

    procedure transaction_list(cid customer.cust_id%type)
    is
        cursor trans_c (id customer.cust_id%type)
        is
        select s.date, sp.salpers_name, p.prod_desc, s.qty, s.qty * p.price
        from customer c, sale s, product p, salesperson sp
        where c.cust_id = id
        and c.cust_id = s.cust_id
        and p.prod_id = s.prod_id
        and sp.salpers_id = s.salpers_id
    
    cname customer.cust_name%type;
    sdate sale.date%type;
    sname salesperson.salpers_name%type;
    pdesc product.prod_desc%type;
    sqty sale.qty%type;
    stot product.price%type;
    ctot product.price%type;
    counter binary_integer := 0;

    notrans exception;

    begin
        select slpkg.getCustName(cid) from dual into cname;
        dbms_output.put_line('Customer: ' || cname);
        
        dbms_output.put_line('Transactions:');
        open trans_c(cid);
        loop
            fetch trans_c into sdate, sname, pdesc, sqty, stot;
            exit when trans_c%notfound;
            counter := counter + 1;
            dbms_output.put_line('--> [' || sdate '] ' || sqty || ' ' || pdesc || ' from ' || sname || '\tTotal: ' || stot);
        end loop;
        close trans_c
        if counter = 0 then
            raise notrans;
        end if;

        exception
            when notrans then
            dbms_output.put_line('no transactions found');
            when no_data_found then
            dbms_output.put_line('customer id ' || cid || ' not found');
    end;

    end slpkg;
    /