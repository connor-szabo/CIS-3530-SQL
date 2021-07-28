create table if not exists vendor(Vno char(5), Vname char(20), City char(20), Vbalance numeric(10,2), primary key(Vno));

create table if not exists customer(Account char(5), Cname char(20), Province char(5), Cbalance numeric(10,2), Crlimit numeric(10), primary key(Account));

create table if not exists transactions(Tno char(5), Vno char(5), Account char(5), T_date DATE, Amount numeric(10,2), primary key(Tno));


insert into vendor values('V1', 'IKEA', 'Toronto', 200.00);
insert into vendor values('V2', 'Walmart', 'Waterloo', 671.05);
insert into vendor values('V3', 'Esso', 'Windsor', 0.00);
insert into vendor values('V4', 'Esso', 'Waterloo', 225.00);

insert into customer values('A1', 'Smith', 'ONT', 2515.00, 2000);
insert into customer values('A2', 'Jones', 'BC', 2014.00, 2500);
insert into customer values('A3', 'Doc', 'ONT', 150.00, 1000);

insert into transactions values('T1', 'V2', 'A1', '2020-07-15', 1325.00);
insert into transactions values('T2', 'V2', 'A3', '2019-12-16', 1900.00);
insert into transactions values('T3', 'V3', 'A1', '2020-09-01', 2500.00);
insert into transactions values('T4', 'V4', 'A2', '2020-03-20', 1613.00);
insert into transactions values('T5', 'V4', 'A3', '2020-07-31', 2212.00);

