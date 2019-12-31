# AMAZON PRIME

* Video on demand app
* https://www.primevideo.com/

# Feature 1

* Plan details

query:
```sql

create table plans(
plan_id number ,
plan_amount number not null,
plan_duration number not null,
no_of_views number not null,
Discount_amount number,

constraint plan_id_pk primary key plan_id,
constraint plan_amount_cr check(plan_amount>=0),
constraint plan_duration_cr check(plan_duration>=1),
constraint no_of_views_cr check (no_of_views>=1)
);
```

##Feature 2
* User Credentials
 
query:

```sql

create table user_credits(
customer_id number,
customer_name VARCHAR2(80) not null,
gender char(2) not null ,
DOB date not null,
age number not null ,
mail_id varchar2(50)not null,
user_id varchar2(30) not null,
passwords varchar2(30) not null,
mobile_no number not null,
plan_id number not null,

constraint customer_id_pk primary key(customer_id),
constraint gender_ck check(gender in('M','F')),
constraint unique_uq unique(customer_id,use_id,mail_id,mobile_no),
constraint age_ck check(age>=10),
constraint plan_id_fk foreign key (plan_id) references plans(plan_id)
);
```


