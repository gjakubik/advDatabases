-- finds total of a given transaction
declare
  sid sale.sale_id%type := '&id';  -- the ampersand allows the user to input the value
  tot product.price%type;
begin
  tot := slpkg.get_transaction_total(sid);
  if tot is null then
    dbms_output.put_line('Can''t find transaction');
  else
    dbms_output.put_line('The total for transaction' || sid || ' is ' || tot || '$');
  end if;
end;
/