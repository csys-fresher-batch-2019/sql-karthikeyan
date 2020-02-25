# online entertainment video on demand application



```SQL
drop table plans;
drop table watch_list;
drop table prime_releases;
drop table categorys;
drop table user_credits;
drop sequence user_id_seq;
drop sequence prime_id_seq;


--amazon_prime plans 
drop table plans;
```
# feature 
```sql

create table plans(
plan_id number ,
plan_amount number not null,
plan_duration number not null,
no_of_screens number not null,
discount_amount number default 0,

constraint plan_id_uqi primary key (plan_id),
constraint plan_amount_cr check(plan_amount>=0),
constraint plan_duration_cr check(plan_duration>=30),
constraint no_of_screens_cr check (no_of_screens>=1)
);

insert into plans(plan_id,plan_amount,plan_duration,no_of_screens) values (121,199,30,1);
insert into plans(plan_id,plan_amount,plan_duration,no_of_screens) values (122,299,30,2);
insert into plans(plan_id,plan_amount,plan_duration,no_of_screens) values (123,399,90,1);
insert into plans(plan_id,plan_amount,plan_duration,no_of_screens) values (124,599,90,2);
insert into plans(plan_id,plan_amount,plan_duration,no_of_screens) values (125,999,180,1);
insert into plans(plan_id,plan_amount,plan_duration,no_of_screens) values (126,1299,180,3);
insert into plans(plan_id,plan_amount,plan_duration,no_of_screens) values (127,1599,270,1);
insert into plans(plan_id,plan_amount,plan_duration,no_of_screens) values (128,1999,365,1);

--display all the plans available for customers
select * from plans;--table1

   PLAN_ID PLAN_AMOUNT PLAN_DURATION NO_OF_SCREENS DISCOUNT_AMOUNT
---------- ----------- ------------- ------------- ---------------
       121         199            30             1               0
       122         299            30             2               0
       123         399            90             1               0
       124         599            90             2               0
       125         999           180             1               0
       126        1299           180             3               0
       127        1599           270             1               0
       128        1999           365             1               0

```

# feature 
```sql

--user credientials creation
drop table user_credits;

create table user_credits
(
customer_name VARCHAR2(80) not null,
gender char(2) not null ,
DOB date not null,
age number not null ,
mail_id varchar2(50)not null,
user_id number,
passwords varchar2(30) not null,
mobile_no number not null,
created_date  timestamp default systimestamp,


constraint user_id_pfg primary key(user_id),
constraint gender_cak check(gender in('M','F')),
--constraint unique_uqq unique(user_id,mobile_no),
constraint age_cuk check(age >= 10),
constraint mobile_cdfk check (length(mobile_no)=10)
);
drop sequence user_id_seq;

CREATE SEQUENCE user_id_seq START WITH 12346811 INCREMENT BY 1;

insert into user_credits (customer_name,gender,DOB,age,mail_id,user_id,passwords,mobile_no) values('Rathnakumar','M',to_date('01-07-1989','dd-MM-yyyy'),31,'rathnakumar@gmail.com',user_id_seq.nextval,'asaodhasjdks',806342345);
insert into user_credits (customer_name,gender,DOB,age,mail_id,user_id,passwords,mobile_no) values('Arjunkumar','M',to_date('01-09-1999','dd-MM-yyyy'),22,'arjunkumar@gmail.com',user_id_seq.nextval,'saodha23sjdks',9643423456);
insert into user_credits (customer_name,gender,DOB,age,mail_id,user_id,passwords,mobile_no) values('Ramkumar','M',to_date('04-07-2000','dd-MM-yyyy'),21,'ramkumar@gmail.com',user_id_seq.nextval,'23saodhasjwedks',9673423456);
insert into user_credits (customer_name,gender,DOB,age,mail_id,user_id,passwords,mobile_no) values('Akshykumar','M',to_date('29-01-1997','dd-MM-yyyy'),24,'akshykumar@gmail.com',user_id_seq.nextval,'saodhasjdks',6893423456);
insert into user_credits (customer_name,gender,DOB,age,mail_id,user_id,passwords,mobile_no) values('Anadhan','M',to_date('01-01-1992','dd-MM-yyyy'),27,'anadhan@gmail.com',user_id_seq.nextval,'saodherrfdks',7887123456);



select * from user_credits;
```

