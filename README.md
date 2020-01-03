# online entertainment video on demand application
## AMAZON PRIME
```SQL
drop table plans;
drop table payment_details;
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
#feature 
```sql
select * from plans where plan_duration >=90;

   PLAN_ID PLAN_AMOUNT PLAN_DURATION NO_OF_SCREENS DISCOUNT_AMOUNT
---------- ----------- ------------- ------------- ---------------
       123         399            90             1               0
       124         599            90             2               0
       125         999           180             1               0
       126        1299           180             3               0
       127        1599           270             1               0
       128        1999           365             1               0
```
# feature 
```sql
select * from plans where plan_amount<=500;


   PLAN_ID PLAN_AMOUNT PLAN_DURATION NO_OF_SCREENS DISCOUNT_AMOUNT
---------- ----------- ------------- ------------- ---------------
       121         199            30             1               0
       122         299            30             2               0
       123         399            90             1               0
```
select * from plans where plan_duration = 180 and plan_amount <=1000;

   PLAN_ID PLAN_AMOUNT PLAN_DURATION NO_OF_SCREENS DISCOUNT_AMOUNT
---------- ----------- ------------- ------------- ---------------
       125         999           180             1               0

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
insert into user_credits(customer_name,gender,DOB,age,mail_id,user_id,passwords,mobile_no) values ('yogesh','M',to_date('01-01-1992','dd-MM-yyyy'),27,'yogesh@gmail.com',user_id_seq.nextval,'asaodhasjdks',8023423456);
insert into user_credits(customer_name,gender,DOB,age,mail_id,user_id,passwords,mobile_no) values ('Arunkumar','M',to_date('01-01-1992','dd-MM-yyyy'),27,'arunkumar@gmail.com',user_id_seq.nextval,'saodha23sjdks',9643343456);
insert into user_credits(customer_name,gender,DOB,age,mail_id,user_id,passwords,mobile_no) values ('kumar','M',to_date('01-01-1992','dd-MM-yyyy'),27,'ramkumar@gmail.com',user_id_seq.nextval,'23saodhasjwedks',9673423456);
insert into user_credits(customer_name,gender,DOB,age,mail_id,user_id,passwords,mobile_no) values ('vignesh','M',to_date('01-01-1992','dd-MM-yyyy'),27,'vignesh@gmail.com',user_id_seq.nextval,'saodhasjdks',6828423456);
insert into user_credits(customer_name,gender,DOB,age,mail_id,user_id,passwords,mobile_no) values ('Anadhakumar','M',to_date('01-01-1992','dd-MM-yyyy'),27,'anadhakumar@gmail.com',user_id_seq.nextval,'saodherrfdks',7889233456);

--display all the applied users--table2
select * from user_credits;

select * from user_credits where age<=25;


-- to store the payments details provied by the customers to recharge wallet
drop table payment_details;

create table payment_details(
user_id number not null,
passwords varchar2(20) not null,
card_category varchar2(20) not null,
name_on_card varchar2(50) not null,
card_no number not null,
date_of_expire varchar2(20) not null,

--constraint wallet_id_us unique (wallet_id,user_id),
constraint user_id_us foreign key (user_id) references user_credits(user_id),
constraint card_category_ck check (card_category in ('master card','visa','rupay')),
constraint card_no_ch check (length(card_no)=16)
);


insert into payment_details (user_id,passwords,card_category,name_on_card,card_no,date_of_expire)
values (12346812,'asaodhasjdks','visa','Rathnakumar',1234567812345678,'3-2023');


-- to display all the persons who saved their payment details to amazon account
select * from payment_details;--table4
   USER_ID PASSWORDS            CARD_CATEGORY        NAME_ON_CARD                                          CARD_NO DATE_OF_EXPIRE      
---------- -------------------- -------------------- -------------------------------------------------- ---------- --------------------
  12346812 asaodhasjdks         visa                 Rathnakumar                                        1.2346E+15 3-2023              

select * from payment_details where card_category='visa';
   USER_ID PASSWORDS            CARD_CATEGORY        NAME_ON_CARD                                          CARD_NO DATE_OF_EXPIRE      
---------- -------------------- -------------------- -------------------------------------------------- ---------- --------------------
  12346812 asaodhasjdks         visa                 Rathnakumar                                        1.2346E+15 3-2023              


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

--prime_id created by the computer for each videos added automatically using sequence

-- display all the videos added by the company
select * from prime_releases;--table7

-- increase the viewers count and to reduce the time loss for searching of good movies we add imdb rating
alter table prime_releases add imdb_rating number;

update prime_releases set imdb_rating = 10 where prime_id = 12321;
update prime_releases set imdb_rating = 2 where prime_id = 12322;
update prime_releases set imdb_rating = 8 where prime_id = 12323;
update prime_releases set imdb_rating = 4 where prime_id = 12324;
update prime_releases set imdb_rating = 9 where prime_id = 12325;

--to watch the movies accourding to the languages
select * from prime_releases where audio_languages = 'English' order by imdb_rating desc ; 

--to watch the movies according to there genre
select * from prime_releases where genre = 'Fantasy' order by imdb_rating desc;

-- to watch the new releases movies in the world
select * from prime_releases order by release_date desc;

-- to watch the new releases movies in the amazon_prime
select * from prime_releases order by prime_release_date desc;

--to watch the movies according to the imdb rating
select * from prime_releases order by imdb_rating desc;

--to join the category table to  find the category name and category id
select * from categorys c join prime_releases p on c.category_id=p.category_id;

-- to display the movies watched by the customers 
drop table watch_lists;

create table watch_lists(
user_id number not null,
prime_id number not null,
status varchar2(20) default 'watching',
likes number default 0,
started_on timestamp,
viewer_rating number,

constraint user_id_fkjg foreign key (user_id) references user_credits(user_id),
constraint prime_id_fdkg foreign key (prime_id) references prime_releases(prime_id),
constraint status_csk check(status in('watching','completed')),
constraint likes_cak check(likes in(-1,0,1)),
constraint viewer_rating_cdk check(viewer_rating between 0 and 9));

insert into watch_lists(user_id,prime_id,status,likes,started_on,viewer_rating) values (12346812,12321,'completed',1,to_date('01-01-2020','dd-MM-yyyy'),9);
insert into watch_lists(user_id,prime_id,status,likes,started_on,viewer_rating) values (12346813,12321,'completed',1,to_date('01-01-2020','dd-MM-yyyy'),10);
insert into watch_lists(user_id,prime_id,status,likes,started_on,viewer_rating) values (12346815,12324,'completed',1,to_date('01-01-2020','dd-MM-yyyy'),6);
insert into watch_lists(user_id,prime_id,status,likes,started_on,viewer_rating) values (12346812,12325,'completed',1,to_date('01-01-2020','dd-MM-yyyy'),4);
insert into watch_lists(user_id,prime_id,status,likes,started_on,viewer_rating) values (12346814,12321,'completed',1,to_date('01-01-2020','dd-MM-yyyy'),8);
insert into watch_lists(user_id,prime_id,status,likes,started_on,viewer_rating) values (12346814,12322,'completed',1,to_date('01-01-2020','dd-MM-yyyy'),9);
update watch_lists set likes = 0 where user_id=12346814;
--to display all the movie watched and still watching by the customers

select * from watch_lists;
   USER_ID   PRIME_ID STATUS                    LIKES STARTED_ON                     VIEWER_RATING
---------- ---------- -------------------- ---------- ------------------------------ -------------
  12346812      12321 completed                     1 01-01-20 12:00:00.000000000 AM             9
  12346815      12324 completed                     1 01-01-20 12:00:00.000000000 AM             6
  12346812      12325 completed                     1 01-01-20 12:00:00.000000000 AM             4
  12346814      12321 completed                     0 01-01-20 12:00:00.000000000 AM             8
  12346814      12322 completed                     0 01-01-20 12:00:00.000000000 AM             9

select prime_id,count(*) from watch_lists  group by prime_id;
  PRIME_ID   COUNT(*)
---------- ----------
     12322          1
     12325          1
     12321          2
     12324          1
select prime_id,count(*) from watch_lists where likes = 1 group by prime_id;
| PRIME_ID | COUNT(*) |
|----------|----------|
| 12325    | 1        |
| 12321    | 1        |
| 12324    | 1        |

select name_of_video from prime_releases pp join (select prime_id,count(*) from watch_lists ww  group by prime_id) where pp.prime_id=ww.prime_id; 





```
