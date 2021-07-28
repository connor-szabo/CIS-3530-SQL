create or replace function f05()
returns Table(vnum text, vendorname text, balance numeric(10,2))
language plpgsql as $$

begin
return query
	select rtrim(vendor.vno), rtrim(vendor.vname), sum(transactions.amount) + vendor.vbalance from transactions
	inner join vendor on transactions.vno = vendor.vno
	group by vendor.vno
	order by vendor.vno;
	
end; $$