# feature 
```sql
--categorys in amazon prime
drop table categorys;

create table categorys(
category_id number,
category_name varchar2(10) not null,


constraint category_id_pk primary key(category_id),
constraint category_name_ck check(category_name in ('TVShows','Movies','Kids')),
constraint category_un unique(category_id,category_name)
);
insert into categorys (category_id,category_name) values (1,'TVShows');
insert into categorys (category_id,category_name) values (2,'Movies');
insert into categorys (category_id,category_name) values (3,'Kids');

--displays all the categorys of  videos the viewers need
select * from categorys;--table6
CATEGORY_ID CATEGORY_N
----------- ----------
          1 TVShows   
          2 Movies    
          3 Kids   
```
# feature 
```sql
--videos releases or add by the amazon prime company to customers
drop table prime_releases;

create table prime_releases(
prime_id number,
category_id number not null,
name_of_video varchar2(30) not null,
genre varchar2(20) not null,
season number default 0,
total_episodes number default 0,
audio_languages varchar2(50) not null,
subtitle_languages varchar2(50),
director varchar2(30),
release_date date,
prime_release_date date not null,
box_office_collection_millions number,
casting varchar2(100),
description_of_video varchar2(300),

constraint prime_id_pk primary key(prime_id),
constraint category_id_fk foreign key (category_id) references categorys(category_id),
constraint genre_ck check (genre in ('Short','Drama','Comedy','Documentary','Animation','Thriller','Horror','Romance','Fantasy','Family','Sci-Fi','Action','Music','Mystery','Crime','Adventure','Biography','History','Western','Musical','Sport','War','News','TalkShow','GameShow')), 
constraint languages_ck check (audio_languages in ('English','Tamil','Hindi','Telungu','Malayalam','kannadam','Bengali','chinese','spanish')),
constraint subtitle_languages_ck check (subtitle_languages in ('English','Tamil','Hindi','Telungu','Malayalam','kannadam','Bengali','chinese','spanish')),
constraint prime_id_ujz unique (prime_id,name_of_video)
--constraint release_date_ck check(release_date <= SYSDATE ,prime_release_date <= SYSDATE )
);

drop sequence prime_id_seq;

CREATE SEQUENCE prime_id_seq START WITH 12321 INCREMENT BY 1;



insert into prime_releases (prime_id,category_id,name_of_video,genre,audio_languages,subtitle_languages,director,release_date,prime_release_date,box_office_collection_millions,casting,description_of_video) 
values (prime_id_seq.nextval,2,'Avengers endgame','Fantasy','English','English','Russo Brothers',to_date('01-04-2019','dd-MM-YYYY'),to_date('01-11-2019','dd-MM-YYYY'),2789,'Robert Downy JR','Marvel studios biggest movie of the era');
insert into prime_releases (prime_id,category_id,name_of_video,genre,audio_languages,subtitle_languages,director,release_date,prime_release_date,box_office_collection_millions,casting,description_of_video) 
values (prime_id_seq.nextval,2,'Avengers Civil War','Fantasy','English','English','Russo Brothers',to_date('27-04-2016','dd-MM-YYYY'),to_date('07-10-2017','dd-MM-YYYY'),1239,'Robert Downy JR','Fight between a two group of super hero who possess a wonderfull power');
insert into prime_releases (prime_id,category_id,name_of_video,genre,audio_languages,subtitle_languages,director,release_date,prime_release_date,box_office_collection_millions,casting,description_of_video) 
values (prime_id_seq.nextval,2,'Mr.Bean','Comedy','English','English','Emmanuvel',to_date('12-09-1998','dd-MM-YYYY'),to_date('3-3-2012','dd-MM-YYYY'),60,'Rowen atkinson','A life a lonely man who enjoys every second of his single person life');
insert into prime_releases (prime_id,category_id,name_of_video,genre,season,total_episodes,audio_languages,subtitle_languages,director,release_date,prime_release_date,box_office_collection_millions,casting,description_of_video) 
values (prime_id_seq.nextval,1,'Stranger things 2','Fantasy',2,8,'English','English','A.R.Murugadoss',to_date('04-09-2018','dd-MM-YYYY'),to_date('04-09-2018','dd-MM-YYYY'),500,'MIlly bobby brown','Group of 4 boys and 2 girls at there teenage who got stuck in danger with one gal who possess a uncontrollable powers');
insert into prime_releases (prime_id,category_id,name_of_video,genre,season,total_episodes,audio_languages,subtitle_languages,director,release_date,prime_release_date,box_office_collection_millions,casting,description_of_video) 
values (prime_id_seq.nextval,1,'The Flash','Sci-Fi',3,24,'English','English','hectorplus',to_date('01-04-2014','dd-MM-YYYY'),to_date('01-11-2015','dd-MM-YYYY'),345,'Flash','A man who is the fastest person in the world Barry alan the flash');

-- display all the videos added by the company
select * from prime_releases;--table7
```
# feature 
```sql

-- increase the viewers count and to reduce the time loss for searching of good movies we add imdb rating
alter table prime_releases add imdb_rating number;

update prime_releases set imdb_rating = 10 where prime_id = 12321;
update prime_releases set imdb_rating = 2 where prime_id = 12322;
update prime_releases set imdb_rating = 8 where prime_id = 12323;
update prime_releases set imdb_rating = 4 where prime_id = 12324;
update prime_releases set imdb_rating = 9 where prime_id = 12325;
```
# feature 
```sql

--to watch the movies accourding to the languages
select * from prime_releases where audio_languages = 'English' order by imdb_rating desc ; 
```
# feature 
```sql

--to watch the movies according to there genre
select * from prime_releases where genre = 'Fantasy' order by imdb_rating desc;
```
# feature 
```sql

-- to watch the new releases movies in the world
select * from prime_releases order by release_date desc;
```
# feature 
```sql

-- to watch the new releases movies in the amazon_prime
select * from prime_releases order by prime_release_date desc;
```
# feature 
```sql

--to watch the movies according to the imdb rating
select * from prime_releases order by imdb_rating desc;
```
# feature 
```sql

--to join the category table to  find the category name and category id
select * from categorys c join prime_releases p on c.category_id=p.category_id;
```
# feature 
```sql

-- to display the movies watched by the customers 
drop table watch_lists;

create table watch_lists(
mail_id varchar2(50) not null,
prime_id number not null,
watched number default 0,
watch_later number default 0,
watch_later_date TIMESTAMP,
likes number default 0,
dislikes number default 0,
viewer_rating number default 0,

constraint mail_id_fkjg foreign key (mail_id) references user_credits(mail_id),
constraint prime_id_fdkg foreign key (prime_id) references prime_releases(prime_id),
constraint watch_later_chk check(watch_later in(0,1)),
constraint likes_cak check(likes in(0,1)),
constraint dislikes_cak check(dislikes in(0,1)),
constraint com_uniq unique(mail_id,prime_id),
constraint viewer_rating_cdk check(viewer_rating between 0 and 10));



# feature 
```sql
create or replace PROCEDURE INCREMENT_WATCHED_BY_ONE 
(
  I_EMAIL_ID IN VARCHAR2 , 
  I_PRIME_ID IN NUMBER,
  I_DECIDE IN NUMBER) AS
--v_temp number;
BEGIN
--V_temp := WATCHED_BY_ONE_AFTER(I_EMAIL_ID,I_PRIME_ID);
IF I_DECIDE = 1 then
        update watch_lists set watched = watched + 1 ,watch_later = 0 where mail_id = I_EMAIL_ID and prime_id = I_PRIME_ID;
ELSE
        update watch_lists set watch_later = 1 , watch_later_date = SYSTIMESTAMP where mail_id = I_EMAIL_ID and prime_id = I_PRIME_ID;
 end if;
 
COMMIT;
END INCREMENT_WATCHED_BY_ONE;
 ```


```
