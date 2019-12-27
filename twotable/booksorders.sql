drop table books;
drop table orders;
create table books(
book_id number,
book_name varchar2(150) not null,
author_name varchar2(150) not null,
prize number not null,
publisher varchar2(150) not null,
version number,
book_category varchar2(50) not null,
status number not null,
constraint book_id_pk primary key(book_id),
constraint prize_cq check (prize>=0),
constraint status_cq check (status in (0,1)),
constraint book_name_uq unique(book_name,author_name,version)
);

create table orders(
order_id number,
username varchar2(50) not null,
books_id number not null,
ordered_date timestamp,
delivered_date timestamp,
total_amount number not null,
quantity number not null,
status varchar2(30) not null,
comment_details varchar2(1000),
constraint order_id_pk primary key(order_id),
constraint uniq_uq unique (username,books_id,ordered_date),
constraint total_amount_cq check (total_amount>=0),
constraint quantity_cq check (quantity>=1),
constraint bookss_id_fk foreign key(books_id) references books(book_id));
constraint statuss_cq check (status in ('Ordered','Shipping','Delivered','Cancelled'))
);

insert into books(book_id,book_name,author_name,prize,publisher,version,book_category,status)
values(121,'Harry Potter The philospher stone','J.K.R',400,'W.B',2,'Fantacy',1);
insert into books(book_id,book_name,author_name,prize,publisher,version,book_category,status)
values(122,'Harry Potter The Chamber of Secrets','J.K.R',400,'W.B',4,'Fantacy',1);
insert into books(book_id,book_name,author_name,prize,publisher,version,book_category,status)
values(123,'Harry Potter The Deadly Hollows','J.K.R',450,'W.B',1,'Fantacy',1);
insert into books(book_id,book_name,author_name,prize,publisher,book_category,status)
values(161,'Two States','Karan Sharma',400,'Indian stores','Romance',1);

insert into books(book_id,book_name,author_name,prize,publisher,version,book_category,status)
values(345,'Electrical Machines','J.P.GUPTA',1000,'KANNA PUBLICATION',1,'technical',1);

insert into books(book_id,book_name,author_name,prize,publisher,version,book_category,status)
values(789,'Power System','John J.gringer',550,'Mc.Graw Hill publication',2,'technical',1);

insert into books(book_id,book_name,author_name,prize,publisher,version,book_category,status)
values(234,'Power Electronics','Ned Mohan',800,'Mc.Graw Hill publication',3,'technical',0);

insert into books(book_id,book_name,author_name,prize,publisher,version,book_category,status)
values(321,'Think fast and slow','games',340,'princeton',2,'psychological',1);

insert into books(book_id,book_name,author_name,prize,publisher,version,book_category,status)
values(786,'Power system protection','badri nath',770,'texmo publication',1,'technical',0);

insert into orders(order_id,username,books_id,ordered_date,delivered_date,total_amount,quantity,status)
values(1234,'karthik',321,to_date('23-12-2019','DD-MM-YYYY'),to_date('29-12-2019','DD-MM-YYYY'),550,1,'Ordered');
insert into orders(order_id,username,books_id,ordered_date,delivered_date,total_amount,quantity,status)
values(1235,'kailaash',121,to_date('21-12-2019','DD-MM-YYYY'),to_date('29-12-2019','DD-MM-YYYY'),950,3,'Shipped');
insert into orders(order_id,username,books_id,ordered_date,delivered_date,total_amount,quantity,status)
values(1236,'Rudra',122,to_date('3-12-2019','DD-MM-YYYY'),to_date('9-12-2019','DD-MM-YYYY'),500,2,'Delivered');
insert into orders(order_id,username,books_id,ordered_date,delivered_date,total_amount,quantity,status)
values(1237,'Bahubali',123,to_date('2-12-2019','DD-MM-YYYY'),to_date('9-12-2019','DD-MM-YYYY'),100,1,'Cancelled');
insert into orders(order_id,username,books_id,ordered_date,delivered_date,total_amount,quantity,status)
values(1238,'Rana',161,to_date('23-1-2020','DD-MM-YYYY'),to_date('9-2-2020','DD-MM-YYYY'),200,1,'Ordered');
select * from books;
select * from orders;
select * from orders where Status = 'Ordered';
update orders set comment_details = 'not a valied address', Status = 'Cancelled'where order_id= 1234;

insert into books(book_id,book_name,author_name,prize,publisher,version,book_category,status)
values(786,'Power system protection','badri nath',770,'texmo publication',1,'technical',0);

insert into orders(order_id,username,books_id,ordered_date,delivered_date,total_amount,quantity,status)
values(1234,'karthik',321,to_date('23-12-2019','DD-MM-YYYY'),to_date('29-12-2019','DD-MM-YYYY'),550,1,'Ordered');
insert into orders(order_id,username,books_id,ordered_date,delivered_date,total_amount,quantity,status)
values(1235,'kailaash',121,to_date('21-12-2019','DD-MM-YYYY'),to_date('29-12-2019','DD-MM-YYYY'),950,3,'Shipped');
insert into orders(order_id,username,books_id,ordered_date,delivered_date,total_amount,quantity,status)
values(1236,'Rudra',122,to_date('3-12-2019','DD-MM-YYYY'),to_date('9-12-2019','DD-MM-YYYY'),500,2,'Delivered');
insert into orders(order_id,username,books_id,ordered_date,delivered_date,total_amount,quantity,status)
values(1237,'Bahubali',123,to_date('2-12-2019','DD-MM-YYYY'),to_date('9-12-2019','DD-MM-YYYY'),100,1,'Cancelled');
insert into orders(order_id,username,books_id,ordered_date,delivered_date,total_amount,quantity,status)
values(1238,'Rana',161,to_date('23-1-2020','DD-MM-YYYY'),to_date('9-2-2020','DD-MM-YYYY'),200,1,'Ordered');
select * from books;
select * from orders;
select * from orders where Status = 'Ordered';
update orders set comment_details = 'not a valied address', Status = 'Cancelled'where order_id= 1234;
