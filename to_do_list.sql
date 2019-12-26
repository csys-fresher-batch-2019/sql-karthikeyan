drop table to_do_list;
create table to_do_list(
status_check char(1),
task_id number not null,
task varchar2(100) not null,
by varchar2(100) not null,
deadline date not null,
completed_on date ,
constraint task_id_pk primary key(task_id),
constraint deadline_ck check (deadline>SYSDATE),
constraint status_check_ck check( status_check in ('Y','N'))
);

select * from to_do_list;
