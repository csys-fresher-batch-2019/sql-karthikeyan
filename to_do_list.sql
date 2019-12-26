drop table to_do_list;
create table to_do_list(
status char(1) default 'N',
task_id no not null,
task_name varchar2(100) not null,
task_person varchar2(100) not null,
created_date date default SYSDATE not null,
deadline date not null,
modified_date date default SYSDATE not null,
completed_on date ,
priority_no no not null,
constraint task_id_pk primary key(task_id),
constraint deadline_ck check (deadline > SYSDATE),
constraint status_ck check( status in ('Y','N'))
constraint modified_date_ck check (modified_date > created_date)                                        
);
    
insert into to_do_list(task_id,task_name,task_person,deadline,priority_number)
                           value(1,'Install Bluewhale','ArjunKumarAE',to date('30-12-2020','dd-mm-yyyy'),10);
insert into to_do_list(task_id,task_name,task_person,deadline,priority_number)
                           value(2,'Install java','Rathnakumar',to date('10-02-2020','dd-mm-yyyy'),4);                           

select * from to_do_list;
