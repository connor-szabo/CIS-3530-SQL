create or replace function f04()
returns Table(acc text, cname text, camount numeric(10,2), vendorName text)
language plpgsql as $$

begin
	
	return query
	select rtrim(customer.account), rtrim(customer.cname), transactions.amount, rtrim(vendor.vname) from customer
	left join transactions on customer.account = transactions.account
	inner join vendor on transactions.vno = vendor.vno
	inner join(Select transactions.account, max(t_date) as maxdate from transactions group by account)tm on transactions.account = tm.account and transactions.t_date = tm.MaxDate
	where tno <> '';
		
end; $$

