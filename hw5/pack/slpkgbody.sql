create or replace package body slpkg
is 
  function getcname(id customer.cust_id%type)
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
      dbms_output.put_line('getcname error: ' || id || ' not found');
      return null;
  end;
  
  function getcid(name customer.cust_name%type)
    return customer.cust_id%type
  is
    id customer.cust_id%type;
  begin
    select cust_id
    into id
    from customer
    where cust_name = name;
    return id;
  exception
    when no_data_found then
      dbms_output.put_line('getcid error: ' || id || ' not found');
      return null;
  end;
  
  function getsid(name salesperson.salpers_name%type)
    return salesperson.salpers_id%type
  is
    id salesperson.salpers_id%type;
  begin
    select salpers_id
    into id
    from salesperson
    where salpers_name = name;
    return id;
  exception
    when no_data_found then
      dbms_output.put_line('getsid error: ' || id || ' not found');
      return null;
  end;

  function totalpertransaction(id sale.prod_id%type, qty sale.qty%type)
    return integer
  is
    price integer;
    total integer;
  begin
    select price
    into price
    from product
    where product.prod_id = id;
    total := price*qty;
    return total;
  exception
    when no_data_found then
      dbms_output.put_line('totalpertransaction error: ' || id || ' not found');
  end;

  function totalpertransaction(id sale.sale_id%type)
    return integer
  is
    tot integer;
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

  function getcustomertotal(id customer.cust_id%type)
    return integer
  is
    tot integer;
  begin
    select sum(sale.qty * product.price) 
    into tot
    from sale, product
    where sale.cust_id = id
    and sale.prod_id = product.prod_id;
  exception
    when no_data_found then
      dbms_output.put_line('getCustomerTotal error: ' || id || ' not found');
      return null;
  end;

  function totalprofitpertransaction(id sale.prod_id%type, qty sale.qty%type)
    return integer
  is
    price integer;
    cost integer;
    total integer;
  begin
    select cost, price
    into cost, price
    from product
    where product.prod_id = id;
    total := (price - cost) * qty;
    return total;
  exception
    when no_data_found then
      dbms_output.put_line('totalprofitpertransaction error: ' || id || ' not found');
  end;

  function getpname(id sale.prod_id%type)
    return product.prod_desc%type
  is
    name product.prod_desc%type;
  begin
    select prod_desc
    into name
    from product
    where prod_id = id;
    return name;
  exception
    when no_data_found then
      dbms_output.put_line('getpname error: ' || id || ' not found');
  end;
end;
/
