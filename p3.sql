create or replace function f03(acc text, custname text, cprovince text, climit numeric(10))
returns Table(accounts text, cnames text, provinces text, cbalances numeric(10,2), crlimits numeric(10))
language plpgsql as $$

begin
	insert into Customer values (acc, custname, cprovince, 0.00, climit);
	return query
	select rtrim(account), rtrim(cname), rtrim(province), cbalance, crlimit from Customer;
	
end; $$

