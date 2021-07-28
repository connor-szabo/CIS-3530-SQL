create or replace function f02(Vendorname char(10))
returns Table(cno text, custname text, cprovince text)
language plpgsql as $$

begin
	
	return query
	select rtrim(customer.account), rtrim(customer.cname), rtrim(customer.province) from transactions
	inner join customer on transactions.account = customer.account
	inner join vendor on transactions.vno = vendor.vno
	where vendor.vname = Vendorname;
	
end; $$
