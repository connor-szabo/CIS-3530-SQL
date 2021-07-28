create or replace function f08(venNum char(5), accountnum char(5), tamount numeric (10,2))
returns void
language plpgsql as $$

declare
trans char(5);
newTransNum int;
newTrans char(5);

d_time date;

ventest char(5);
acctest char(5);

begin
	select current_date into d_time;
	
	select max(tno) from transactions into trans;
	select cast(right(trans, -1) as int) into newTransNum;
	newTransNum = newTransNum + 1;
	select concat('T', cast(newTransNum as char(4))) into newTrans;
	
	select vno from vendor where vno = vennum into ventest;
	if found then 
		select account from customer where account = accountnum into acctest;
		if found then
				insert into transactions values (newTrans, venNum, accountNum, d_time, tamount);

		end if;
	
	end if;
	
	update customer
		set cbalance = cbalance + tamount
	where account = accountNum;
	
	update vendor
		set vbalance = vbalance + tamount
	where vno = vennum;
	
end; $$

