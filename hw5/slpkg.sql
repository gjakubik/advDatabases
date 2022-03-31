create or replace package slpkg
is
    function get_transaction_total (id sale.sale_id%type)
        return product.price%type;
    function get_customer_total (id customer.cust_id%type)
        return product.price%type;
    function getcname(id customer.cust_id%type)
        return customer.cust_name%type;
    -- procedure transaction_list (cid customer.cust_id%type);
end slpkg;
/
