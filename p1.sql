create or replace function f01(Tname char(10))
returns Table(vname text, tdate date, tamount numeric(10,2))
language plpgsql as $$

declare
	Cnum char(5);

begin
	select Account into Cnum from Customer
	where Cname = Tname;
	
	return query
	select rtrim(vendor.vname), t_date, amount from transactions
	inner join vendor on transactions.vno = vendor.vno
	where account = Cnum;
	
end; $$
