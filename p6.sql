create or replace function f06()
returns Table(Vendorname text, charged numeric(10,2), balance numeric(10,2))
language plpgsql as $$

declare

begin
	return query
	select rtrim(vname), round(vendor.vbalance * 0.04, 2), round(vbalance - (vbalance * 0.04), 2) from vendor
	group by vname, vbalance;
	update vendor
	set vbalance = round(vbalance - (vbalance * 0.04), 2);
end; $$

