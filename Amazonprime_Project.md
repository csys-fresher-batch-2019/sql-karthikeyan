# AMAZON PRIME

* Video on demand app
* https://www.primevideo.com/

# Feature 1

* Plan details

```sql

create table plans(
plan_id number ,
plan_amount number not null,
plan_duration number not null,
no_of_screens number not null,
Discount_amount number,

constraint plan_id_pk primary key plan_id,
constraint plan_amount_cr check(plan_amount>=0),
constraint plan_duration_cr check(plan_duration>=1),
constraint no_of_screens_cr check (no_of_views>=1)
);

```
query:
```sql
select * from plans;
```

# Feature 2

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

query:
```sql
select * from user credits;
```
# Feature 3

* Categorys

```sql
create table categorys(
category_id number not null,
category_name varchar2(10) not null,
total_no_of_upload number not null,
last_upload date,

constraint category_id_pk primary key(category_id),
constraint category_name_ck check(category_name in ('TVshow','Movie','Kids')),
--constraint total_ck check(total_no_of_upload >=0,last_upload>= sysdate)
);
```
query:
```sql
select * from categorys;
```
# Feature 4

* prime releases

```sql
create table prime_releases(
prime_id number,
categorys_id number not null,
name_of_video varchar(30) not null,
genre varchar2(20) not null,
season number,
total_episodes number,
languages varchar2(50) not null,
subtitle_languages varchar2(50),
director varchar2(30),
release_date date,
prime_release_date date not null,
box_office_collection number,
casting varchar2(100),
description_of_video varchar2(300),

constraint prime_id_pk primary key(prime_id),
constraint category_id_fk foreign key (category_id) refernces categorys(category_id),
constraint genre_ck check (genre in ('Short','Drama','Comedy','Documentary','Animation','Thriller','Horror','Romance','Fantasy','Family','Sci-Fi','Action','Music','Mystery','Crime','Adventure','Biography','History','Western','Musical','Sport','War','News','TalkShow','GameShow')), 
constraint languages_ck check (languages in ('English','Tamil','Hindi','Telungu','Malayalam','kannadam','Bengali','chinese','spanish')),
constraint subtitle_languages_ck check (subtitle_languages in ('English','Tamil','Hindi','Telungu','Malayalam','kannadam','Bengali','chinese','spanish')),
--constraint release_date_ck check(release_date <= SYSDATE ,prime_release_date <= SYSDATE ),
constraint check_ck check(box_office_collection>=0,season >= 0,episodes >= 0)
);

```
query:

```sql
select * from prime releases;
```



