create or replace function f07()
returns Table(custname text, newbalance numeric (10,2))
language plpgsql as $$

begin
	
	return query
	select rtrim(cname), round(cbalance + (cbalance - crlimit) * .1, 2)
	from customer
	where cbalance > crlimit;
	update customer
	set cbalance = round(cbalance + (cbalance - crlimit) * .1, 2)
	where cbalance > crlimit;
	
end; $$

