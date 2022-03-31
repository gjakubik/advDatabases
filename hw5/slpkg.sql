create or replace package slpkg
is
  function getTransactionTotal (id sale.sale_id%type)
    return product.price%type;
  function getCustomerTotal (id customer.cust_id%type)
    return product.price%type;
  procedure transactionList (cid customer.cust_id%type);
end salepack;
/
