create or replace package slpkg
is
  function getcname(id customer.cust_id%type)
    return customer.cust_name%type;
  function getcid(name customer.cust_name%type)
    return customer.cust_id%type;
  function getsid(name salesperson.salpers_name%type)
    return salesperson.salpers_id%type;
  function totalpertransaction(id sale.prod_id%type, qty sale.qty%type)
    return integer;
  function totalpertransaction(id sale.sale_id%type)
    return integer;
  function getcustomertotal (id customer.cust_id%type)
    return integer;
  function totalprofitpertransaction(id sale.prod_id%type, qty sale.qty%type)
    return integer;
  function getpname(id sale.prod_id%type)
    return product.prod_desc%type;
end slpkg;
/
