create database clg;
use clg;

create table client_master(
clientno varchar(6) primary key,
name varchar(20) not null,
city varchar(15),
pincode int(8),
state varchar(15),
baldue decimal(10,2)
);

create table product_master(
productno varchar(6) primary key,
description varchar(15) not null,
profitpercent decimal(4,2) not null,
unitmeasure varchar(10) not null,
qtyonhand int not null,
recordervl int not null,
sellprice decimal(8,2) not null check(sellprice != 0),
costprice decimal(8,2) not null check(costprice != 0)
);

create table salesman_master(
salesmanno varchar(6) primary key,
salesmanname varchar(15) not null,
address varchar(30) not null,
city varchar(10),
pincode int,
state varchar(15) ,
sale_amt decimal(8,2) not null check(sale_amt != 0),
tgttoget decimal(6,2) not null check(tgttoget != 0),
ytdsales decimal(6,2) not null
);

create table sales_order(
orderno varchar(6) primary key,
clientno varchar(6) ,
orderdate date not null,
salesmanno varchar(6),
delytype char(1),
delydate date,
orderstatus varchar(10) check (orderstatus in ('in Process', 'Fulfilled', 'Backorder', 'Cancelled')),
foreign key(clientno) references client_master(clientno),
foreign key(salesmanno) references salesman_master(salesmanno)
);
select * from sales_order;

create table sales_order_details(
orderno varchar(6),
productno varchar(6) ,
qtyordered int,
qtydisp int,
productrate decimal(10,2),
foreign key(orderno) references sales_order(orderno),
foreign key(productno) references product_master(productno)
);

insert into client_master values
('C00001' ,'Korth sudarshan', 'Mumbai', 400054 ,'Maharashtra', 15000),
('C00002', 'Mamta Muzumdar', 'Madras', 780001, 'Tamil Nadu', 0),
('C00003', 'Chhaya Bankar', 'Mumbai', 400057, 'Maharashtra', 5000),
('C00004' ,'Ashwini Joshi' ,'Bangalore', 560001, 'Karnataka', 0),
('C00005' ,'Hansel Colaco', 'Mumbai', 400060, 'Maharashtra', 2000),
('C00006' , 'Deepak Sharma',  'Mangalore',  560050 ,'Karnataka', 0);

insert into product_master values
('P00001' , 'T-Shirts', 5, 'Piece', 200, 50, 350, 250),
('P0345' ,'Shirts' ,6, 'Piece' ,150, 50 ,500 ,350),
('P06734' , 'Cotton jeans',  5, 'Piece', 100, 20, 600 ,450), 
('P07865', 'Jeans', 5, 'Piece',  100, 20, 750, 500), 
('P07868', 'Trousers', 2 ,'Piece', 150, 50 ,850, 550), 
('P07885',  'Pull Overs',  2.5,  'Piece',  80,  30, 700, 450), 
('P07965',  'Denim Shirts',  4 , 'Piece', 100, 4 ,350, 250),
('P07975' , 'Lycra Tops',  5,  'Piece',  70 , 30, 300, 175),
('P08865',  'Skirts',  5 , 'Piece',  75, 30, 450, 300);

insert into salesman_master values 
('S00001', 'Aman',  'A/14 Worli','Mumbai' , 400002, 'Maharashtra', 3000 ,1000, 50),
('S00002', 'Omkar',  'C-65 Narima',  'Mumbai',  400001 ,'Maharashtra',  3000, 2000, 100),
('S00003',  'Ray',  'P-7 Bandra',  'Mumbai',  400032 ,'Maharashtra',  3000 ,2000, 100),
('S00004',  'Ashishh',  'A/5 Juhu',  'Mumbai',  400044, 'Maharashtra', 3500, 2000, 150);

insert into sales_order values
('O19001' ,'C00001',  '2004-06-12',  'S00001', 'F' , '2004-07-20',  'In Process'),
('O19002' , 'C00002',  '2004-06-25',  'S00002',  'P',  '2004-06-27',  'Cancelled'),
('O46865' , 'C00003' ,'2004-02-18' ,'S00003' ,'F' ,'2004-02-20' ,'Fulfilled'),
('O19003' ,'C00001', '2004-04-03' ,'S00001' ,'F' ,'2004-04-07' ,'Fulfilled'),
('O46866', 'C00004',  '2004-05-20',  'S00002',  'P',  '2004-05-22',  'Cancelled'),
('O19008','C00005' , '2004-05-24' ,'S00004' ,'F' ,'2004-07-26' ,'In Process');

insert into sales_order_details values 
('O19001' ,'P00001' ,4 ,4 ,250),
('O19001', 'P07965', 2, 1 ,250),
('O19001', 'P07885', 2 ,1 ,450),
('O19002', 'P00001', 10, 5 ,250),
('O46865', 'P07868', 3 ,3 ,550),
('O46865', 'P07885', 3 ,3 ,450),
('O46865', 'P00001', 10, 10, 250),
('O46865', 'P0345', 4 ,4 ,350),
('O19003', 'P0345', 2 ,2 ,350),
('O19003', 'P06734', 1 ,1 ,450),
('O46866', 'P07965', 1 ,0 ,250),
('O46866', 'P07975', 1 ,0 ,175),
('O19008', 'P00001', 8 ,6 ,250),
('O19008', 'P07975', 5 ,4, 175);