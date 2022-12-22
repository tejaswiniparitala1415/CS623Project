create database Project;
\c Project;

/* Creating 3-Tables with all keys and attribute.*/

create table Product(prod varchar(50) not null primary key, pname varchar(50), price varchar(50));
create table Depot(dep varchar(50) not null primary key, addr varchar(50), volume varchar(50));
create table Stock( prod varchar(50), dep varchar(50), quantity varchar(50), foreign key(dep) references Depot(dep) on delete cascade on update cascade, foreign key(prod) references Product(prod) on delete cascade on update cascade);

select * from product;
select * from depot;
select * from stock;

/*entering data in product table.*/

insert into Product values('p1','tape','2.5');
insert into Product values('p2','tv','250');
insert into Product values('p3','vcr','80');

select * from product;

/* entering data in depot table.*/

insert into Depot values('d1','New York','9000');
insert into Depot values('d2','Syracuse','6000');
insert into Depot values('d4','New York','2000');

select * from depot;

/* entering data in stock table.*/ 

insert into Stock values('p1','d1','1000');
insert into Stock values('p1','d2','-100');
insert into Stock values('p1','d4','1200');
insert into Stock values('p3','d1','3000');
insert into Stock values('p3','d4','2000');
insert into Stock values('p2','d4','1500');
insert into Stock values('p2','d1','-400');
insert into Stock values('p2','d2','2000');

select * from stock;

/*first transaction, We add a depot (d100, Chicago, 100) in Depot and (p1, d100, 100) in Stock.*/ 
begin;
insert into depot values('d100','Chicago','100');
insert into Stock values('p1','d100','100');
commit;
select * from depot;
select * from stock;

/*transaction, The depot d1 changes its name to dd1 in Depot and Stock.*/
begin;
update depot set dep = 'dd1' where dep = 'd1';
commit;
select * from depot;
select * from stock;

/* Third transaction, The depot d1 is deleted from Depot and Stock.*/
begin;
delete from depot where dep = 'd1';
COMMIT;
select * from depot;
select * from stock;

/*fourth transaction, The product p1 changes its name to pp1 in Product and Stock.*/
begin;
update product set prod = 'pp1' where prod = 'p1';
commit;
select * from product;
select * from stock;

/*fifth transaction, We add a product (p100, cd, 5) in Product and (p100, d2, 50) in Stock.*/
begin;
insert into Product values('p100','cd','5');
insert into Stock values('p100','d2','50');
commit;
select * from product;
select * from stock;
